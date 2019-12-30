clc;
clear;
close all;
load('topo.mat','topo','topomap1'); %load map
load spatialerror.dat;
x=reshape(spatialerror,30,34,13,8,4);
% x(j,i,t,l,k)
%note:the spatial variation is in the normal form, say x direction is from west to east, and the y direction is from south to north, 13 means 13 months, 8 means 8 El nino events, and last 4 means 4 varibles, say cnop-i cnop-p cnop-i+cnop-p cnop.


month=char(' Oct(-1)',' Jan(0)',' Apr(0)',' Jul(0)');
tit=char('    (a) CNOP-I','    (b) CNOP-P','(c) CNOP-I + CNOP-P','    (d) CNOP');
cont=[-.06,-0.04,-.02,.02,.04,.06;
.03,.09,.09,0.12,0.15,0.18;
-.5,-1.0,-1.5,-2.0,-2.5,-3.0;
];
clab=[-0.04,-.02,.02,.04,.06;
    0,.03,.06,.09,.15;
    -.5,-1.0,-1.5,-2.5,-3.5];
%tit(1,:)

for k=1:4
for t=1:4
 	subplot(4,4,(t-1)*4+k);


	x1=x(:,7:end,(t-1)*3+1,1,k);


	[c,h]=contour( x1,cont(3,:) );
	clabel(c,h,clab(3,:));

	if(t==2)
	[c,h]=contour( x1,[-0.1,-.3]);
	clabel(c,h);
	end

	if(k==2)
	[c,h]=contour( x1,cont(2,:) );  %if k==2, redraw and cover the old one
	clabel(c,h,clab(2,:));
	end

	if(t==1)
	[c,h]=contour( x1,cont(1,:) );
	clabel(c,h,clab(1,:));
	end



%	set the picture position
%	set(gca,'Position',[.2 .0 1 .4]); %position,[left,bottom,right,top]
	ch2=get(gca,'position');
	ch2(1)=ch2(1)-0.03;
	ch2(2)=ch2(2)-0.05;
	ch2(3)=ch2(3)+0.03;
	ch2(4)=ch2(4)+0.05;
	set(gca,'position',ch2);


	set(gca,'xtick',[]); %delete xtick and xticklabel
	set(gca,'ytick',[]);

	if (t==4)
	text([1.88889:20/5.625:26.77778],[1,1,1,1,1,1,1,1],{'140E','160E','180','160W','140W','120W','100W','80W'},'rotation',-45); %wrtie xticklabel, and turn it
%	set(gca,'xtick',[1.88889:20/5.625:26.77778]);
%	set(gca,'xticklabel',{'140E','160E','180','160W','140W','120W','100W','80W'});
%	rotateticklabel(gca,'x',-40);
	end
    
	if (k==1)
	set(gca,'ytick',[5.5:5:25.5]);
	set(gca,'yticklabel',{'20S','10S','EQ','10N','20N'});
	end

	if(t==1)
	title(tit(k,:),'FontSize',15);
	end


	h=axes('position',get(gca,'position')); %draw at the same position
 	h1=contour(topo(61:119,135:287),[0,0],'color',[.1,0.1,0.1]); %draw only when topo=0
    set(h,'color','none'); %important:color=none, set the map to be transparent.

	set(gca,'xtick',[]); %delete xtick and xticklabel
	set(gca,'ytick',[]);


	text(2,53,month(t,:));

	set(findobj('FontSize',10),'FontSize',15);

end
end


	
