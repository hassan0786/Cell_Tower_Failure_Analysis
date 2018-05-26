
clc;
clear all;

load('C.mat');
load ('D.mat');
lat1 = D(:,2);
lon1 = D(:,1);
lat = C(:,2);
   lon = C(:,1);
   hold on;
   
   plot(lon1, lat1, '*b', 'MarkerSize', 4)
   plot(lon, lat, '.r', 'MarkerSize', 5)
   legend('Crowed Source data','Filtered Towers = 1434','Location','NW')
  plot_google_map('MapScale', 1)
  hold off;