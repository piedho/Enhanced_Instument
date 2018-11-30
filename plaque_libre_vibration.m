 t=14*0.02;%temps en seconde; ici on initialise le temps t0
 x=[0:0.01:0.1];
 y=[0:0.01:0.1];
deplacement(x,y,t);

function [deplacementlibre] = deplacement(x,y,t)
%gere le deplacement lors des vibrations (acoustiques) d'une plaque carrée
%libre

%t=2;
x=[0:0.001:0.1];
y=[0:0.001:0.1];
a=0.1; %coté plaque en m
E=210000000 %module de Young, module d'elasticité 210000000 correspond à celui d'un acier de construction
h=0.001
rho=7500 %masse volumique; 7500 pour l'acier (kg/m^3)
nu=0.3 %coefficient de poisson de l'acier de construction

Z=35 %35 pour mode 1 1
D=E*h^3/(12*(1-nu^2))
k=sqrt(Z/a^2)
omega=k^2*sqrt(D/rho)

%S=solve(tan(alpha/2)+tanh(alpha/2) == 0,alpha)
S=3.15729;

%    for t = t : 0.001 : t+0.051
     for t = t : 0.05 : t+1.1
%         for x = 0 : 0.01 : 0.1
%             xindice=x*100+1
%             for y = 0 : 0.01 : 0.1
%                 yindice=y*100+1

[x,y] = meshgrid(0:0.01:0.1)
%                deplacementvalxy(xindice,yindice)=cos(S*(x/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(x/a-1/2))+cos(S*(y/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(y/a-1/2))
                deplacementvalxy=cos(S*(x/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(x/a-1/2))+cos(S*(y/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(y/a-1/2)) % equation pour les m/n pairs, pour impaires quelques sin remplacent des cos
                deplacementvalxyt=deplacementvalxy*cos(omega*t);
                %            sigma=1; %dépend de n mais vaut globalement 1 à n>1; pour n=1, vaut 0.7341
% %           plot(x,deplacementval);
% %           hold on
% %        end
%         
%       hf = figure;
%       axis tight manual % this ensures that getframe() returns a consistent size
%       filename = 'barrefixefreeflexiongras.gif';
%       plot(x,deplacementval,'LineWidth',h*2*1000);
%       axis([0 l+0.1*l -0.00009 0.00009])
%       drawnow 
%       % Capture the plot as an image 
%       frame = getframe(hf); 
%       im = frame2im(frame); 
%       [imind,cm] = rgb2ind(im,256); 
%       % Write to the GIF File 
%       if t == 0 
%           imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
%       else 
%           imwrite(imind,cm,filename,'gif','WriteMode','append'); 
%       end    
%         surf(x,y,deplacementvalxy);
%         hold on
%             end
%         end 
%    end
%         surf(x,y,deplacementvalxyt);
%         hold on
      temps=1;
      hf = figure;
      axis tight manual % this ensures that getframe() returns a consistent size
      filename = 'plaquevibration.gif';
      surf(x,y,deplacementvalxyt)
      axis([0 a 0 a -5 5]) %axe pour mode 1 (Z=35)
      drawnow 
      % Capture the plot as an image 
      frame = getframe(hf); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if temps == 0 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
    end
end