load('dade_boxed.mat')
numarray(:,1) = boundary_x';
numarray(:,2) = boundary_y' ;

plot(boundary_x, boundary_y, 'r', 'LineWidth', 2)


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
plot(x_pnt, y_pnt,'bo')


x1=a_x_d-0.05
x2=a_x_u+0.05
y1=a_x_d_+0.05
y2=a_x_u_-0.05
x = [x1, x2, x2, x1, x1];
y = [y1, y1, y2, y2, y1];
plot(x, y, 'b-', 'LineWidth', 1);
hold on;



 for i = 1:1:length(lat_new)
     [in, on] = inpolygon(lon_new(i), lat_new(i), x, y);
     if in == 1 || on == 1
         plot(x_pnt(i), y_pnt(i),'bo')
         in_point_x = [in_point_x, lon_new(i)];
         in_point_y = [in_point_y, lat_new(i)];
         plot(x_pnt, y_pnt,'ko')
     end
     
      if in == 0 && on == 0
          plot(x_pnt(i), y_pnt(i),'bo')
          out_point_x = [out_point_x, x_pnt(i)];
          out_point_y = [out_point_y, y_pnt(i)];
          plot(x_pnt, y_pnt,'ko')
      end
     in = 0;
     on = 0;
 end
clearvars -except boundary_x boundary_y x_pnt y_pnt in_point_x in_point_y out_point_x out_point_y
plot(in_point_x, in_point_y,'bo', 'LineWidth', 2)
plot(out_point_x, out_point_y,'kx', 'MarkerSize', 7, 'LineWidth', 2)
inx_ = [];
iny_ = [];
outx_ = [];
outy_ = [];