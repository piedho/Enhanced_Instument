 t=0;%temps en seconde; ici on initialise le temps t0
deplacement(x,t,F,l,A,E);

function [deplacementlibre] = deplacement(x,t,F,l,A,E)
%gere le deplacement lors des vibrations (acoustiques) longitudinales d'une barre
%   barre fixée à 1 extremité (en x=0)

Pi=3.14;
%t=2;
x=[0:0.0001:0.1];
F=1%force appliquée en newtons
l=0.1 %longueur barre en m
A=1 %section en m^2
E=210000000 %module de Young, module d'elasticité 210000000 correspond à celui d'un acier de construction
n=50 % n=1 correspond au fondamental; n entier
Cl=334 %vitesse propag onde (m/s) 334 pour onde acoustique à 20°C dans l'air
%Wn=(2*n-1)*Pi/(2*l)*Cl %sorte de pulsation

    for t = t : 1 : t+20
        for n = 1 : n
            S=0; 
            Wn=(2*n-1)*Pi/(2*l)*Cl; %pulsation naturelle
            S=S+((((-1)^(n+1))/(2*n-1)^2)*cos(Wn*t)*sin((2*n-1)*Pi*x/2*l)); %somme fonction n, en théorie somme jusque l'infini
        end
        deplacementval = (8*F*l)/(E*A*Pi*Pi)*S;
        plot(x,deplacementval);
        hold on
    end
end
