

function [deplacementlibre] = deplacement(x,t)
%gere le deplacement lors des vibrations (acoustiques) longitudinales d'une
%barre mais pour 1 mode � la fois
%   barre fix�e � 1 extremit� (en x=0)

Pi=3.14;
%t=2;
x=[0:0.0001:0.1];
F=1%force appliqu�e en newtons
l=0.1 %longueur barre en m
h=0.01 %hauteur barre en m
larg=0.01 %largeur barre en m
A=h*larg %section en m^2
rho=7500 %masse volumique; 7500 pour l'acier (kg/m^3)
E=210000000 %module de Young, module d'elasticit� 210000000 correspond � celui d'un acier de construction
n=3 % n=1 correspond au fondamental; n entier
%Cl=334 %vitesse propag onde (m/s) 334 pour onde acoustique � 20�C dans l'air
I=larg*h*h*h/12 % momet d'inertie de la section droite selon y (en m^4)
%Beta=(2*n-1)*Pi/(2*l)
sigma=0.7341 %d�pend de n mais vaut globalement 1 � n>1; pour n=1, vaut 0.7341
deplacementval=0;
An=0;
Bn=(2*n-1)*Pi/(2*l);

%    for t = t : 0.001 : t+0.051
        for n = 1 : n
            Bn=(8*F*l/(E*A*Pi*Pi)*((-1)^(n+1))/(2*n-1)^2);
            Beta=(2*n-1)*Pi/(2*l);
            sigma=(cos(Beta*l)+cosh(Beta*l))/(sin(Beta*l)+sinh(Beta*l));
            Wn=Beta*Beta*sqrt(E*I/(rho*A)); %pulsation naturelle
            t=0;
            deplacementval=((An*sin(Wn*t)+Bn*cos(Wn*t))*(cosh(Beta*x)-cos(Beta*x)-sigma*(sinh(Beta*x)-sin(Beta*x)))); %somme fonction n, en th�orie somme jusque l'infini
   
        plot(x,deplacementval);
        xlabel('longueur barre')
        ylabel('d�placement vertical')
        title('vibrations des premiers modes propres de la barre')
        hold on
        %legend({'harmonique 1' 'harmonique 2' 'harmonique 3' 'barre fixe'},'Location','southwest')
        %hold on
        %plot(x,zeros(size(x)),'black','linewidth',2);
        end
        plot(x,zeros(size(x)),'black','linewidth',2);
        legend({'harmonique 1' 'harmonique 2' 'harmonique 3' 'barre fixe'},'Location','northwest')
end


t=0;%temps en seconde; ici on initialise le temps t0
x=[0:0.001:0.1];
deplacement(x,t);

