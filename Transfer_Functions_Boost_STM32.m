close all

format longG

E  = 12;  
Rl  = 25;
rL = 9e-3;
rDS = 31e-3;
L  = 15e-6;
Co = 40e-6; 
D  = 0.5;   
Dp = 1-D;
fs = 500e3;          
Ts = 1/fs;

VC = (E*Rl)/(Dp*(Rl+rL+(D*rDS)));
IL = (VC*Dp)/Rl;

a = (L+(D*rDS + rL)*Co*Rl)/(L*Co*Rl);
b = ((Dp^2)*Rl + D*rDS + rL)/(L*Co*Rl);

c = -IL/Co;
d = -((D*rDS + rDS*Dp + rL)*IL - VC*Dp)/(L*Co);

den = [1, a, b];          
num = [0, c, d];           

Gv = tf(num, den);
