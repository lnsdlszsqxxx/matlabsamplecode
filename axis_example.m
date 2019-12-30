x=1:8;
subplot(2,2,1)
plot(x)
%tick style 0(auto)
subplot(2,2,2)
plot(x)
set(gca,'xtick',[1 3 6 8]);%style 1
set(gca,'ytick',[]);%style 2
subplot(2,2,3)
plot(x)
set(gca,'xtick',[1 3 6 8]);
set(gca,'xticklabel',sprintf('%03.4f|',get(gca,'xtick')));%style 3
set(gca,'ytick',[2 4 5 7]);
set(gca,'yticklabel',{'Two','Four','Five','Seven'});%style 4
subplot(2,2,4)
plot(x)
set(gca,'xminortick','on');%style 5
set(gca,'ticklength',[0.05 0.025]);%style 6
set(gca,'tickdir','out');%style 7
