clc;clear;

%======================================================================
%Attention: 
%When d=50, Matlab can not run this code with Monte Carlo samples M=3000. 
%To solve it, we ran this program with 1000 samples, 
%each run three times with random seeds set to 100, 200, and 300, respectively, 
%and then averaged the three results
%======================================================================
rng(300,'twister');  %seed = 100, 200, 300
%======================================================================

d=50;  %dimension
Xzero = 0;   %initial value
a=1;   %\vartheta in the projected LMC algorithm

alpha = 1; beta = 4;  %parameters of the model

T=6;   %terminal time
N= T*2^(13); 
dt = T/N;

M=1000;  % Monte Carlo samples
R = [1;   16; 32; 64;128;256];

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
dW11 = sqrt(dt)*randn(M,N);
dW12 = sqrt(dt)*randn(M,N);
dW13 = sqrt(dt)*randn(M,N);
dW14 = sqrt(dt)*randn(M,N);
dW15 = sqrt(dt)*randn(M,N);
dW16 = sqrt(dt)*randn(M,N);
dW17 = sqrt(dt)*randn(M,N);
dW18 = sqrt(dt)*randn(M,N);
dW19 = sqrt(dt)*randn(M,N);
dW20 = sqrt(dt)*randn(M,N);
dW21 = sqrt(dt)*randn(M,N);
dW22 = sqrt(dt)*randn(M,N);
dW23 = sqrt(dt)*randn(M,N);
dW24 = sqrt(dt)*randn(M,N);
dW25 = sqrt(dt)*randn(M,N);
dW26 = sqrt(dt)*randn(M,N);
dW27 = sqrt(dt)*randn(M,N);
dW28 = sqrt(dt)*randn(M,N);
dW29 = sqrt(dt)*randn(M,N);
dW30 = sqrt(dt)*randn(M,N);
dW31 = sqrt(dt)*randn(M,N);
dW32 = sqrt(dt)*randn(M,N);
dW33 = sqrt(dt)*randn(M,N);
dW34 = sqrt(dt)*randn(M,N);
dW35 = sqrt(dt)*randn(M,N);
dW36 = sqrt(dt)*randn(M,N);
dW37 = sqrt(dt)*randn(M,N);
dW38 = sqrt(dt)*randn(M,N);
dW39 = sqrt(dt)*randn(M,N);
dW40 = sqrt(dt)*randn(M,N);
dW41 = sqrt(dt)*randn(M,N);
dW42 = sqrt(dt)*randn(M,N);
dW43 = sqrt(dt)*randn(M,N);
dW44 = sqrt(dt)*randn(M,N);
dW45 = sqrt(dt)*randn(M,N);
dW46 = sqrt(dt)*randn(M,N);
dW47 = sqrt(dt)*randn(M,N);
dW48 = sqrt(dt)*randn(M,N);
dW49 = sqrt(dt)*randn(M,N);
dW50 = sqrt(dt)*randn(M,N);
C=ones(M,1);
%======================================================================
B=ones(M,1);
C=ones(M,1);
%======================================================================
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
    Y7pe = Xzero* ones(M,1);
    Y8pe = Xzero* ones(M,1);
    Y9pe = Xzero* ones(M,1);
    Y10pe = Xzero* ones(M,1);
    Y11pe = Xzero* ones(M,1);
    Y12pe = Xzero* ones(M,1);
    Y13pe = Xzero* ones(M,1);
    Y14pe = Xzero* ones(M,1);
    Y15pe = Xzero* ones(M,1);
    Y16pe = Xzero* ones(M,1);
    Y17pe = Xzero* ones(M,1);
    Y18pe = Xzero* ones(M,1);
    Y19pe = Xzero* ones(M,1);
    Y20pe = Xzero* ones(M,1);
    Y21pe = Xzero* ones(M,1);
    Y22pe = Xzero* ones(M,1);
    Y23pe = Xzero* ones(M,1);
    Y24pe = Xzero* ones(M,1);
    Y25pe = Xzero* ones(M,1);
    Y26pe = Xzero* ones(M,1);
    Y27pe = Xzero* ones(M,1);
    Y28pe = Xzero* ones(M,1);
    Y29pe = Xzero* ones(M,1);
    Y30pe = Xzero* ones(M,1);
    Y31pe = Xzero* ones(M,1);
    Y32pe = Xzero* ones(M,1);
    Y33pe = Xzero* ones(M,1);
    Y34pe = Xzero* ones(M,1);
    Y35pe = Xzero* ones(M,1);
    Y36pe = Xzero* ones(M,1);
    Y37pe = Xzero* ones(M,1);
    Y38pe = Xzero* ones(M,1);
    Y39pe = Xzero* ones(M,1);
    Y40pe = Xzero* ones(M,1);
    Y41pe = Xzero* ones(M,1);
    Y42pe = Xzero* ones(M,1);
    Y43pe = Xzero* ones(M,1);
    Y44pe = Xzero* ones(M,1);
    Y45pe = Xzero* ones(M,1);
    Y46pe = Xzero* ones(M,1);
    Y47pe = Xzero* ones(M,1);
    Y48pe = Xzero* ones(M,1);
    Y49pe = Xzero* ones(M,1);
    Y50pe = Xzero* ones(M,1);
    
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
        Winc11 = sum(dW11(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc12 = sum(dW12(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc13 = sum(dW13(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc14 = sum(dW14(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc15 = sum(dW15(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc16 = sum(dW16(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc17 = sum(dW17(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc18 = sum(dW18(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc19 = sum(dW19(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc20 = sum(dW20(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc21 = sum(dW21(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc22 = sum(dW22(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc23 = sum(dW23(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc24 = sum(dW24(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc25 = sum(dW25(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc26 = sum(dW26(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc27 = sum(dW27(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc28 = sum(dW28(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc29 = sum(dW29(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc30 = sum(dW30(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc31 = sum(dW31(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc32 = sum(dW32(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc33 = sum(dW33(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc34 = sum(dW34(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc35 = sum(dW35(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc36 = sum(dW36(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc37 = sum(dW37(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc38 = sum(dW38(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc39 = sum(dW39(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc40 = sum(dW40(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc41 = sum(dW41(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc42 = sum(dW42(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc43 = sum(dW43(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc44 = sum(dW44(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc45 = sum(dW45(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc46 = sum(dW46(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc47 = sum(dW47(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc48 = sum(dW48(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc49 = sum(dW49(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc50 = sum(dW50(:,R(p)*(j-1)+1:R(p)*j),2);
%======================================================================
        nor = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2 ...
              + Y7pe.^2 + Y8pe.^2 + Y9pe.^2+ Y10pe.^2 ...
              + Y11pe.^2+ Y12pe.^2 ...
             + Y13pe.^2 + Y14pe.^2 + Y15pe.^2+ Y16pe.^2 + Y17pe.^2+ Y18pe.^2 ...
             + Y19pe.^2 + Y20pe.^2 ...
             + Y21pe.^2+ Y22pe.^2 + Y23pe.^2+ Y24pe.^2 ...
             + Y25pe.^2 + Y26pe.^2 + Y27pe.^2+ Y28pe.^2 + Y29pe.^2+ Y30pe.^2 ...
             + Y31pe.^2 + Y32pe.^2 + Y33pe.^2+ Y34pe.^2 + Y35pe.^2+ Y36pe.^2 ...
             + Y37pe.^2 + Y38pe.^2 + Y39pe.^2+ Y40pe.^2 + Y41pe.^2+ Y42pe.^2 ...
             + Y43pe.^2 + Y44pe.^2 + Y45pe.^2+ Y46pe.^2 + Y47pe.^2+ Y48pe.^2 ...
             + Y49pe.^2 + Y50pe.^2 ).^(0.5);
        %======================================================================
        tamed = (B+Dt*nor.^6).^0.5;
        %======================================================================
        Y1pe = Y1pe + (alpha* Y1pe - beta* Y1pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc1;
        Y2pe = Y2pe + (alpha* Y2pe - beta* Y2pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc2;
        Y3pe = Y3pe + (alpha* Y3pe - beta* Y3pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc3;
        Y4pe = Y4pe + (alpha* Y4pe - beta* Y4pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc4;
        Y5pe = Y5pe + (alpha* Y5pe - beta* Y5pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc5;
        Y6pe = Y6pe + (alpha* Y6pe - beta* Y6pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc6;
        Y7pe = Y7pe + (alpha* Y7pe - beta* Y7pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc7;
        Y8pe = Y8pe + (alpha* Y8pe - beta* Y8pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc8;
        Y9pe = Y9pe + (alpha* Y9pe - beta* Y9pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc9;
        Y10pe = Y10pe + (alpha* Y10pe - beta* Y10pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc10;
        Y11pe = Y11pe + (alpha* Y11pe - beta* Y11pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc11;
        Y12pe = Y12pe + (alpha* Y12pe - beta* Y12pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc12;
        Y13pe = Y13pe + (alpha* Y13pe - beta* Y13pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc13;
        Y14pe = Y14pe + (alpha* Y14pe - beta* Y14pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc14;
        Y15pe = Y15pe + (alpha* Y15pe - beta* Y15pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc15;
        Y16pe = Y16pe + (alpha* Y16pe - beta* Y16pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc16;
        Y17pe = Y17pe + (alpha* Y17pe - beta* Y17pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc17;
        Y18pe = Y18pe + (alpha* Y18pe - beta* Y18pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc18;
        Y19pe = Y19pe + (alpha* Y19pe - beta* Y19pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc19;
        Y20pe = Y20pe + (alpha* Y20pe - beta* Y20pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc20;
        Y21pe = Y21pe + (alpha* Y21pe - beta* Y21pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc21;
        Y22pe = Y22pe + (alpha* Y22pe - beta* Y22pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc22;
        Y23pe = Y23pe + (alpha* Y23pe - beta* Y23pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc23;
        Y24pe = Y24pe + (alpha* Y24pe - beta* Y24pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc24;
        Y25pe = Y25pe + (alpha* Y25pe - beta* Y25pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc25;
        Y26pe = Y26pe + (alpha* Y26pe - beta* Y26pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc26;
        Y27pe = Y27pe + (alpha* Y27pe - beta* Y27pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc27;
        Y28pe = Y28pe + (alpha* Y28pe - beta* Y28pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc28;
        Y29pe = Y29pe + (alpha* Y29pe - beta* Y29pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc29;
        Y30pe = Y30pe + (alpha* Y30pe - beta* Y30pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc30;  
        Y31pe = Y31pe + (alpha* Y31pe - beta* Y31pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc31;
        Y32pe = Y32pe + (alpha* Y32pe - beta* Y32pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc32;
        Y33pe = Y33pe + (alpha* Y33pe - beta* Y33pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc33;
        Y34pe = Y34pe + (alpha* Y34pe - beta* Y34pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc34;
        Y35pe = Y35pe + (alpha* Y35pe - beta* Y35pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc35;
        Y36pe = Y36pe + (alpha* Y36pe - beta* Y36pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc36;
        Y37pe = Y37pe + (alpha* Y37pe - beta* Y37pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc37;
        Y38pe = Y38pe + (alpha* Y38pe - beta* Y38pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc38;
        Y39pe = Y39pe + (alpha* Y39pe - beta* Y39pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc39;
        Y40pe = Y40pe + (alpha* Y40pe - beta* Y40pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc40;
        Y41pe = Y41pe + (alpha* Y41pe - beta* Y41pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc41;
        Y42pe = Y42pe + (alpha* Y42pe - beta* Y42pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc42;
        Y43pe = Y43pe + (alpha* Y43pe - beta* Y43pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc43;
        Y44pe = Y44pe + (alpha* Y44pe - beta* Y44pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc44;
        Y45pe = Y45pe + (alpha* Y45pe - beta* Y45pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc45;
        Y46pe = Y46pe + (alpha* Y46pe - beta* Y46pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc46;
        Y47pe = Y47pe + (alpha* Y47pe - beta* Y47pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc47;
        Y48pe = Y48pe + (alpha* Y48pe - beta* Y48pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc48;
        Y49pe = Y49pe + (alpha* Y49pe - beta* Y49pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc49;
        Y50pe = Y50pe + (alpha* Y50pe - beta* Y50pe.*(nor).^2 ) * Dt./ tamed + sqrt(2)*Winc50;
     end
         
         norm_num(:,p) = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2 ...
              + Y7pe.^2 + Y8pe.^2 + Y9pe.^2+ Y10pe.^2 ...
              + Y11pe.^2+ Y12pe.^2 ...
             + Y13pe.^2 + Y14pe.^2 + Y15pe.^2+ Y16pe.^2 + Y17pe.^2+ Y18pe.^2 ...
             + Y19pe.^2 + Y20pe.^2 ...
             + Y21pe.^2+ Y22pe.^2 + Y23pe.^2+ Y24pe.^2 ...
             + Y25pe.^2 + Y26pe.^2 + Y27pe.^2+ Y28pe.^2 + Y29pe.^2+ Y30pe.^2 ...
             + Y31pe.^2 + Y32pe.^2 + Y33pe.^2+ Y34pe.^2 + Y35pe.^2+ Y36pe.^2 ...
             + Y37pe.^2 + Y38pe.^2 + Y39pe.^2+ Y40pe.^2 + Y41pe.^2+ Y42pe.^2 ...
             + Y43pe.^2 + Y44pe.^2 + Y45pe.^2+ Y46pe.^2 + Y47pe.^2+ Y48pe.^2 ...
             + Y49pe.^2 + Y50pe.^2 ).^(0.5);

         
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
    Y7pe = Xzero* ones(M,1);
    Y8pe = Xzero* ones(M,1);
    Y9pe = Xzero* ones(M,1);
    Y10pe = Xzero* ones(M,1);
    Y11pe = Xzero* ones(M,1);
    Y12pe = Xzero* ones(M,1);
    Y13pe = Xzero* ones(M,1);
    Y14pe = Xzero* ones(M,1);
    Y15pe = Xzero* ones(M,1);
    Y16pe = Xzero* ones(M,1);
    Y17pe = Xzero* ones(M,1);
    Y18pe = Xzero* ones(M,1);
    Y19pe = Xzero* ones(M,1);
    Y20pe = Xzero* ones(M,1);
    Y21pe = Xzero* ones(M,1);
    Y22pe = Xzero* ones(M,1);
    Y23pe = Xzero* ones(M,1);
    Y24pe = Xzero* ones(M,1);
    Y25pe = Xzero* ones(M,1);
    Y26pe = Xzero* ones(M,1);
    Y27pe = Xzero* ones(M,1);
    Y28pe = Xzero* ones(M,1);
    Y29pe = Xzero* ones(M,1);
    Y30pe = Xzero* ones(M,1);
    Y31pe = Xzero* ones(M,1);
    Y32pe = Xzero* ones(M,1);
    Y33pe = Xzero* ones(M,1);
    Y34pe = Xzero* ones(M,1);
    Y35pe = Xzero* ones(M,1);
    Y36pe = Xzero* ones(M,1);
    Y37pe = Xzero* ones(M,1);
    Y38pe = Xzero* ones(M,1);
    Y39pe = Xzero* ones(M,1);
    Y40pe = Xzero* ones(M,1);
    Y41pe = Xzero* ones(M,1);
    Y42pe = Xzero* ones(M,1);
    Y43pe = Xzero* ones(M,1);
    Y44pe = Xzero* ones(M,1);
    Y45pe = Xzero* ones(M,1);
    Y46pe = Xzero* ones(M,1);
    Y47pe = Xzero* ones(M,1);
    Y48pe = Xzero* ones(M,1);
    Y49pe = Xzero* ones(M,1);
    Y50pe = Xzero* ones(M,1);
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
        Winc11 = sum(dW11(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc12 = sum(dW12(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc13 = sum(dW13(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc14 = sum(dW14(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc15 = sum(dW15(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc16 = sum(dW16(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc17 = sum(dW17(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc18 = sum(dW18(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc19 = sum(dW19(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc20 = sum(dW20(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc21 = sum(dW21(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc22 = sum(dW22(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc23 = sum(dW23(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc24 = sum(dW24(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc25 = sum(dW25(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc26 = sum(dW26(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc27 = sum(dW27(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc28 = sum(dW28(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc29 = sum(dW29(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc30 = sum(dW30(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc31 = sum(dW31(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc32 = sum(dW32(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc33 = sum(dW33(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc34 = sum(dW34(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc35 = sum(dW35(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc36 = sum(dW36(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc37 = sum(dW37(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc38 = sum(dW38(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc39 = sum(dW39(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc40 = sum(dW40(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc41 = sum(dW41(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc42 = sum(dW42(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc43 = sum(dW43(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc44 = sum(dW44(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc45 = sum(dW45(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc46 = sum(dW46(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc47 = sum(dW47(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc48 = sum(dW48(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc49 = sum(dW49(:,R(p)*(j-1)+1:R(p)*j),2);
        Winc50 = sum(dW50(:,R(p)*(j-1)+1:R(p)*j),2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        nor = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2 ...
              + Y7pe.^2 + Y8pe.^2 + Y9pe.^2+ Y10pe.^2 ...
              + Y11pe.^2+ Y12pe.^2 ...
             + Y13pe.^2 + Y14pe.^2 + Y15pe.^2+ Y16pe.^2 + Y17pe.^2+ Y18pe.^2 ...
             + Y19pe.^2 + Y20pe.^2 ...
             + Y21pe.^2+ Y22pe.^2 + Y23pe.^2+ Y24pe.^2 ...
             + Y25pe.^2 + Y26pe.^2 + Y27pe.^2+ Y28pe.^2 + Y29pe.^2+ Y30pe.^2 ...
             + Y31pe.^2 + Y32pe.^2 + Y33pe.^2+ Y34pe.^2 + Y35pe.^2+ Y36pe.^2 ...
             + Y37pe.^2 + Y38pe.^2 + Y39pe.^2+ Y40pe.^2 + Y41pe.^2+ Y42pe.^2 ...
             + Y43pe.^2 + Y44pe.^2 + Y45pe.^2+ Y46pe.^2 + Y47pe.^2+ Y48pe.^2 ...
             + Y49pe.^2 + Y50pe.^2 ).^(0.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
        Y1pe = Y1pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y2pe = Y2pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y3pe = Y3pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y4pe = Y4pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y5pe = Y5pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y6pe = Y6pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y7pe = Y7pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y8pe = Y8pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y9pe = Y9pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y10pe = Y10pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y11pe = Y11pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y12pe = Y12pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y13pe = Y13pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y14pe = Y14pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y15pe = Y15pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y16pe = Y16pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y17pe = Y17pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y18pe = Y18pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y19pe = Y19pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y20pe = Y20pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y21pe = Y21pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y22pe = Y22pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y23pe = Y23pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y24pe = Y24pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y25pe = Y25pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y26pe = Y26pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y27pe = Y27pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y28pe = Y28pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y29pe = Y29pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y30pe = Y30pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y31pe = Y31pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y32pe = Y32pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y33pe = Y33pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y34pe = Y34pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y35pe = Y35pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y36pe = Y36pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y37pe = Y37pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y38pe = Y38pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y39pe = Y39pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y40pe = Y40pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y41pe = Y41pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y42pe = Y42pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y43pe = Y43pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y44pe = Y44pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y45pe = Y45pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y46pe = Y46pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y47pe = Y47pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y48pe = Y48pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y49pe = Y49pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
        Y50pe = Y50pe.*min([B,a*d^(1/6)*(1/Dt)^(1/6)* nor.^(-1) ],[],2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
  
        Y1pe = Y1pe + (alpha*Y1pe - beta*Y1pe.*(nor).^2 )*Dt + sqrt(2)*Winc1;
        Y2pe = Y2pe + (alpha*Y2pe - beta*Y2pe.*(nor).^2 )*Dt + sqrt(2)*Winc2;
        Y3pe = Y3pe + (alpha*Y3pe - beta*Y3pe.*(nor).^2 )*Dt + sqrt(2)*Winc3;
        Y4pe = Y4pe + (alpha*Y4pe - beta*Y4pe.*(nor).^2 )*Dt + sqrt(2)*Winc4;
        Y5pe = Y5pe + (alpha*Y5pe - beta*Y5pe.*(nor).^2 )*Dt + sqrt(2)*Winc5;
        Y6pe = Y6pe + (alpha*Y6pe - beta*Y6pe.*(nor).^2 )*Dt + sqrt(2)*Winc6;
        Y7pe = Y7pe + (alpha*Y7pe - beta*Y7pe.*(nor).^2 )*Dt + sqrt(2)*Winc7;
        Y8pe = Y8pe + (alpha*Y8pe - beta*Y8pe.*(nor).^2 )*Dt + sqrt(2)*Winc8;
        Y9pe = Y9pe + (alpha*Y9pe - beta*Y9pe.*(nor).^2 )*Dt + sqrt(2)*Winc9;
        Y10pe = Y10pe + (alpha*Y10pe - beta*Y10pe.*(nor).^2 )*Dt + sqrt(2)*Winc10;  
        Y11pe = Y11pe + (alpha*Y11pe - beta*Y11pe.*(nor).^2 )*Dt + sqrt(2)*Winc11;
        Y12pe = Y12pe + (alpha*Y12pe - beta*Y12pe.*(nor).^2 )*Dt + sqrt(2)*Winc12;
        Y13pe = Y13pe + (alpha*Y13pe - beta*Y13pe.*(nor).^2 )*Dt + sqrt(2)*Winc13;
        Y14pe = Y14pe + (alpha*Y14pe - beta*Y14pe.*(nor).^2 )*Dt + sqrt(2)*Winc14;
        Y15pe = Y15pe + (alpha*Y15pe - beta*Y15pe.*(nor).^2 )*Dt + sqrt(2)*Winc15;
        Y16pe = Y16pe + (alpha*Y16pe - beta*Y16pe.*(nor).^2 )*Dt + sqrt(2)*Winc16;
        Y17pe = Y17pe + (alpha*Y17pe - beta*Y17pe.*(nor).^2 )*Dt + sqrt(2)*Winc17;
        Y18pe = Y18pe + (alpha*Y18pe - beta*Y18pe.*(nor).^2 )*Dt + sqrt(2)*Winc18;
        Y19pe = Y19pe + (alpha*Y19pe - beta*Y19pe.*(nor).^2 )*Dt + sqrt(2)*Winc19;
        Y20pe = Y20pe + (alpha*Y20pe - beta*Y20pe.*(nor).^2 )*Dt + sqrt(2)*Winc20;   
        Y21pe = Y21pe + (alpha*Y21pe - beta*Y21pe.*(nor).^2 )*Dt + sqrt(2)*Winc21;
        Y22pe = Y22pe + (alpha*Y22pe - beta*Y22pe.*(nor).^2 )*Dt + sqrt(2)*Winc22;
        Y23pe = Y23pe + (alpha*Y23pe - beta*Y23pe.*(nor).^2 )*Dt + sqrt(2)*Winc23;
        Y24pe = Y24pe + (alpha*Y24pe - beta*Y24pe.*(nor).^2 )*Dt + sqrt(2)*Winc24;
        Y25pe = Y25pe + (alpha*Y25pe - beta*Y25pe.*(nor).^2 )*Dt + sqrt(2)*Winc25;
        Y26pe = Y26pe + (alpha*Y26pe - beta*Y26pe.*(nor).^2 )*Dt + sqrt(2)*Winc26;
        Y27pe = Y27pe + (alpha*Y27pe - beta*Y27pe.*(nor).^2 )*Dt + sqrt(2)*Winc27;
        Y28pe = Y28pe + (alpha*Y28pe - beta*Y28pe.*(nor).^2 )*Dt + sqrt(2)*Winc28;
        Y29pe = Y29pe + (alpha*Y29pe - beta*Y29pe.*(nor).^2 )*Dt + sqrt(2)*Winc29;
        Y30pe = Y30pe + (alpha*Y30pe - beta*Y30pe.*(nor).^2 )*Dt + sqrt(2)*Winc30;    
        Y31pe = Y31pe + (alpha*Y31pe - beta*Y31pe.*(nor).^2 )*Dt + sqrt(2)*Winc31;
        Y32pe = Y32pe + (alpha*Y32pe - beta*Y32pe.*(nor).^2 )*Dt + sqrt(2)*Winc32;
        Y33pe = Y33pe + (alpha*Y33pe - beta*Y33pe.*(nor).^2 )*Dt + sqrt(2)*Winc33;
        Y34pe = Y34pe + (alpha*Y34pe - beta*Y34pe.*(nor).^2 )*Dt + sqrt(2)*Winc34;
        Y35pe = Y35pe + (alpha*Y35pe - beta*Y35pe.*(nor).^2 )*Dt + sqrt(2)*Winc35;
        Y36pe = Y36pe + (alpha*Y36pe - beta*Y36pe.*(nor).^2 )*Dt + sqrt(2)*Winc36;
        Y37pe = Y37pe + (alpha*Y37pe - beta*Y37pe.*(nor).^2 )*Dt + sqrt(2)*Winc37;
        Y38pe = Y38pe + (alpha*Y38pe - beta*Y38pe.*(nor).^2 )*Dt + sqrt(2)*Winc38;
        Y39pe = Y39pe + (alpha*Y39pe - beta*Y39pe.*(nor).^2 )*Dt + sqrt(2)*Winc39;
        Y40pe = Y40pe + (alpha*Y40pe - beta*Y40pe.*(nor).^2 )*Dt + sqrt(2)*Winc40;  
        Y41pe = Y41pe + (alpha*Y41pe - beta*Y41pe.*(nor).^2 )*Dt + sqrt(2)*Winc41;
        Y42pe = Y42pe + (alpha*Y42pe - beta*Y42pe.*(nor).^2 )*Dt + sqrt(2)*Winc42;
        Y43pe = Y43pe + (alpha*Y43pe - beta*Y43pe.*(nor).^2 )*Dt + sqrt(2)*Winc43;
        Y44pe = Y44pe + (alpha*Y44pe - beta*Y44pe.*(nor).^2 )*Dt + sqrt(2)*Winc44;
        Y45pe = Y45pe + (alpha*Y45pe - beta*Y45pe.*(nor).^2 )*Dt + sqrt(2)*Winc45;
        Y46pe = Y46pe + (alpha*Y46pe - beta*Y46pe.*(nor).^2 )*Dt + sqrt(2)*Winc46;
        Y47pe = Y47pe + (alpha*Y47pe - beta*Y47pe.*(nor).^2 )*Dt + sqrt(2)*Winc47;
        Y48pe = Y48pe + (alpha*Y48pe - beta*Y48pe.*(nor).^2 )*Dt + sqrt(2)*Winc48;
        Y49pe = Y49pe + (alpha*Y49pe - beta*Y49pe.*(nor).^2 )*Dt + sqrt(2)*Winc49;
        Y50pe = Y50pe + (alpha*Y50pe - beta*Y50pe.*(nor).^2 )*Dt + sqrt(2)*Winc50;
    end

%======================================================================
        norm_num(:,p) = (Y1pe.^2 + Y2pe.^2 + Y3pe.^2+ Y4pe.^2 + Y5pe.^2 + Y6pe.^2 ...
             + Y7pe.^2 + Y8pe.^2 + Y9pe.^2+ Y10pe.^2 + Y11pe.^2+ Y12pe.^2 ...
             + Y13pe.^2 + Y14pe.^2 + Y15pe.^2+ Y16pe.^2 + Y17pe.^2+ Y18pe.^2 ...
             + Y19pe.^2 + Y20pe.^2 + Y21pe.^2+ Y22pe.^2 + Y23pe.^2+ Y24pe.^2 ...
             + Y25pe.^2 + Y26pe.^2 + Y27pe.^2+ Y28pe.^2 + Y29pe.^2+ Y30pe.^2 ...
             + Y31pe.^2 + Y32pe.^2 + Y33pe.^2+ Y34pe.^2 + Y35pe.^2+ Y36pe.^2 ...
             + Y37pe.^2 + Y38pe.^2 + Y39pe.^2+ Y40pe.^2 + Y41pe.^2+ Y42pe.^2 ...
             + Y43pe.^2 + Y44pe.^2 + Y45pe.^2+ Y46pe.^2 + Y47pe.^2+ Y48pe.^2 ...
            + Y49pe.^2 + Y50pe.^2 ).^(0.5);

     
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


%expectations approximated by M=1000 Monte Carlo samples
error= abs(mean(True_err));
error1= abs(mean(True_err1));
error2= abs(mean(True_err2));
error4= abs(mean(True_err4));

%======================================================================
%Next is a rough plot of the convergence rate results
%The plot of the convergence rate and the table of all errors as shown 
%in the paper is in 'plot50d.m'
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