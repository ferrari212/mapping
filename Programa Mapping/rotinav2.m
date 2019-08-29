% Progrma do caminho minimo
tic

global  ORIGEM DESTINO COMODITE DCARGA CARREGAMENTO CALADO PRAZO
global  NODE DIST
global  LBMAX BBMAX EXPESSURA
global  LB BB HB

h = CALADO*3.281; %calado
w = 200*3.281; %largura do canal
t = 1; %contador de tempo

n_balsas =6; %numero de balsas variaveis de entrada

if(n_balsas==5 || n_balsas==7)
    %Inserir Erro
end

a = [1 n_balsas];
if (isprime(n_balsas)==0 && n_balsas~=1)
    a = factor(n_balsas);
end

%Condições Min (Unidades Imperiais)
L = LB*3.281*a(2);
LMAX = a(2)*LBMAX*3.281;
BMAX = a(1)*BBMAX*3.281;
HMAX = h-0.2*3.281;

H = HMAX*0.9;
B =2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L-2*a(2))*(H+1.5));

DCARGA = 0.75; %Densidade da carga de entrada
n_viagens = 2*floor(CARREGAMENTO*(3.281^3)/(DCARGA*n_balsas*(LMAX-2*a(2))*(BMAX-2*a(1))*(HMAX+1.5)))+1; %Calcula o número de viagens
v = velocidade(NODE,get(ORIGEM,'value'),get(DESTINO,'value'),DIST,n_viagens,PRAZO);

Rt(t) = 0.4536*exp(1.46/(h-H(t)))*(L(t)^0.38)*(B(t)^1.19)*H(t)^(0.6+(50/(w-B(t))))*(v^2);

DL = exp(1.46/(h-H(t)))*0.38/(L(t)^0.62)*(B(t)^1.19)*H(t)^(0.6+(50/(w-B(t)))); %derivada de fator 0.38/(L^0.62)
DB = exp(1.46/(h-H(t)))*(L(t)^0.38)*(1.19*B(t)^0.19)*H(t)^(0.6+(50/(w-B(t))))-...
    exp(1.46/(h-H(t)))*(L(t)^0.38)*(B(t)^1.19)*(50*(w-B(t))^-2)*H(t)^(0.6+(50/(w-B(t))))*log(H(t)); %derivada de fator 1.19*B^0.19
DH =(L(t)^0.38)*(B(t)^1.19)*((1.46/((h-H(t))^2))* exp(1.46/(h-H(t)))*H(t)^(0.6+(50/(w-B(t))))+...
    exp(1.46/(h-H(t)))*(0.6+(50/(w-B(t))))*H(t)^(-0.4+(50/(w-B(t)))));

EHP(t) = Rt(t)/75;

%apagar
DLt(t)=DL;
DBt(t)=DB;
DHt(t)=DH;

dx = 0.01; %variação da distância
d1x = abs([1 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B-dx-2*a(1))*(H+1.5))-L 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B-2*a(1))*(H-dx+1.5)-L)]);
dbx = abs([2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L-dx-2*a(2))*(H+1.5))-B 1 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L-2*a(2))*(H-dx+1.5))-B]);
dhx = abs([-1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L-dx-2*a(2))*(B-2*a(1)))-H -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L-2*a(2))*(B-dx-2*a(1)))-H 1]);
dtx = abs([2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B-dx-2*a(1))*(H-dx+1.5))-L(t) 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L-dx-2*a(2))*(H-dx+1.5))-B -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L-dx-2*a(2))*(B-dx-2*a(1)))-H]);

epsolon = .01; 
erro = 1;

if(20 < v)
msgbox('Condição Impossível');
erro=0;
end

while (epsolon<erro)
    
if(L(t)>=LMAX || B(t)>=BMAX || H(t)>=HMAX)
    cont=1;
    if(L(t)>=LMAX)
        L(t+1)=LMAX;
        
        if(B(t)>=BMAX && H(t)<HMAX)
            B(t+1)=BMAX;
            H(t+1)=-1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(B(t+1)-2*a(1)));
            cont=0;
        end
        
        if(H(t)>=HMAX && B(t)<BMAX)
            H(t+1)=HMAX;
            B(t+1)=2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(H(t+1)+1.5));
            cont=0;
        end
            
        %change to a one dimensional space
        %Mudei para d1x que é a variação volumétrica
        if((abs(DB*dbx(3)))<abs(DH*(dx)) && cont==1)
            cont=0;
            H(t+1)=H(t)-dx;
            B(t+1) = 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(H(t+1)+1.5));
        else
            if((abs(DH*dhx(2)))<abs(DB*(dx)) && cont==1)
                cont=0;
                B(t+1)=B(t)-dx;
                H(t+1) = -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(B(t+1)-2*a(1)));
            else
                erro(t)=0;
                L(t+1)=L(t);
                B(t+1)=B(t);
                H(t+1)=H(t);
            end
        end
    end
    
    if(B(t)>=BMAX && cont==1)
        B(t+1)=BMAX;
        
        if(H(t)>=HMAX)
            H(t+1)=HMAX;
            B(t+1)=BMAX;
            L(t+1) = 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t+1)-2*a(1))*(H(t+1)+1.5));
            cont=0;
        end
        
            %change to a one dimensional space
            if((abs(DL*d1x(3)))<abs(DH*(dx)) && cont==1)
                cont=0;
                H(t+1)=H(t)-dx;
                L(t+1) = 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t+1)-2*a(1))*(H(t+1)+1.5));
            else
                if ((abs(DH*dhx(1)))<abs(DB*(dx)) && cont==1)%mudar
                    cont=0;
                    L(t+1)=L(t)-dx;
                    H(t+1) = -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(B(t+1)-2*a(1)));
                else
                erro(t)=0;
                L(t+1)=L(t);
                B(t+1)=B(t);
                H(t+1)=H(t);
                end
            end
    end
    
    if(H(t)>=HMAX && cont==1)
        H(t+1)=HMAX;%Modificar
        uni = sqrt(DB*DB+DL*DL);
            %change to a one dimensional space
            if((abs(DB*dx))<abs(DL*(dx)))
                L(t+1)=L(t)-dx;
                B(t+1) = 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(H(t+1)+1.5));
            else
                B(t+1)=B(t)-dx;
                L(t+1) = 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t+1)-2*a(1))*(H(t+1)+1.5));
            end        
    end
    
else
    
    
if ((abs(DL*dtx(1)))<(abs(DB*dx)+abs(DH*dx)))    
    B(t+1)=B(t)-dx;
    H(t+1)=H(t)-dx;
    L(t+1) = 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t+1)-2*a(1))*(H(t+1)+1.5));

        
else
    if ((abs(DB*dtx(2)))<(abs(DL*dx)+abs(DH*dx)))
        L(t+1)=L(t)-dx;
        H(t+1)=H(t)-dx;
        B(t+1)=2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(H(t+1)+1.5));         
    
    else
        L(t+1)=L(t)-dx;
        B(t+1)=B(t)-dx;
        H(t+1) = -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t+1)-2*a(2))*(B(t+1)-2*a(1)));
             
    end
end
end
t = t+1;

Rt(t) = 0.4536*exp(1.46/(h-H(t)))*(L(t)^0.38)*(B(t)^1.19)*H(t)^(0.6+(50/(w-B(t))))*(v^2);

DL = (v^2)*exp(1.46/(h-H(t)))*(0.38/(L(t)^0.62))*(B(t)^1.19)*H(t)^(0.6+(50/(w-B(t)))); %derivada de fator 0.38/(L^0.62)
DB = (v^2)*exp(1.46/(h-H(t)))*(L(t)^0.38)*(1.19*B(t)^0.19)*H(t)^(0.6+(50/(w-B(t))))-...
    exp(1.46/(h-H(t)))*(L(t)^0.38)*(B(t)^1.19)*(50*(w-B(t))^-2)*H(t)^(0.6+(50/(w-B(t))))*log(H(t)); %derivada de fator 1.19*B^0.19
DH =(v^2)*(L(t)^0.38)*(B(t)^1.19)*((1.46/((h-H(t))^2))* exp(1.46/(h-H(t)))*H(t)^(0.6+(50/(w-B(t))))+...
    exp(1.46/(h-H(t)))*(0.6+(50/(w-B(t))))*H(t)^(-0.4+(50/(w-B(t)))));

%derivadas segundo variação de volume
d1x = abs([1 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t)-dx-2*a(1))*(H(t)+1.5))-L(t) 2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t)-2*a(1))*(H(t)-dx+1.5)-L(t))]);
dbx = abs([2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-dx-2*a(2))*(H(t)+1.5))-B(t) 1 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-2*a(2))*(H(t)-dx+1.5))-B(t)]);
dhx = abs([-1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-dx-2*a(2))*(B(t)-2*a(1)))-H(t) -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-2*a(2))*(B(t)-dx-2*a(1)))-H(t) 1]);
dtx = abs([2*a(2)+CARREGAMENTO*(3.281^3)/(DCARGA*(B(t)-dx-2*a(1))*(H(t)-dx+1.5))-L(t) 2*a(1)+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-dx-2*a(2))*(H(t)-dx+1.5))-B(t) -1.5+CARREGAMENTO*(3.281^3)/(DCARGA*(L(t)-dx-2*a(2))*(B(t)-dx-2*a(1)))-H(t)]);
DLt(t)=abs(DL*dx);
DBt(t)=abs(DB*dx);
DHt(t)=abs(DH*dx);

%Verifica o valor do peso
% DCARGA*(L(t)-2*a(2))*(B(t)-2*a(1))*(H(t)+1.5)/3.281^3;
EHP(t) = Rt(t)/75;

% Ver erro depois (Formula da propragração de erro)
erro(t)=DL*abs((L(t)-L(t-1)))+DB*abs((B(t)-B(t-1)))+DH*abs((H(t)-H(t-1)));
end



figure('Name','Imagens','Numbertitle','off','Units','normalized',...
    'menubar','none','resize','off','color',[.7 .7 .7],'Position',[0 .07 1 .85]);

LB  = L(t)/(a(2)*3.281);
BB = B(t)/(a(1)*3.281);
HB = H(t)/(3.281);

subplot(2,2,1)
plot(L/LMAX,'-o')
title(['Plotagem de L/LMAX. L = ',num2str(LB,'%.2f'),' m.'],'FontSize',12,...
    'FontName','Cambria')
xlabel('Número de interações')
ylabel('Razão L/LMAX')
axis([1 inf -inf inf])

subplot(2,2,2)
plot(B/BMAX,'-o')
title(['Plotagem de B/BMAX. B = ',num2str(BB,'%.2f'),' m.'],'FontSize',12,...
    'FontName','Cambria')
xlabel('Número de interações')
ylabel('Razão B/BMAX')
axis([1 inf -inf inf])

subplot(2,2,3)
plot(H/HMAX,'-o')
title(['Plotagem de H/HAX. H = ',num2str(HB,'%.2f'),' m.'],'FontSize',12,...
    'FontName','Cambria')
xlabel('Número de interações')
ylabel('Razão H/HMAX')
axis([1 inf -inf inf])

subplot(2,2,4)
plot(EHP,'-o')
title(['Plotagem da Potência. Pot = ',num2str(EHP(t),'%.1f'),' HP.'],...
    'FontSize',12,'FontName','Cambria')
xlabel('Número de interações')
ylabel('Razão EHP')
axis([1 inf -inf inf])

figure('Name','Erro','Numbertitle','off','Units','normalized',...
    'menubar','none','resize','off','color',[.7 .7 .7]);
plot(DLt)
hold on
plot(DBt,'color','green')
hold on
plot(DHt,'color','red')
hold on
plot(erro,'color','cyan')
title('Erro','FontSize',14,'FontName','Cambria')
legend('DL','DB','DH','Erro')
axis([1 inf -inf inf])


% DCARGA*(L(t)-2*a(2))*(B(t)-2*a(1))*(H(t)+1.5)/3.281^3

toc