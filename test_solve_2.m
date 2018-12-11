%test_solve_2
%syms x
%interval = [solx > 0, solx < 4*pi]
%assume(x, 'real')
%vpasolve(tan(x/2)+tanh(x/2) == 0,x, [0.1,4*pi])

fignbr=1;

nombrex=18; %2 pour intervalle entre 0 et 4 pi ;4 pour intervalle entre 0 et 8pi
vect=ones(nombrex); 
compteurm=0;

for kx = 1:nombrex
  syms alphaa 
  fonc = tan(alphaa/2)+tanh(alphaa/2);
  solalphaa=vpasolve(fonc,alphaa,compteurm) ; 
  Sx=double(solalphaa)
  
 % figure(kx);
passol=0;
   while ismember(Sx,vect)
      compteurm=compteurm+2*pi;
      solalphaa=vpasolve(fonc,alphaa,compteurm);  
      Sx=double(solalphaa)
      passol=passol+1;
      if passol>10
          disp("plus de solutions dans l'intervalle des x")
          passol=0;
      end
   end

vect(kx)=Sx;
figure(fignbr);
fignbr=fignbr+1;
   
end
% truc=2;
%         xlabel('longueur (mode m)')
%         ylabel('largeur (mode n)')
%         title(['vibrations des premiers modes propres',num2str(n)])