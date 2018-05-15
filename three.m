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
%load('X.mat')