%Serie de Fourier para V(t)
clear all, clc
N=input('Valor para N: ');
a=0;
n=1;
t=[0:1*10^-10:4*10^-3];
for k=1:2:N
    v1=4*sin(n*pi/2);
    v2=cos(2000*pi*n*t);
    v3=n*pi/2;
    v=v1*v2/v3;
    a=a+v;
    n=n+2;
end
plot(t,a,'r');
xlabel('tiempo(s)');
ylabel('voltaje v(t)');
title('Serie de Fourier para v(t)');
grid on