clc;clf
clear all;close all;


    
clear sind eind meind

sind=find(pres==midpres(1));%观察深度最小值的INDEX(pres=【0,0.25,5000】）


temperature(maxiend:end,:)=[]; %delete dimesions


fill([0;sectiondist;sectiondist(end)*(1+0.02)],[pres(end);depth_all;pres(end)],[0.5 0.5 0.5]);


axes('fontsize',fontsize,'fontname',fontname);

else
    error('input incorrect');
end


%for temperature
    figure('position',[1 1 1440 792]);
    axes('fontsize',fontsize,'fontname',fontname);
    [c,h]=contourf(xx,yy,temp,[0:30]);
    caxis([min(temperature(:)) max(temperature(:))]);
    colorbar;


axis tight
axis ij
axis xy



