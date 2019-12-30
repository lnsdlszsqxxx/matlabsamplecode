%written by liang, Apr 5, 2012      
%this program needs the same data as postrun*.m
clc;
clear;
load error.dat;
x=reshape(error,13,8,8,4);
%note:13 means 13 months, the first 8 means 8 El nino events, the second 8 means 8 different initial months, and last 4 means 4 varibles, say cnop-i cnop-p cnop-i+cnop-p cnop.
tit=char('(a) July(-1)','(b) Oct(-1) ','(c) Jan(0)  ','(d) Apr(0)  ','(a) July(0)','(b) Oct(0)','(c) Jan(1)','(d) Apr(1)');
%tit(1,:)


for k=1:1
%  subplot(2,2,k)
    
for i=1:12

temp(i)=mean(x(i+1,:,k,4)-x(i,:,k,4));
L(i)=min(x(i+1,:,k,4)-x(i,:,k,4)-temp(i));
U(i)=max(x(i+1,:,k,4)-x(i,:,k,4)-temp(i));
end

hold on;
h=bar(rand(4,4),'w');
ch=get(h,'children');

%check property name:set(ch{1}) or set(handle) or set(ch(1)) or get(handle)
%set(ch{1});

%check posible property value:set(ch{1},'property') or set(handle,'property')
%set(ch{1},'linestyle');


set(ch{1},'linestyle',':');
set(ch{2},'linestyle','--');
set(ch{3},'linestyle','-');
set(ch{4},'linestyle','-.');


h=legend('cnop-i','cnop-p','cnop-i+cnop-p','cnop');
ch=get(h,'children');
%set(ch(1))  %check ch
ch2=get(ch,'children');
%set(ch2{1})  %check ch2
set(ch2{1},'linestyle','-.');
set(ch2{3},'linestyle','-');
set(ch2{5},'linestyle','--');
set(ch2{7},'linestyle',':');

%ch3=get(ch2{1},'children') %Empty matrix:0-by-1 means no children any more

%figure(2);
%hide line when using errorbar
%hold on;
%bar(temp);
%errorbar(1:12,temp,L,U,'Marker','none','LineStyle','none'); 

%delete(h) %delete the handle of legend

%LineStyle
%{-} | -- | : | -. | none

xlabel('El Nino events','fontsize',20);

title(tit(k,:),'fontsize',20);


end


