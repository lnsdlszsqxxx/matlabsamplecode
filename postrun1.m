%written by liang, Apr 6, 2012
%draw tendencies of the four varibles
clc;
clear;
close all;
load error.dat;
x=reshape(error,13,8,8,4);
%note:13 means 13 months, the first 8 means 8 El nino events, the second 8 means 8 different initial months, and last 4 means 4 varibles, say cnop-i cnop-p cnop-i+cnop-p cnop.
tit=char('(a) Jul(-1)','(b) Oct(-1) ','(c) Jan(0)  ','(d) Apr(0)  ','(a) Jul(0)','(b) Oct(0)','(c) Jan(1)','(d) Apr(1)');
xlab=char('JAS','OND','JFM','AMJ','JAS','OND','JFM','AMJ','JAS','OND','JFM');
%tit(1,:)


for k=1:4
  subplot(2,2,k);
    


for l=1:4
for j=1:8

for i=1:12
temp(i,j,k,l)=x(i+1,j,k,l)-x(i,j,k,l);
end

for i=1:4
tendency(i,j,k,l)=mean( temp(3*(i-1)+1:3*(i-1)+3,j,k,l) );
end

end
end

for j=1:8
for l=1:4
for i=1:4
barvalue(i,l,j,k)=tendency(i,j,k,l);
end 
end
end

for l=1:4
for i=1:4
barvaluemean(i,l,k)=mean(barvalue(i,l,:,k));
errorup(i,l,k)=max(barvalue(i,l,:,k))-barvaluemean(i,l,k);
errorlow(i,l,k)=barvaluemean(i,l,k)-min(barvalue(i,l,:,k));
end 
end



hold on;
h=barweb_yu(barvaluemean(:,:,k),errorlow(:,:,k),errorup(:,:,k),1);
ch=get(h.bars,'children');
set(gca,'xticklabel',{xlab(k,:),xlab(k+1,:),xlab(k+2,:),xlab(k+3,:)},'fontsize',22);
set(gca,'fontsize',22);
%check property name:set(ch{1}) or set(handle) or set(ch(1)) or get(handle)
%set(ch{1});
%check posible property value:set(ch{1},'property') or set(handle,'property')
%set(ch{1},'linestyle');

%set(gca,'fontweight','bold');


set(ch{1},'linestyle','-','Edgecolor','g');
set(ch{2},'linestyle','-','Edgecolor','black');
set(ch{3},'linestyle','-','Edgecolor','r');
set(ch{4},'linestyle','-','Edgecolor','b');



%set(gcf,'Position',[200 100 260 220]);
ch2=get(gca,'position');
ch2(1)=ch2(1)-0.04;
ch2(3)=ch2(3)+0.08;
set(gca,'position',ch2);
%set(gca,'Position',[.2 .0 1 .4]); %position,[left,bottom,rigth,top]
%figure_FontSize=8;
%set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
%set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
%set(findobj('FontSize',10),'FontSize',figure_FontSize); %change fontsize=20 for every handle whose fontsize=10.
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2); %same as above



title(tit(k,:),'fontsize',24);


end


 h=legend('cnop-i','cnop-p','cnop-i + cnop-p','cnop');
ch=get(h,'children');
%%set(ch(4),'Edgecolor','b')  %check ch
ch2=get(ch,'children');
%% set(ch2{1});  %check ch2


set(ch2{1},'linestyle','-','Edgecolor','b');
set(ch2{3},'linestyle','-','Edgecolor','r');
set(ch2{5},'linestyle','-','Edgecolor','black');
set(ch2{7},'linestyle','-','Edgecolor','g');


h=text(-7.5,-0.5,'Seasonal Growth Tendency','fontsize',24);
set(h,'rotation',90);

%F=getframe(gca);
%print(gcf,'-depsc','tendency');
print('-dpsc', '-r200', 'untiltle.png')
