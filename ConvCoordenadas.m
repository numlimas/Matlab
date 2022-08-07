clc
clear all
%Variables a usar
syms x y z p phi r tet ph
%Valiabres expresadas en diferentes sistemas de coordenadas

%Variables cil(esf)
Pesf=r*sin(tet);
zesf=r*cos(tet);
%Variables cart(esf)
rc=sqrt((x^2)+(y^2)+(z^2));
stet=sqrt((x^2)+(y^2))/sqrt((x^2)+(y^2)+(z^2));
ctet=z/sqrt((x^2)+(y^2)+(z^2));


%Informaci�n acerca del script
fprintf('Bienvenido al conversor de vectores variantes.\n')
fprintf('Tenga en cuenta la manera de declarar variables. Para C. Cartesianas: x, y, z. \n')
fprintf('Para C. Cil�ndricas: p, phi, z. Por �ltimo, para C. Esf�ricas: r, tet, phi \n')
fprintf('Para transformar un vector de coordenadas cartesianas a otros sistemas teclee 1.\n');
fprintf('Para transformar un vector de coordenadas cil�ndricas a otros sistemas teclee 2.\n');
fprintf('Para transformar un vector de coordenadas esf�ricas a otros sistemas teclee 3.\n');
sw=input('Su selecci�n es: ');
switch sw
    case 1
        fprintf('Vector en coordenadas cartesianas a otros sistemas\n')
        Ax=input('Componente en Ax: ');
        Ay=input('Componente en Ay: ');
        Az=input('Componente en Az: ');
        
        A=[Ax Ay Az]
        
        %Variables cart(cil)
        xcil=p*cos(phi);
        ycil=p*sin(phi);
        %Resoluci�n de matriz de converci�n Cart a Cil
        Apcart=((cos(phi))*Ax)+((sin(phi))*Ay);
        Aphcart=-((sin(phi))*Ax)+((cos(phi))*Ay);
        Acilcart=[Apcart, Aphcart, Az];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas cil�ndricas: ')
        Acil=subs(Acilcart,[x y],[xcil ycil])
        
        %Variables cart(esf)
        xesf=r*sin(tet)*cos(phi);
        yesf=r*sin(tet)*sin(phi);
        zesf=r*cos(tet);
        %Resoluci�n de matriz de converci�n Cart a Esf
        Arcart=((sin(tet)*cos(phi))*Ax)+((sin(tet)*sin(phi))*Ay)+((cos(tet))*Az);
        Atcart=((cos(tet)*cos(phi))*Ax)+((cos(tet)*sin(phi))*Ay)-((sin(tet))*Az);
        Aphicart=-((sin(phi))*Ax)+((cos(phi))*Ay);
        Aesfcart=[Arcart, Atcart, Aphicart];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas esf�ricas: ')
        Aesf=subs(Aesfcart,[x y z],[xesf yesf zesf])
        
    case 2
        fprintf('Vector en coordenadas cil�ndricas a otros sistemas\n')
        Ap=input('Componente en Ap: ');
        Aph=input('Componente en Aphi: ');
        Az=input('Componente en Az: ');
        
        A=[Ap Aph Az]
        
        %Variables cil(cart)
        Pcil=sqrt((x^2)+(y^2));
        cphi=x/(sqrt((x^2)+(y^2)));
        sphi=y/(sqrt((x^2)+(y^2)));
        %Resoluci�n de matriz de converci�n Cil a Cart
        Axcart=((cos(phi))*Ap)-((sin(phi))*Aph);
        Aycart=((sin(phi))*Ap)+((cos(phi))*Aph);
        Acilcart=[Axcart, Aycart, A(3)];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas cartesianas: ')
        Acar=subs(Acilcart,[p cos(phi) sin(phi)],[Pcil cphi sphi])
        
        %Variables esf(cil)
        pesf=r*sin(tet);
        zesf=r*cos(tet);
        %Resoluci�n de matriz de converci�n Cil a Esf
        Aresf=((sin(tet))*Ap)+((cos(tet))*Az);
        Atet=((cos(tet))*Ap)-((sin(tet))*Az);
        Acilesf=[Aresf,Atet,Aph];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas esf�ricas: ')
        Aes=subs(Acilesf,[p z],[pesf zesf])
        
            
    case 3
        fprintf('Vector en coordenadas esf�ricas a otros sistemas\n')
        Ar=input('Componente en Ar: ');
        Atet=input('Componente en Atet: ');
        Aphi=input('Componente en Aphi: ');
        
        A=[Ar Atet Aphi]
        
        %Variables cart(esf)
        cphi=x/(sqrt((x^2)+(y^2)));
        sphi=y/(sqrt((x^2)+(y^2)));
        ct=z/(sqrt((x^2)+(y^2)+(z^2)));
        st=(sqrt((x^2)+(y^2)))/(sqrt((x^2)+(y^2)+(z^2)));
        res=sqrt((x^2)+(y^2)+(z^2));
        %Resoluci�n de matriz de converci�n Esf a Cart
        Axcar=((sin(tet)*cos(phi))*Ar)+((cos(tet)*cos(phi))*Atet)-((sin(phi))*Aphi);
        Aycar=((sin(tet)*sin(phi))*Ar)+((cos(tet)*sin(phi))*Atet)+((cos(phi))*Aphi);
        Azcar=((cos(tet))*Ar)-((sin(tet))*Atet);
        Aesfcart=[Axcar, Aycar, Azcar];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas cartesianas: ')
        Acr=subs(Aesfcart,[cos(phi) sin(phi) cos(tet) sin(tet) r],[cphi sphi ct st res])
        
        %Variables cil(esf)
        resf=sqrt((p^2)+(z^2));
        stesf=p/sqrt((p^2)+(z^2));
        ctesf=z/sqrt((p^2)+(z^2));
        %Resoluci�n de matriz de converci�n Esf a Cil
        Apcil=((sin(tet))*Ar)+((cos(tet))*Atet);
        Azc=((cos(tet))*Ar)-((sin(tet))*Atet);
        Aesfcil=[Apcil Aphi Azc];
        %Substituci�n de variables
        fprintf('Vector A en coordenadas cil�ndricas: ')
        Aci=subs(Aesfcil,[sin(tet) cos(tet) r],[stesf ctesf resf])
        
        
    otherwise
        fprintf('Selecci�n no es v�lida.\n')
end