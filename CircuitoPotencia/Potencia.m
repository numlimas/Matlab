%Calcular potencia en un circuito: fuente, diodo, resistencia, bateria
%Calculate power into circuit: VoltageSource, diode, resistance, battery
control=1;
while(control ~=0)
    clear all,close all, clc;
    syms beta t wt;
    f=input('Ingrese el valor de la frecuencia (Hz): ');
    w=2*pi*f;
    L=input('Ingrese el valor del inductor L (mH): ');
    L=L*1e-3;
    R=input('Ingrese el valor de R (Ohms): ');
    Vrms=input('Ingrese el voltaje de la fuente (Volts rms): ');
    Vm=Vrms*sqrt(2);
    Vdc=input('Ingrese el voltaje de la bateria (Volts): ');
    Z=sqrt(R^2+(w*L)^2);
    theta=atan((w*L)/R);
    X = ['El valor de theta es ',num2str(theta),' radianes.'];
    disp(X)
    alpha=asin(Vdc/Vm);
    Y = ['El valor de alpha es ',num2str(alpha),' radianes.'];
    disp(Y)
    tao=L/R;
    A=((-Vm/Z)*(sin(alpha-theta))+(Vdc/R))*exp(alpha/(w*tao))
    
    valuepos=pi;
    valueneg=2*pi;
    beta(1)=pi+theta;
    for i=1:20
        res(i)=(Vm/Z)*sin(beta(i)-theta)-(Vdc/R)+(A)*exp(-beta(i)/(w*tao));
        if res(i)>0
            valuepos=beta(i);
        else
            valueneg=beta(i);
        end
        beta(i+1)=(valuepos+valueneg)/2;
    end
    result(1)=eval(valuepos);
    result(2)=eval(valueneg);
    result(1);
    betha=result(1);
    W = ['El valor de betha es ',num2str(betha),' radianes.'];
    disp(W)
    %Se halla el valor de A para reemplazar en i(t)
    A=((-Vm/Z)*sin(alpha-theta)+(Vdc/R))*exp(alpha/(w*tao));
    %i(t)
    disp('La corriente para cuando alpa<wt<betha, es: ')
    i_t=(Vm/Z)*sin((w*t)-theta)-(Vdc/R)+(A*exp(t/tao)) 
    %Se halla la corriente rms
    disp('La corriente Irms (eficaz): ')
    Irms=sqrt((1/2*pi)*int((i_t)^2,alpha,betha))
    
    disp('La potencia en R es: ')
    P_R=(((Irms)^2)*R);
    
    
    %Potencia de la fuente dc (carga)
    %disp('La corriente Idc es: ')
    i_wt=(Vm/Z)*sin((wt)-theta)-(Vdc/R)+(A*exp(t/tao));
    I=(1/(2*pi))*int((i_wt),alpha,betha);
    %disp('La potencia de la fuente dc (carga) es: ')
    P_Vdc=I*Vdc
    
    %Potencia media ac
    %disp('La potencia de la fuente AC es: ')
    %P_s=P_R+P_Vdc
    
    %Factor de potencia
    %disp('El factor de potencia (fp)): ')
    %fp=P_s/(Vrms*Irms)
    
    control=input('Enter logical value to control set (1 o 0): ');
end