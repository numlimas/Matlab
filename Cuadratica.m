disp('Resolver ecuaciones usando la ecuaci�n cuadr�tica')
disp('(aX^2)+bX+c=0')
disp('Debe ingresar valores n�mericos de a,b y c')
a=input('Valor de a: ');
b=input('Valor de b: ');
c=input('Valor de c: ');
D=((b^2)-(4*(a*c)));
x1=((-b+(sqrt(D)))/(2*a));
x2=((-b-(sqrt(D)))/(2*a));
%s1= ['La ra�z de x1 es: ', num2str(x1)];
%s2= ['La ra�z de x2 es: ', num2str(x2)];
%s3= ['La ra�z es: ', num2str(x1)];
%s4= ['La ra�z es: ', num2str(x1)];
if D>0
    disp('La ecuaci�n tiene dos ra�ces')
    fprintf('La ra�z de x1= %f\n', x1)
    fprintf('La ra�z de x2= %f\n', x2)
    %disp(s1)
    %disp(s2)
    %fprint('Las ra�z de x2=','%f\n', x2)
    
elseif D==0 
    disp('La ecuaci�n tiene una ra�z')
    fprintf('La ra�z de x= %f\n', x1)
    %disp(s3)
else
    disp('La ecuaci�n tiene no tiene ra�ces reales')     
end