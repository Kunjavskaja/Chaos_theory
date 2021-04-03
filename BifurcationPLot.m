clear all, close all 
Nplot = 1000;
x = zeros(Nplot,1);
a=0.95;
x(1) =0.1;
for r = -3:0.005:3,
  for n = 1:Nplot-1,
       if x(n) < 0 
         x(n+1) = a*x(n)+r+1;
         elseif x(n) > 0
         x(n+1)= a*x(n)+r-1;
       end
  end,
  plot(r*ones(Nplot,1), x, '.', 'markersize', 2);
  hold on;
end,
title('Bifurcation diagram of the discontinous map');
xlabel('µ');  ylabel('x_n');
set(gca, 'xlim', [-3 3]);
set(gca, 'ylim', [-3 3]);
hold off; 