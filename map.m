%2013.3.3 for Jingjing Li
clc;
clear;
close all;
%load('topo.mat','topo','topomap1'); %load map


% h1=contour(topo(61:180,287:360),[0,0],'color',[.1,0.1,0.1]); %draw only when topo=0
figure1 = figure('Color',[1 1 1]);
y1=40;
y2=70;
x1=-80;
x2=20;
%worldmap([y1 y2],[x1 x2]);
h1=axesm('MapProjection','mercator','maplatlimit',[y1 y2],'maplonlimit',[x1 x2],'frame','on','parallellabel','on',...
'meridianlabel','on','flinewidth',1,'plabellocation',5,'mlabellocation',10,...
'frame','on','gcolor',[.5 .5 .5],'fedgecolor',[0 0 0]);
%setm(h1,'fedgecolor',[0 0 0]);
%grid off;
set(gca,'zcolor',[.5 .5 .5]);
h=geoshow('landareas.shp');
%set(gca,'position',[-0.2 -0.1 1.3 1.4]); [0.13 0.11 0.775 0.815]
%imwrite(I,'1.jpg')
