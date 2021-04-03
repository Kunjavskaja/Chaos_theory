% chaos theory
clear all, close all, clc

a = .9;     % Parameter a
x0 = 1;     % Anfangsbedingung

% calculate frequency with respect to mu
MU = -1.5:.01:1.5;      % Groﬂes array mit mu werten
W = [];                 % leeres array in das sp‰ter die frequenz geschrieben wird
M = [];                 % leeres array in das sp‰ter der mittelwert geschrieben wird
for kk = 1:length(MU)
    
    mu = MU(kk);        % parameter mu
    
    % calculate trajetory X
    X = [];
    X(1) = x0;
    for n = 1:500
        X(n+1) = f(X(n),a,mu);
    end 
    
    % calulate frequenzy w
    for ii = 1:length(X)          % starte bei n = 300, da hier das system bereits eingeschwungen ist
        S = X(ii+1);
        if abs(X(1)-S) < 1e-03;   % vergleiche x(n=300) mit x(n=300+ii)
            w = ii+1;           % wenn x(n=300)=x(n+300+ii), wissen wir hier ist eine periode vorbei
            break
        end
    end
    % calculate mean value of oscilation
    m = mean(X);
    
    W(kk) = w;
    M(kk) = m;

end

    % plot
    figure(1)
    plot(MU,W)
    xlabel('$\mu$','Interpreter','Latex')
    ylabel('frequency','Interpreter','Latex')
    title('Frequency','Interpreter','Latex')
    hold on
%     figure(2)
%     plot(MU,M)
%     title('Mean','Interpreter','Latex')
%     hold on

% systemgleichung
function dx = f(x,a,mu)
    if x <= (1-mu)/2
        dx = a*2*x;
    elseif (1-mu)/2 < x <(1+mu)/2
        dx = mu;
    elseif x >=(1+mu)/2 
        dx =  a*2*(1-x);
    end
end
