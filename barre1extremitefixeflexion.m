 t=0;%temps en seconde; ici on initialise le temps t0
 x=[0:0.001:0.1];
deplacement(x,t);

function [deplacementlibre] = deplacement(x,t)
%gere le deplacement lors des vibrations (acoustiques) longitudinales d'une barre
%   barre fixée à 1 extremité (en x=0)

Pi=3.14;
%t=2;
x=[0:0.0001:0.1];
F=1%force appliquée en newtons
l=0.1 %longueur barre en m
h=0.01 %hauteur barre en m
larg=0.01 %largeur barre en m
A=h*larg %section en m^2
rho=7500 %masse volumique; 7500 pour l'acier (kg/m^3)
E=210000000 %module de Young, module d'elasticité 210000000 correspond à celui d'un acier de construction
n=100 % n=1 correspond au fondamental; n entier
Cl=334 %vitesse propag onde (m/s) 334 pour onde acoustique à 20°C dans l'air
I=larg*h*h*h/12 % momet d'inertie de la section droite selon y (en m^4)
%Beta=(2*n-1)*Pi/(2*l)
sigma=0.7341 %dépend de n mais vaut globalement 1 à n>1; pour n=1, vaut 0.7341
deplacementval=0;
An=0;
Bn=(2*n-1)*Pi/(2*l);

    for t = t : 0.001 : t+0.051
        for n = 1 : n
            Bn=(8*F*l/(E*A*Pi*Pi)*((-1)^(n+1))/(2*n-1)^2);
            Beta=(2*n-1)*Pi/(2*l);
            Wn=Beta*Beta*sqrt(E*I/(rho*A)); %pulsation naturelle
            deplacementval=deplacementval+((An*sin(Wn*t)+Bn*cos(Wn*t))*(cosh(Beta*x)-cos(Beta*x)-sigma*(sinh(Beta*x)-sin(Beta*x)))); %somme fonction n, en théorie somme jusque l'infini
            sigma=1; %dépend de n mais vaut globalement 1 à n>1; pour n=1, vaut 0.7341
%           plot(x,deplacementval);
%           hold on
        end
        
      h = figure;
      axis tight manual % this ensures that getframe() returns a consistent size
      filename = 'barrefixefreeflexion.gif';
      plot(x,deplacementval);
      axis([0 l -0.00009 0.00009])
      drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if t == 0 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end       
      
%         plot(x,deplacementval);
% 
%         hold on
    end
end