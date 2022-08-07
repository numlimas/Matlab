%Serie de Fourier para g(t)
clear all, clc
N=input('Valor para N : ');
a=0;
n=1;
t=[0:0.0001:4*10-3];
for k=1:2:N
    g1=16*sin(n*2000*pi*t);
    g2=n*pi;
    g=g1/g2;
    a=a+g;
    n=n+2;
end
plot(t,a,'b');
xlabel('tiempo(s)');
ylabel('g(t)');
title('Serie de Fourier para g(t) con N=9');
grid on