clc;clear;
%===================================
rng(100,'twister');  
%===================================

%Parameter settings
d=6;   %dimension
Xzero = 0;   %initial value
alpha = 1; beta = 4;  %parameters of the model 
T=6;   %terminal time
N= T*2^(13); 
dt = T/N;

M=3000;  % Monte Carlo samples
R = [1;  16; 32; 64;128;256];

dW1 = sqrt(dt)*randn(M,N);
dW2 = sqrt(dt)*randn(M,N);
dW3 = sqrt(dt)*randn(M,N);
dW4 = sqrt(dt)*randn(M,N);
dW5 = sqrt(dt)*randn(M,N);
dW6 = sqrt(dt)*randn(M,N);
%===================================
B=ones(M,1);
C=ones(M,1);
%===================================
Ysol=zeros(M,6);  %store the indicator function of the solution
Ysol2=zeros(M,6);  %store the step funciton of the solution


% p=1: reference solution -- modified tamed unadjusted Langevin Monte Carlo algorithm
for p=1
    
    Dt = R(p)*dt; L = N/R(p);
    Y1pe = Xzero* ones(M,1);
    Y2pe = Xzero* ones(M,1);
    Y3pe = Xzero* ones(M,1);
    Y4pe = Xzero* ones(M,1);
    Y5pe = Xzero* ones(M,1);
    Y6pe = Xzero* ones(M,1);
        
    for j=1:L
        Winc1 = sum(dW1(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc2 = sum(dW2(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc3 = sum(dW3(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc4 = sum(dW4(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc5 = sum(dW5(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc6 = sum(dW6(:,R(p)*(j-1)+1:R(p)*j),2);
        nor = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2).^(0.5);
        tamed = (B+Dt*nor.^6).^0.5;
        Y1pe = Y1pe + (alpha* Y1pe - beta* Y1pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc1;
        Y2pe = Y2pe + (alpha* Y2pe - beta* Y2pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc2;
        Y3pe = Y3pe + (alpha* Y3pe - beta* Y3pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc3;
        Y4pe = Y4pe + (alpha* Y4pe - beta* Y4pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc4;
        Y5pe = Y5pe + (alpha* Y5pe - beta* Y5pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc5;
        Y6pe = Y6pe + (alpha* Y6pe - beta* Y6pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc6;
        
        end

         norm_num(:,p) = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2+ Y6pe.^2).^(0.5);
 
%=================================== indicator function ===================================


              for i=1:M
                if  norm_num(i,p)>1.5 && norm_num(i,p)<2
                    Ysol(i,p) =1;
                else if  norm_num(i,p)>2.5 && norm_num(i,p)<3
                    Ysol(i,p) =1;
                else if  norm_num(i,p)>0 && norm_num(i,p)<0.5 
                      Ysol(i,p) =1;
                else
                    Ysol(i,p) =0;
                    end
                    end
                end
              end

 %================================== step function ====================================
          for i=1:M
                if  norm_num(i,p)<0.5  
                    Ysol2(i,p) =0;
                else if norm_num(i,p)>=0.5 && norm_num(i,p)<1
                    Ysol2(i,p) =1;
                else if norm_num(i,p)>=1 && norm_num(i,p)<1.5
                    Ysol2(i,p) =0.5;   
                else if norm_num(i,p)>=1.5 && norm_num(i,p)<2
                    Ysol2(i,p) =-1;
                else if norm_num(i,p)>=2 && norm_num(i,p)<2.5
                    Ysol2(i,p) =0.25;
                    else 
                        Ysol2(i,p) =-0.5;
                    end
                    end
                    end
                    end
                end
          end   
          
%======================================================================
           

end


% p=2:6: numerical solutions -- projected Langevin Monte Carlo algorithm
for p=2:6
    
    Dt = R(p)*dt; L = N/R(p);
    Y1pe = Xzero* ones(M,1);
    Y2pe = Xzero* ones(M,1);
    Y3pe = Xzero* ones(M,1);
    Y4pe = Xzero* ones(M,1);
    Y5pe = Xzero* ones(M,1);
    Y6pe = Xzero* ones(M,1);
    
    for j=1:L
        Winc1 = sum(dW1(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc2 = sum(dW2(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc3 = sum(dW3(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc4 = sum(dW4(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc5 = sum(dW5(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc6 = sum(dW6(:,R(p)*(j-1)+1:R(p)*j),2);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        nor = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2).^(0.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
        Y1pe = Y1pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y2pe = Y2pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y3pe = Y3pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y4pe = Y4pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y5pe = Y5pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y6pe = Y6pe.*min([B,d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
        Y1pe = Y1pe + (alpha*Y1pe - beta*Y1pe.*(nor).^2 )*Dt + sqrt(2)*Winc1;
        Y2pe = Y2pe + (alpha*Y2pe - beta*Y2pe.*(nor).^2 )*Dt + sqrt(2)*Winc2;
        Y3pe = Y3pe + (alpha*Y3pe - beta*Y3pe.*(nor).^2 )*Dt + sqrt(2)*Winc3;
        Y4pe = Y4pe + (alpha*Y4pe - beta*Y4pe.*(nor).^2 )*Dt + sqrt(2)*Winc4;
        Y5pe = Y5pe + (alpha*Y5pe - beta*Y5pe.*(nor).^2 )*Dt + sqrt(2)*Winc5;
        Y6pe = Y6pe + (alpha*Y6pe - beta*Y6pe.*(nor).^2 )*Dt + sqrt(2)*Winc6;
    end
 


        norm_num(:,p) = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2).^(0.5);

%=================================== indicator function ===================================
          for i=1:M
                if  norm_num(i,p)>1.5 && norm_num(i,p)<2
                    Ysol(i,p) =1;
                else if  norm_num(i,p)>2.5 && norm_num(i,p)<3
                    Ysol(i,p) =1;
                else if  norm_num(i,p)>0 && norm_num(i,p)<0.5 
                      Ysol(i,p) =1;
                else
                    Ysol(i,p) =0;
                    end
                    end
                end
          end
          
%=================================== step function ===================================
            
          for i=1:M
                if  norm_num(i,p)<0.5  
                    Ysol2(i,p) =0;
                else if norm_num(i,p)>=0.5 && norm_num(i,p)<1
                    Ysol2(i,p) =1;
                else if norm_num(i,p)>=1 && norm_num(i,p)<1.5
                    Ysol2(i,p) =0.5;   
                else if norm_num(i,p)>=1.5 && norm_num(i,p)<2
                    Ysol2(i,p) =-1;
                else if norm_num(i,p)>=2 && norm_num(i,p)<2.5
                    Ysol2(i,p) =0.25;
                    else 
                        Ysol2(i,p) =-0.5;
                    end
                    end
                    end
                    end
                end
          end             
%====================================================================== 

end

True_err=Ysol(:,2:6) - repmat(Ysol(:,1),1,5);  %store errors of indicator functions
True_err1=exp(-norm_num(:,2:6)) - repmat(exp(-norm_num(:,1)),1,5);  %store errors of \exp functions
True_err2=Ysol2(:,2:6) - repmat(Ysol2(:,1),1,5);  %store errors of step functions
True_err4=atan(norm_num(:,2:6)) - repmat(atan(norm_num(:,1)),1,5);  %store errors of \arctan functions

%expectations approximated by M=3000 Monte Carlo samples
error= abs(mean(True_err));
error1= abs(mean(True_err1));
error2= abs(mean(True_err2));
error4= abs(mean(True_err4));

%======================================================================
%Next is a rough plot of the convergence rate results
%The plot of the convergence rate and the table of all errors as shown 
%in the paper is in 'plot6d.m'
%======================================================================
Dtvals = dt*R(2:6);
loglog(Dtvals,error,'b*-');
hold on;
loglog(Dtvals,error1,'g*-');
hold on;
loglog(Dtvals,error2,'r*-');
hold on;
%loglog(Dtvals,error3,'y*-');
%hold on;
loglog(Dtvals,error4,'c*-');
hold on;
loglog(Dtvals,Dtvals.^0.5,'r--');
hold on;
loglog(Dtvals,Dtvals,'r--');
hold on;
axis([1e-4 1e-1 1e-6 1]);
xlabel('h')
ylabel('errors')
title('The Weak Convergence Rate','FontSize',10)
legend('\phi(x)=indicator function', '\phi(x)=exp(-||x||)','\phi(x)=ladder function','\phi(x)=arctan(||x||)','order 1.0','order 0.5', 'location','SouthEast');

A = [ones(5,1), log(Dtvals)]; rhs = log(mean(True_err)');
sol = A\rhs; q = sol(2)
resid = norm(A*sol - rhs)