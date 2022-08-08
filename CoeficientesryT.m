clear all
clc
%Calcular coeficientes de reflexi�n y transmisi�n 
%Es necesario tener impedancias, indices de refracci�n, 
%angulos de ki y ktde ambos medios

%coef. reflexi�n
P=input('Incidencia normal u oblicua? (Normal=1/Oblicua=0): ');
if P==1
%Incidencia normal
disp('El coeficiente de reflexi�n es: ')
rn=(ni2-ni1)/(ni2+ni1)
disp('El coeficiente de transmisi�n es: ')
tn=(2*(ni2))/(ni2+ni1)
else P=input('Polarizaci�n paralela o perpendicular? (Paral=1/Perp=0): ');
if P==1
%Polarizaci�n paralela
thetain=input('Ingrese el valor del angulo theta incidente: ')
thetatr=input('Ingrese el valor del angulo theta transmitido: ')
ni1=input('Ingrese el valor de la impedancia intrinseca en el medio 1: ')
ni2=input('Ingrese el valor de la impedancia intrinseca en el medio 2: ')
disp('El coeficiente de reflexi�n paralelo es: ')
r11=((ni2*cos(thetatr))-(ni1*cos(thetain)))/((ni2*cos(thetatr))+(ni1*cos(thetain)))
disp('El coeficiente de transmisi�n paralelo es: ')
T11=((2*ni2*cos(thetain)))/((ni2*cos(thetatr))+(ni1*cos(thetain)))
disp('Comprobaci�n 1={T11*(cos(thetatr)/cos(thetain))}-r11 : ')
r=T11*((cos(thetatr))/(cos(thetain)))-r11 

else 
%Polarizaci�n perpendicular
thetain=input('Ingrese el valor del angulo theta incidente: ')
thetatr=input('Ingrese el valor del angulo theta transmitido: ')
ni1=input('Ingrese el valor de la impedancia intrinseca en el medio 1: ')
ni2=input('Ingrese el valor de la impedancia intrinseca en el medio 2: ')
disp('El coeficiente de reflexi�n perpendicular es: ')
r1=((ni2*cos(thetain))-(ni1*cos(thetatr)))/((ni2*cos(thetain))+(ni1*cos(thetatr)))
disp('El coeficiente de transmisi�n perpendicular es: ')
T1=((2*ni2*cos(thetain)))/((ni2*cos(thetain))+(ni1*cos(thetatr)))
disp('Comprobaci�n 1={T11*(cos(thetatr)/cos(thetain))}-r11 : ')
r=T1-r1
end
end
