%% Fibonacci Generator for Uniform Random Deviates

clear all
close all

% ----------------------------------
% STEP 1: Congruential Random Generator
% ----------------------------------
% This is required for the first X numbers, before moving on to the
% Fibonacci generator for the remaining

% Parameters

a = 1597 ;
b = 51749 ;
M = 2^30 ;
N0 = 25; % Seed number
lcgnum = 17; % Number of linear congruential unif rand deviants required

ndeviates = 10000; % Number of deviates required

A = zeros([1,ndeviates]) ;
A(1) = mod(a*N0+b,M) ;
for i = 1:lcgnum-1
    A(i+1) = mod(a*A(i)+b , M) ;
end

U = A ./ M ;

% ----------------------------------
% STEP 2: Fibonacci Random Generator
% ----------------------------------

for i = lcgnum+1:ndeviates
    U(i) = U(i-17) - U(i-5) ;
    if U(i) < 0 
        U(i) = U(i) + 1 ;
    end
end

X = U(1:ndeviates-1) ;
Y = U(2:ndeviates) ; 

%Plot in the [U(i),U(i+1)] plane
figure(1)
plot(X,Y,'r.')

