clc;
clear;
close all;
a=[2,2;3,4];
errorl=[0.1,0.1;0.2,0.2];
erroru=[0.3,0.3;1,1];
%bar(a);

barweb_yu(a,errorl,erroru);
legend('1','2');