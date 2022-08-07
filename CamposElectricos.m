clear all
clc
syms x y z ar
eps=8.854*10^(-12);

disp('Bienvenido, este programa le ayudará a calcular campos electricos.')
disp('Campos electricos debido a un conductor, un plano infinito de carga y una esfera.')
disp('Para calcular el E debido a un conductor en el eje z ingrese 1.')
disp('Para calcular el E debido a un plano infinito de carga ingrese 2.')
disp('Nota: Seguir indicaciones mostradas en parantesis al ingresar datos.')
Y=input('Su elección es: ');

switch Y
    case 1
%Campo electrico en conductor
%Campo electrico en conductor sobre z
Pl=input('Defina el valor de Pl (C/m): ');
e=input('Defina el eje sobre el cual esta ubicado el conductor (x, y o z): ');
vpl=input('Defina el punto donde quiere calcular el campo electrico [x y z]: ');
%Calculamos el vector distancia entre el punto y el conductor que está en z
if e==x;
    rpl=[1 0 0];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
    
elseif e==(-x);
    rpl=[-1 0 0];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
    
elseif e==y;
    rpl=[0 1 0];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
    
elseif e==(-y);
    rpl=[0 -1 0];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
   
elseif e==z;
    rpl=[0 0 1];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
    
else e==(-z);
    rpl=[0 0 -1];
    ap=[vpl]-[rpl];
    p=sqrt(((ap(1))^2)+((ap(2))^2)+((ap(3))^2));
    Epl=(Pl/(2*pi*eps*(p^2)))*[ap]
  
end

    case 2
%Campo electrico para plano en x=2
Ps=input('Defina el valor de Ps (C/m^2): ');
e=input('Defina el eje sobre el cual esta ubicado el plano (x, y o z): ');
l=input('Defina la ubicación de la lámina infinita de carga [x y z]: ');
p=input('Defina el punto donde quiere calcular el campo electrico [x y z]: ');
if e==x & l(1)>p(1);
    r1=[-1 0 0];
    Eps=Ps/(2*eps)*(r1)
elseif e==x & l(1)<p(1);
    r1=[1 0 0];
    Eps=Ps/(2*eps)*(r1)
elseif e==y & l(2)>p(2);
    r1=[0 -1 0];
    Eps=Ps/(2*eps)*(r1)
elseif e==y & l(2)<p(2);
    r1=[0 1 0];
    Eps=Ps/(2*eps)*(r1)    
elseif e==z & l(3)>p(3);
    r1=[0 0 -1];
    Eps=(Ps/(2*eps))*(r1)
else e==z & l(3)<p(3);
    r1=[0 0 1];
    Eps=(Ps/(2*eps))*(r1)
end
    
    case 3
%Campo electrico debido a una esfera
Q=input('Defina el valor de la carga (C): ');
a=input('Defina el valor del radio de la esfera (m): ');
R=input('Defina el punto donde quiere hallar el campo en metros [R]: ');        
A=(4*pi*(a^3))/3;
Pv=Q/A

if R(1)<a;
 Er=((R(1)*Pv)/3)
else R(1)>=a;
 Er=(((a^3)*Pv)/(3*(R^2)))
end

    case 4
        disp('No está disponible')

end



