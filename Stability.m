clear all, close all

function xIm = spiderweb(f, x0, N)
% Pre-allocate a vector xIm for the images. By the end, we will have
%            xIm = [x0 f(x0) f( f(x0) ) f( f( f(x0) ) ) ... ]
xIm = [x0 zeros(1,N)];
% Plot the curve for f and the line y = x (for the spiderweb process).
figure(1); clf;
xx = linspace(0,1,500);
plot(xx,xx,'b','LineWidth',2);
axis([0 1 0 1]); box on; hold on;
plot(xx,f(xx),'r','LineWidth',2);
xlabel('x'); ylabel('f(x)'); 
title({['Spiderweb plot of length N = ', num2str(N),' for']; ...
       ['f = ',func2str(f),'     and     x0 = ', num2str(x0)]});
% Main function loop: Suppose we are on the kth iteration. First, we
% compute xIm(k) = (f^k)(x0). Then, draw the vertical line from the point
% ( xIm(k-1), xIm(k-1) ) on the line y = x to the point (xIm(k-1), xIm(k)).
% Next, draw the horizontal line connecting this image point on the curve
% back to the line y = x.
for n = 2:N
    xIm(n) = f(xIm(n-1));
    line([xIm(n-1) xIm(n-1)],[xIm(n-1) xIm(n)],'Color','k','Marker','o');
    line([xIm(n-1) xIm(n)],[xIm(n) xIm(n)],'Color','k','Marker','o');
    drawnow;
end
% Now plot the images projected onto [0 1]
hold on;
plot(xIm, 0*xIm, 'g.');