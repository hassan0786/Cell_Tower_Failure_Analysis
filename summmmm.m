load('dist.mat');
t = 1:1:1433;
total_tower = sum(t);
s = 0;
for i = 2:1:1434
    ds = dist(i:1434,i-1);
    gh = sum(sum(ds));
    
    s = s + gh;
end
avg_dist_between_towers = s/total_tower