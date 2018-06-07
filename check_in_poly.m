cell = load('C.mat');
grd_lon_ = load('GRD_x.mat');
grd_lat_ = load('GRD_y.mat');

cell_lon = cell.C(:,1);
cell_lat = cell.C(:,2);

grd_lon = grd_lon_.len_x(:,1);
grd_lat = grd_lat_.len_y(:,1);

grd_dat = [];
grd_no = 0;
cent_dat = [];

for i = 1:1:max(size(grd_lon))
    for j = 1:1:max(size(grd_lat))
        if i+1 <= max(size(grd_lon)) && j+1 <= max(size(grd_lat))
            grd_no = grd_no + 1
            cent = [(grd_lon(i)+grd_lon(i+1))/2, (grd_lat(i)+grd_lat(i+1))/2];
            grd_dat(grd_no,1) = grd_no;
            
            grd_dat(grd_no,2) = grd_lon(i);
            grd_dat(grd_no,3) = grd_lon(i+1);
            grd_dat(grd_no,4) = grd_lat(j);
            grd_dat(grd_no,5) = grd_lat(j+1);
            
           
            cent_dat(grd_no,1) = cent(1);
            cent_dat(grd_no,2) = cent(2);
            
            grd_dat(grd_no,6) = readfileelement('nasa.asc',cent(2),cent(1));
            t = 0;
            for k = 1:1:max(size(cell_lon))
                k
                [in, on] = inpolygon(cell_lon(k), cell_lat(k), [grd_lon(i),grd_lon(i+1)], [grd_lat(j),grd_lat(j+1)]);
                if in == 1 || on ==1
                    t = t+1;
                    cell_lon(k) = 0;
                    cell_lat(k) = 0;
                end
            end
            grd_dat(grd_no,7) = t;
            grd_no
        end
    end
end


            
            
        