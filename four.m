%Step:4_K means and closest points
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
[idx,C] = kmeans(X,1434,'Distance','cityblock',...
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
