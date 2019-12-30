clc;
clear;
close all;
load error.dat;
x=reshape(error,13,8,8,4);
%note:13 means 13 months, the first 8 means 8 El nino events, the second 8 means 8 different initial months, and last 4 means 4 varibles, say cnop-i cnop-p cnop-i+cnop-p cnop.
tit=char('(a) Jul(-1)','(b) Oct(-1) ','(c) Jan(0)  ','(d) Apr(0)  ','(a) Jul(0)','(b) Oct(0)','(c) Jan(1)','(d) Apr(1)');
%tit(1,:)
for k=1:4
  subplot(2,2,k);
    
for i=1:8
for j=1:4
temp(i,j)=x(13,i,k,j);
end
end

bar(temp,1);
%legend('\fontsize{15}cnop-i','\fontsize{15}cnop-p','\fontsize{15}cnop-i+cnop-p','\fontsize{15}cnop');

%applyhatch(gcf,'\|x.');

ch2=get(gca,'position');
ch2(1)=ch2(1)-0.08;
ch2(3)=ch2(3)-0.02;
set(gca,'position',ch2,'box','off');

if(mod(k,4)==3|mod(k,4)==0) 
    xlabel('El Nino events','fontsize',20);
end
%ylabel('Prediction errors','fontsize',15);
title(tit(k,:),'fontsize',22);

set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
set(findobj('FontSize',10),'FontSize',19);

end

leg=legend('cnop-i','cnop-p','cnop-i + cnop-p','cnop','box','off');
set(leg,'fontsize',10);
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
set(findobj('FontSize',10),'FontSize',20);

h=text(-15.06,24.5,'Prediction Errors','fontsize',24);
set(h,'rotation',90);
