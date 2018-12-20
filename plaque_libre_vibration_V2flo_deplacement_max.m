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
E=210000000; %module de Young, module d'elasticité 210000000 correspond à celui d'un acier de construction
h=0.001;
rho=7500; %masse volumique; 7500 pour l'acier (kg/m^3)
nu=0.3; %coefficient de poisson de l'acier de construction

Z=13,4 %35 ; %35 pour mode 1 1; lambda = w*a^2*sqrt(rho/D) dans littérature de Leissa; valeurs pour mode séquence de plaque carrée : mode fréquence 1 : 13,5(pour mode 2,2) ; mode fréquence 2 : 19,8(pour mode 1,3); mode frequence 3 : 24,4(pour mode 3,1); mode frequence 4 : 35(pour mode 3,2); mode frequence 5 :35 (pour mode 2,3); mode frequence 6 : 61,5 (4,1)
D=E*h^3/(12*(1-nu^2)) ; %remove ; 
k=sqrt(Z/a^2) ;     %remove ;
omega=k^2*sqrt(D/rho) ; %remove ;
dep1pt=zeros(1,51);

%S=solve(tan(alpha/2)+tanh(alpha/2) == 0,alpha)
% S=3.15729; % pour la première solution
%S=9.5; % pour la 2e solution

fignbr=1;

nombrex=3; %2 pour intervalle entre 0 et 4 pi ;4 pour intervalle entre 0 et 8pi
vect=zeros(nombrex); 
compteurm=0;
compteurvib=1;

for kx = 1:nombrex
  syms alphaa 
  fonc = tan(alphaa/2)+tanh(alphaa/2);
  solalphaa=vpasolve(fonc,alphaa,compteurm) ; 
  Sx=double(solalphaa) ; 
  
 %%figure(kx);
passol=0;
   while ismember(Sx,vect)
      compteurm=compteurm+2*pi;
      solalphaa=vpasolve(fonc,alphaa,compteurm);  
      Sx=double(solalphaa)
      passol=passol+1;
      if passol>20
          disp("plus de solutions dans l'intervalle des x")
      end
   end

vect(kx)=Sx;

  
nombrey=3;%2 pour intervalle entre 0 et 4pi ; 4 pour intervalle entre 0 et 8pi
vect2=zeros(nombrey);
compteurn=0;

  syms alphab
 fonc = tan(alphab/2)+tanh(alphab/2);
for ky = 1:nombrey
  solalphab=vpasolve(fonc,alphab,compteurn); 
  %figure(ky);
  Sy=double(solalphab);
  passol2=0;
   while ismember(Sy,vect2)
      compteurn=compteurn+2*pi;
      solalphab=vpasolve(fonc,alphab,compteurn);  
      Sy=double(solalphab);
      passol2=passol2+1;
      if passol2>20
          disp("plus de solutions dans l'intervalle des y")
      end
   end
vect2(ky)=Sy;
%Sy=9.5

%%figure(fignbr);
%%fignbr=fignbr+1;
compteurt=0;
    %%%%for t = t : 0.1 : t+5.1
            for t = t : 0.08 : t+4.08
        
    % vrai temps pour avoir une frequ for t = t : 0.001 : t+0.051
        compteurt=compteurt+1;
%      for t = t : 0.05 : t+1.1
%         for x = 0 : 0.01 : 0.1
%             xindice=x*100+1
%             for y = 0 : 0.01 : 0.1
%                 yindice=y*100+1

[x,y] = meshgrid(0:0.002:0.1);
%                deplacementvalxy(xindice,yindice)=cos(S*(x/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(x/a-1/2))+cos(S*(y/a-1/2))-sin(S/2)/sinh(S/2)*cosh(S*(y/a-1/2))
               deplacementvalxy=cos(Sx*(x/a-1/2))-sin(Sx/2)/sinh(Sx/2)*cosh(Sx*(x/a-1/2))+cos(Sy*(y/a-1/2))-sin(Sy/2)/sinh(Sy/2)*cosh(Sy*(y/a-1/2)); % equation pour les m/n pairs, pour impaires quelques sin remplacent des cos
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
        %surf(x,y,deplacementvalxyt);
        
%        hold on
%             end
%         end 
%    end
% % % %          figure(compteurvib);
% % % %          surf(x,y,deplacementvalxyt);
% % % %          %hold on
% % % %          
% % % %         xlabel('longueur (mode m)')
% % % %         ylabel('largeur (mode n)')
% % % %         zlabel('déplacement vertical')
% % % %         title(['vibrations des premiers modes propres ',num2str(kx),' x ',num2str(ky),' de la plaque'])
        
      deplacementvalxyt;
      tempo=[t: 0.001 : t+0.051];
      dep1pt(1,compteurt)=deplacementvalxyt(1,1);
      deplacementvalxyt(10,10);
      %plot(tempo,dep1pt);
      
      %hold off
%       plot(tempo,deplacementvalxyt(:,20)); %colonne et toutes les lignes = point qui suit y
%       hold on

%       plot(tempo,deplacementvalxyt(1,:));
%       hold on
%       plot(tempo,deplacementvalxyt(10,:)); %ligne précise et toute les colonnes = point qui suit x
%       hold on
%       plot(tempo,deplacementvalxyt(15,:));
%       legend({'suivi ligne x en y=0','suivi ligne x en y=0.5*a','suivi ligne x en y=0.75*a'},'Location','best',...    %Légende du tracé avec le texte à afficher se trouvant entre {}
%       'FontSize',12)
      %hold off
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
    end
    
         figure(compteurvib);
         surf(x,y,deplacementvalxyt);
         %hold on
         
        xlabel('longueur (mode m)')
        ylabel('largeur (mode n)')
        zlabel('déplacement vertical')
        title(['vibrations des premiers modes propres ',num2str(kx),' x ',num2str(ky),' de la plaque'])
        
        
       hold off
       compteurvib=compteurvib+1;
       figure(compteurvib);
       plot(tempo,dep1pt);
       title(['vibrations temporelle en un point pour le mode ',num2str(kx),' x ',num2str(ky),' de la plaque'])
       compteurvib=compteurvib+1;
       %hold on
end

end
        %plot(tempo,dep1pt(:,1))
% %        hold off
% %        plot(tempo,dep1pt);
% %        hold on
      
% % %         figure(fignbr);
% % %         plot(tempo,dep1pt);
% % %         hold on
% % %         fignbr=fignbr+1;
end