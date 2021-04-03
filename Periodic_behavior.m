clear all, close all 
Nplot = 100000;
x syms
a=0.93;
r=0.9;
x(1) =0.1;
  for n = 1:Nplot-1,
       if x(n) < 0 
         x(n+1) = a*x(n)+r+1;
         elseif x(n) > 0
         x(n+1)= a*x(n)+r-1;
       end
  end,
  plot(x(n), x(n+1), '.');
  hold on;

% title('Bifurcation diagram of the discontinous map');
% xlabel('µ');  ylabel('x_n');
% set(gca, 'xlim', [-3 3]);
% set(gca, 'ylim', [-3 3]);
% hold off; 