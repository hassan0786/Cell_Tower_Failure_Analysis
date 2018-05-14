%M = csvread('orange_csv.txt');
%plot(M(:,1), M(:,2), '--b', 'MarkerSize',10)
% 
%     fname = 'orange_csv.txt';
%     fid = fopen(fname);
%     C = textscan(fid);
%     fclose(fid);
clear
close all
clc
% filestr = fileread('raw_data.txt'); %Read the string from file
% filebyline = regexp(filestr, ' ', 'split'); % Split each coordinate sample
% filebyline( cellfun(@isempty,filebyline) ) = [];    % create an array strut to be popped later
% filebyfield = regexp(filebyline, '\,', 'split');    % separate latitute and longitude (delimited by comma)
% numfields = cellfun(@length, filebyfield);          % check if all vals are alphanumeric (omit garbage)
% maxfields = max(numfields);                         % length of total sample cooridnates
% fieldpattern = repmat({[]}, 1, maxfields);          % length of non-alphanumeric vals
% firstN = @(S,N) S(1:N);                             % get the first val from the struct
% filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0); 
% fieldarray = vertcat(filebyfield{:});
% 
% numarray = str2double(fieldarray);
load('dade_boxed.mat')
numarray(:,1) = boundary_x';
numarray(:,2) = boundary_y' ;
%

plot(boundary_x, boundary_y, 'r', 'LineWidth', 2)

% generate random points
a_x_u = max (numarray(:,1));
a_x_d = min (numarray(:,1));
x_pnt = a_x_u + (a_x_d - a_x_u).*rand(50,1);
x_pnt = x_pnt';

a_x_u_ = min (numarray(:,2));
a_x_d_ = max (numarray(:,2));
y_pnt = a_x_u + (a_x_d - a_x_u).*rand(50,1);
y_pnt = y_pnt';

hold on
grid on
%plot(x_pnt, y_pnt,'bo')


x1=a_x_d-0.05
x2=a_x_u+0.05
y1=a_x_d_+0.05
y2=a_x_u_-0.05
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
plot(x, y, 'b-', 'LineWidth', 1);
hold on;







% lat_new = lat';
% lon_new = lon';





% for i = 1:1:length(lat_new)
%     [in, on] = inpolygon(lon_new(i), lat_new(i), x, y);
%     if in == 1 || on == 1
%         %plot(x_pnt(i), y_pnt(i),'bo')
%         in_point_x = [in_point_x, lon_new(i)];
%         in_point_y = [in_point_y, lat_new(i)];
%         %plot(x_pnt, y_pnt,'ko')
%     end
%     
% %     if in == 0 && on == 0
% %         %plot(x_pnt(i), y_pnt(i),'bo')
% %         out_point_x = [out_point_x, x_pnt(i)];
% %         out_point_y = [out_point_y, y_pnt(i)];
% %         %plot(x_pnt, y_pnt,'ko')
% %     end
%     in = 0;
%     on = 0;
% end
%clearvars -except boundary_x boundary_y x_pnt y_pnt in_point_x in_point_y out_point_x out_point_y
%plot(in_point_x, in_point_y,'bo', 'LineWidth', 2)
% plot(out_point_x, out_point_y,'kx', 'MarkerSize', 7, 'LineWidth', 2)
inx_ = [];
iny_ = [];
outx_ = [];
outy_ = [];


for k = 1:1:length(in_point_x)
    [in, on] = inpolygon(in_point_x(k), in_point_y(k), boundary_x, boundary_y);
    if in == 1 || on == 1
        %plot(x_pnt(i), y_pnt(i),'bo')
        inx_ = [inx_, in_point_x(k)];
        iny_ = [iny_, in_point_y(k)];
        %plot(x_pnt, y_pnt,'ko')
    end
    
    if in == 0 && on == 0
        %plot(x_pnt(i), y_pnt(i),'bo')
        outx_ = [outx_, in_point_x(k)];
        outy_ = [outy_, in_point_y(k)];
        %plot(x_pnt, y_pnt,'ko')
    end
    in = 0;
    on = 0;
end
plot(outx_, outy_,'k*', 'LineWidth', 1)
plot(inx_, iny_,'bo', 'LineWidth', 1)
%plot(outx_, outy_,'k*', 'LineWidth', 1)
x = inx_';
y = iny_';

% k = boundary(x, y);
% hold on
% plot(x(k),y(k))


% xx = inx_;
% yy = iny_;
% [X,Y] = pol2cart(xx,yy);
% K = convhull(X,Y);
% plot(X(K),Y(K),'r-',X,Y,'b*')

%plot(inx_,iny_,'b*');
k=convhull(inx_,iny_);
%subplot(1,2,2);
%plot(inx_(k),iny_(k),'-')
load('X.mat')

%=========================================================
% opts = statset('Display','final');
% [idx,C] = kmeans(X,1400,'Distance','cityblock',...
%     'Replicates',3,'Options',opts);
% %plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',1)
% hold on
% %plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',1)
% 
% plot(C(:,1),C(:,2),'yd',...
%     'MarkerSize',6,'LineWidth',2) 
% %legend('Cluster 1','Cluster 2','Centroids',...
% %       'Location','NW')
% %title 'Cluster Assignments and Centroids'
% grid on
% hold off
%=========================================================
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'x',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
