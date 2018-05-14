% Pre-Processed Data
clear
close all
clc
load('dade_boxed.mat')
plot(boundary_x,boundary_y, 'b')
hold on
grid on
plot(x,y,'r')

county_x = [];
county_y = [];
box_x = [];
box_y =[];
%plot(in_point_x, in_point_y, 'ro')

for i = 1:1:length(in_point_x)
    [in, on] = inpolygon(in_point_x(i), in_point_y(i), boundary_x,boundary_y);
    
    if in == 1 || on == 1
        county_x = [county_x, in_point_x(i)];
        county_y = [county_y, in_point_y(i)];
    else
        box_x = [box_x, in_point_x(i)];
        box_y = [box_y, in_point_y(i)];
    end
    in = 0;
    on = 0;
end

plot(county_x,county_y,'bo', 'LineWidth',0.5)
plot(box_x,box_y,'ko', 'LineWidth',0.5)
%xlabel('Inside County BS: %d', length(county_x));
%ylabel('Boxed around County BS: %d', length(box_x));