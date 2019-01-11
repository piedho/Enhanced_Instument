%create a gif
h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'truc.gif';
for m = 1:0.5:5
    % Draw plot for y = x.^n
    x = 0:0.01:1;
    y = x.^m;
    plot(x,y)
    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if m == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
  end