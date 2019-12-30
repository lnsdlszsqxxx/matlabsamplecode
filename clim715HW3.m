clear all;
clc;
n(1:4)=[20,40,60,80];
%n(1:4)=[4,6,7,10];
dt=0.1;
u(1)=1;
c(1:4)=['bgrk'];

for(k=1:4)
w=2*pi/(n(k)*dt);
a=i*dt*w;
for(t=1:n(k)-1)
%   u(t+1)=(1+a)*u(t);    %case 1
   u(t+1)=1/(1-a)*u(t); %case 2
%   u(t+1)=(1+a/2)/(1-a/2)*u(t); %case 3
%   u(t+1)=(1+a+a^2)*u(t); %case 4
end

%subplot(2,2,k)
h(k)=plot(1:n(k),abs(u),c(k));
axis([0 n(4)+1 0.38 1]);
title(strcat(  'Case 1: n=',num2str(n(k)),',  w=',num2str(w)  ))
title('Case 2 for different \omega')
ylabel('amplitude')
xlabel('time step')
hold on;
end
legend(h,'\omega = 3.14','\omega = 1.57','\omega = 1.05','\omega = 0.79',4)
% a=0:0.01:1.1;
% y=(a.^4-a.^2+1).^0.5;
% plot(a,y)
% title(strcat(  'amplitude growth rate = ( (\omega*\Deltat)^4 - (\omega*\Deltat)^2 + 1 )^1^/^2'  ))
% ylabel('amplitude growth rate = u(t+1)/u(t)')
% xlabel('\omega*\Deltat')

