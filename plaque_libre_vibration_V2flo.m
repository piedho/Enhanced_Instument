 t=14*0.02;%temps en seconde; ici on initialise le temps t0
 x=[0:0.01:0.1];
 y=[0:0.01:0.1];
deplacement(x,y,t);

function [deplacementlibre] = deplacement(x,y,t)
%gere le deplacement lors des vibrations (acoustiques) d'une plaque carr�e
%libre

%t=2;
x=[0:0.001:0.1];
y=[0:0.001:0.1];
a=0.1; %cot� plaque en m
E=210000000; %module de Young, module d'elasticit� 210000000 correspond � celui d'un acier de construction
h=0.001;
rho=7500; %masse volumique; 7500 pour l'acier (kg/m^3)
nu=0.3; %coefficient de poisson de l'acier de construction

Z=35 ; %35 pour mode 1 1
D=E*h^3/(12*(1-nu^2)) ; %remove ; 
k=sqrt(Z/a^2) ;     %remove ;
omega=k^2*sqrt(D/rho) ; %remove ;

%S=solve(tan(alpha/2)+tanh(alpha/2) == 0,alpha)
% S=3.15729; % pour la premi�re solution
%S=9.5; % pour la 2e solution

nombrex=2;
vect=zeros(nombrex);
  syms alphaa
 fonc = tan(alphaa/2)+tanh(alphaa/2);
for kx = 1:nombrex
  solalphaa=vpasolve(fonc,alphaa,[0,4*pi],'Random',true); 
  Sx=double(solalphaa);
  figure(kx);
   while ismember(Sx,vect)
      solalphaa=vpasolve(fonc,alphaa,[0,4*pi],'Random',true);  
      Sx=double(solalphaa);
   end
class(vect(kx))
class(Sx)
vect(kx)=Sx;

  
nombrey=2;
vect2=zeros(nombrey);
  syms alphab
 fonc = tan(alphab/2)+tanh(alphab/2);
for ky = 1:nombrey
  solalphab=vpasolve(fonc,alphab,[0,4*pi],'Random',true); 
  figure(ky);
  Sy=double(solalphab);
   while ismember(Sy,vect2)
      solalphab=vpasolve(fonc,alphab,[0,4*pi],'Random',true);  
      Sy=double(solalphab);
   end
vect2(ky)=Sy;
%Sy=9.5

%    for t = t : 0.001 : t+0.051
%      for t = t : 0.05 : t+1.1
%         for x = 0 : 0.01 : 0.1
%             xindice=x*100+1
%             for y = 0 : 0.01 : 0.1
%                 yindice=y*100+1

[x,y] = meshgrid(0:0.001:0.1);
%                deplacementvalxy(xindice,yindice)=cos(S*(x/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(x/a-1/2))+cos(S*(y/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(y/a-1/2))
               deplacementvalxy=cos(Sx*(x/a-1/2))-sin(Sx/2)/sinh(Sx/2)*cosh(Sx*(x/a-1/2))+cos(Sy*(y/a-1/2))-sin(Sy/2)/sinh(Sy/2)*cosh(Sy*(y/a-1/2)); % equation pour les m/n pairs, pour impaires quelques sin remplacent des cos
                deplacementvalxyt=deplacementvalxy*cos(omega*t);
                %            sigma=1; %d�pend de n mais vaut globalement 1 � n>1; pour n=1, vaut 0.7341
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
        %surf(x,y,deplacementvalxyt);
        
%        hold on
%             end
%         end 
%    end
         surf(x,y,deplacementvalxyt);
         hold on
%       temps=1;
%       hf = figure;
%       axis tight manual % this ensures that getframe() returns a consistent size
%       filename = 'plaquevibration.gif';
%       surf(x,y,deplacementvalxyt)
%       axis([0 a 0 a -5 5]) %axe pour mode 1 (Z=35)
%       drawnow 
%       % Capture the plot as an image 
%       frame = getframe(hf); 
%       im = frame2im(frame); 
%       [imind,cm] = rgb2ind(im,256); 
%       % Write to the GIF File 
%       if temps == 0 
%           imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
%       else 
%           imwrite(imind,cm,filename,'gif','WriteMode','append'); 
%     end
%     end
Sx
Sy
end
end
end