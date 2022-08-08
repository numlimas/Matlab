disp('Resolver ecuaciones usando la ecuación cuadrática')
disp('(aX^2)+bX+c=0')
disp('Debe ingresar valores númericos de a,b y c')
a=input('Valor de a: ');
b=input('Valor de b: ');
c=input('Valor de c: ');
D=((b^2)-(4*(a*c)));
x1=((-b+(sqrt(D)))/(2*a));
x2=((-b-(sqrt(D)))/(2*a));
%s1= ['La raíz de x1 es: ', num2str(x1)];
%s2= ['La raíz de x2 es: ', num2str(x2)];
%s3= ['La raíz es: ', num2str(x1)];
%s4= ['La raíz es: ', num2str(x1)];
if D>0
    disp('La ecuación tiene dos raíces')
    fprintf('La raíz de x1= %f\n', x1)
    fprintf('La raíz de x2= %f\n', x2)
    %disp(s1)
    %disp(s2)
    %fprint('Las raíz de x2=','%f\n', x2)
    
elseif D==0 
    disp('La ecuación tiene una raíz')
    fprintf('La raíz de x= %f\n', x1)
    %disp(s3)
else
    disp('La ecuación tiene no tiene raíces reales')     
end