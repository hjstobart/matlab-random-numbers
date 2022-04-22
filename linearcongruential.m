%% Linear Congruential Generator for Uniform Random Deviates

clear all
close all

% Parameters
a = 1597 ;
b = 51749 ;
M = 244944 ;
N0 = 40243 ; % Seed number

ndeviates = 1000 ; % Number of deviates required

% Algorithm
A = zeros([1,ndeviates]) ; % Initialise zeros matrix for number of deviates
A(1) = mod(a*N0 + b , M) ; % Start at the beginning
for i = 2:ndeviates
    A(i+1) = mod(a*A(i) + b , M) ;
end

U = A ./ M ; % Transform our numbers into standard uniform deviates

X = U(1:ndeviates-1) ; % This will be the U(i) plane
Y = U(2:ndeviates) ; % This will be the U(i+1) plane

% Plot the figure to see how they lie
% They could fall onto parallel lines:
% e.g. When a = 1229; b=1; M = 2048
% Or they could fall (relatively) well distributed:
% e.g. When a = 1597; b = 51749; M = 244944
figure(1)
plot(X,Y,'r.')