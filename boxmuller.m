%%
% ---------------------------------------------------------------
% Box-Muller Method for Generating Normally Dist. Random Numbers
% ---------------------------------------------------------------

clear all
close all

a = -4 ; % Left hand limit (for truncation purposes)
b = 4 ; % Right hand limit
ngrid = 1333 ; % Number of grid points
deltax = (b-a)/ngrid ; % Step sizes
x = a:deltax:b ; % Define the grid
N = 10^6 ; % Number of random numbers to be generated

theta = 2*pi*rand([N,1]) ;
rho = sqrt(-2*log(rand([N,1]))) ; 

Z1 = rho .* cos(theta) ;
Z2 = rho .* sin(theta) ;


%% Graphical check 
% This method computes an array h using Hist, normalises it using the
% divisor below and then plots them as dots over a standard normal.

close all
figure(3)
h = hist(Z1,x)/(N*deltax);
plot(x,h,'b.' ,x,pdf('Normal',x,0,1),'r')

%% Graphical Check for Z1
% This method (and the same for Z2) computes a histogram and then
% normalises it, followed by plotting the standard normal curve. 

close all
figure(1)
h1 = histogram(Z1,x,'Normalization','pdf')
hold on
plot(x,pdf('Normal',x,0,1),'r','LineWidth',2)
xlim([a,b])
xlabel('x')
ylabel('f')
legend('Sampled', 'Theory')
title('Standard Normal Distribution X ~ N(0,1)')

%% Graphical Check for Z2

close all
figure(2)
h1 = histogram(Z2,x,'Normalization','pdf')
hold on
plot(x,pdf('Normal',x,0,1),'g','LineWidth',2)
xlim([a,b])
xlabel('x')
ylabel('f')
legend('Sampled', 'Theory')
title('Standard Normal Distribution X ~ N(0,1)')

