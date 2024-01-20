clc;clear;
%======================================================================
%This program is designed to demonstrate 
%the probability density of the 
%projected Langevin Monte Carlo (PLMC) algorithm.
%======================================================================
%Please note that for the sake of convenience in demonstration, 
%we have chosen the first component of the d-dimensional model as an 
%example to illustrate its distribution.
%======================================================================
rng(100,'twister');  
%======================================================================

%Parameter settings
d=10;  %dimension
Xzero = 0;  %initial value  

alpha = 1; beta = 4;   %parameters of the model

T=6;   %terminal time
N= T*2^(13); 
dt = T/N;

M=3000;  %Monte Carlo samples
R = [1; 32; 64; 128; 256];

dW1 = sqrt(dt)*randn(M,N);
dW2 = sqrt(dt)*randn(M,N);
dW3 = sqrt(dt)*randn(M,N);
dW4 = sqrt(dt)*randn(M,N);
dW5 = sqrt(dt)*randn(M,N);
dW6 = sqrt(dt)*randn(M,N);
dW7 = sqrt(dt)*randn(M,N);
dW8 = sqrt(dt)*randn(M,N);
dW9 = sqrt(dt)*randn(M,N);
dW10 = sqrt(dt)*randn(M,N);
%======================================================================

Y1Euler = zeros(M,1); % store all the data of the first component of the PLMC algorithm.

%======================================================================
B=ones(M,1);
C=ones(M,1);
%======================================================================
for p=1
    Dt = R(p)*dt; L = N/R(p);
    Y1pe = Xzero* ones(M,1);
    Y2pe = Xzero* ones(M,1);
    Y3pe = Xzero* ones(M,1);
    Y4pe = Xzero* ones(M,1);
    Y5pe = Xzero* ones(M,1);
    Y6pe = Xzero* ones(M,1);
    Y7pe = Xzero* ones(M,1);
    Y8pe = Xzero* ones(M,1);
    Y9pe = Xzero* ones(M,1);
    Y10pe = Xzero* ones(M,1);
    
    
    for j=1:L
        Winc1 = sum(dW1(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc2 = sum(dW2(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc3 = sum(dW3(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc4 = sum(dW4(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc5 = sum(dW5(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc6 = sum(dW6(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc7 = sum(dW7(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc8 = sum(dW8(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc9 = sum(dW9(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc10 = sum(dW10(:,R(p)*(j-1)+1:R(p)*j),2);
%======================================================================
        nor = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2+ Y6pe.^2 ...
             + Y7pe.^2 + Y8pe.^2 + Y9pe.^2+ Y10pe.^2 ).^(0.5);

%======================================================================       
        Y1pe = Y1pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y2pe = Y2pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y3pe = Y3pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y4pe = Y4pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y5pe = Y5pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y6pe = Y6pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y7pe = Y7pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y8pe = Y8pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y9pe = Y9pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y10pe = Y10pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
%======================================================================
        Y1pe = Y1pe + (alpha*Y1pe - beta* Y1pe.*(nor).^2 )*Dt + sqrt(2)*Winc1;
        Y2pe = Y2pe + (alpha*Y2pe - beta* Y2pe.*(nor).^2 )*Dt + sqrt(2)*Winc2;
        Y3pe = Y3pe + (alpha*Y3pe - beta* Y3pe.*(nor).^2 )*Dt + sqrt(2)*Winc3;
        Y4pe = Y4pe + (alpha*Y4pe - beta* Y4pe.*(nor).^2 )*Dt + sqrt(2)*Winc4;
        Y5pe = Y5pe + (alpha*Y5pe - beta* Y5pe.*(nor).^2 )*Dt + sqrt(2)*Winc5;
        Y6pe = Y6pe + (alpha*Y6pe - beta* Y6pe.*(nor).^2 )*Dt + sqrt(2)*Winc6;
        Y7pe = Y7pe + (alpha*Y7pe - beta* Y7pe.*(nor).^2 )*Dt + sqrt(2)*Winc7;
        Y8pe = Y8pe + (alpha*Y8pe - beta* Y8pe.*(nor).^2 )*Dt + sqrt(2)*Winc8;
        Y9pe = Y9pe + (alpha*Y9pe - beta* Y9pe.*(nor).^2 )*Dt + sqrt(2)*Winc9;
        Y10pe = Y10pe + (alpha*Y10pe - beta* Y10pe.*(nor).^2 )*Dt + sqrt(2)*Winc10;  
%======================================================================
    end
    
    Y1Euler(:,p) = Y1pe; 

end


ymin = min(Y1Euler);
ymax = max(Y1Euler);
x1 = linspace(ymin, ymax,20);
yy1=hist(Y1Euler,x1);
yy1=yy1/length(Y1Euler);

bar(x1,yy1,'b');
hold on;

c3=plot (x1,yy1,'r-d', 'LineWidth',1.5);

s=0;
xlabel('Solutions of the projected Langevin Monte Carlo algorithm at T=6');
ylabel('Probability density');

legend('probability (PLMC) ',' probability density ')

title('Probability density  for the projected Langevin Monte Carlo algorithm at T=6','FontSize',10);