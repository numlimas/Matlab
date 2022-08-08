-.MEDIOS DE TRANSMISION
clear all
clc
syms x y z t
ur=input('Ingrese el valor de la permeabilidad: ')
er=input('Ingrese el valor de la permitividad: ')
O=input('Ingrese el valor de la conductividad: ')
f=input('Ingrese el valor de la frecuencia: ')
Eo=input('Ingrese el valor del Campo Electrico: ')
k=input('Ingrese el vector de propagación: ')

%vector de propagación
ak=(k/norm(k));
kr=(k(1)*x)+(k(2)*y)+(k(3)*z);
ae=Eo/(norm(Eo));
ah=cross(ak,ae);

%permeabilidad en el vacio
uo=1.256637061*10^-6;
u=ur*uo;

%permitividad en el vacio
eo=8.854187817*10^-12;
e=er*eo;

%frecuencia
w=2*pi*f;

%ecuacion de alfa
a=w*sqrt(((u*e)/2)*(sqrt(1+((O/(w*e))^2))-1))

%ecuacion de beta
b=w*sqrt(((u*e)/2)*(sqrt(1+((O/(w*e))^2))+1))

%ecuacion de impedancia intrinseca
n=(sqrt(u/e))/((1+((O/(w*e))^2))^(1/4))
tetha=((atan(O/(w*e)))/2)*(180/pi)

%ecuacion de la tangente de perdida
TanPerd=O/(w*e);
if er==1 && ur==1 && O==0
disp('El Vacio')
else if TanPerd<0.1
disp('Es un Dielectrico Sin Perdidas')
else if TanPerd>10
disp('Buen Conductor')
else disp(' Es un Dielectrico Disipativo')
    end
    end
end

P=input('Quiere saber E y H en ese medio? (Si=1/No=0): ');
if P==1
l=((w*t)-(kr));
l1=vpa(l,3);
Et=Eo*(exp(-a*kr))*(cos(l1));
disp('El Campo Electrico es: ')
E=vpa(Et,3)
Ho=norm(Eo)/n;
m=(w*t)-(kr)-(tetha);
m1=vpa(m,3);
Ht=(Ho*(exp(-a*kr))*(cos(m1)))*ah;
disp('El Campo Magnetico es: ')
H=vpa(Ht,3)
else 
disp('Bye')
end
