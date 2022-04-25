%% Marsaglia Variant for Normally Distributed Random Deviates
% This is a modification of the Box-Muller method in order to avoid using
% trigonometric functions. We take advantage of their polar form.
%
% This method computes pairs of normally distributed random numbers. 
% --------------------------------------------------------------------

clear all
close all

% Parameters
a = -5 ; 
b = 5 ;
deltax = 0.05 ;
x = a:deltax:b ; % Grid for the graphical checks

ndeviates = 10^6; % Number of deviates required

W = ones([1,ndeviates]) ; 
V1 = zeros([1,ndeviates]) ; 
V2 = zeros([1,ndeviates]) ;

for i = 1:ndeviates  
    while W(i) >= 1

        u1 = rand([1,1]) ;
        u2 = rand([1,1]) ;

        V1(i) = 2*u1 - 1 ;
        V2(i) = 2*u2 - 1 ; 

        W(i) = ( V1(i)^2 ) + ( V2(i)^2 ) ;
    end
end 

Z1 = V1 .* sqrt((-2*log(W) ./ W )) ;
Z2 = V2 .* sqrt((-2*log(W) ./ W )) ;

%% Graphical check for Z1 - Histogram with overplot
% This method (and the same for Z2) computes a histogram and then
% normalises it, followed by plotting the standard normal curve. 

close all
figure(1)
h1 = histogram(Z1,x,'Normalization','pdf') ;
hold on
plot(x,pdf('Normal',x,0,1),'r','LineWidth',2)
xlim([a,b])
xlabel('x')
ylabel('f')
legend('Sampled', 'Theory')
title('Standard Normal Distribution X ~ N(0,1)')


%% Graphical check for Z2 - Histogram with overplot

close all
figure(1)
h1 = histogram(Z2,x,'Normalization','pdf') ;
hold on
plot(x,pdf('Normal',x,0,1),'r','LineWidth',2)
xlim([a,b])
xlabel('x')
ylabel('f')
legend('Sampled', 'Theory')
title('Standard Normal Distribution X ~ N(0,1)')





