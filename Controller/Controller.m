clear all;
close all;

s = tf('s');

L = 0.4125;
Rc = 10;
Rs = 1;
Km = 6.5308*10^-5;
Mb = 0.068;
G = 9.81;

x_o = 0.014;
i_o = sqrt((2*Mb*G*x_o^2)/(Km));
v_o = (Rc+Rs)*i_o;

%% Transfer Functions
%% ----------------------------------------------------------------------
%% Circuit
numC = 1;
denC = [0.4125 11];
%% Controllable Canonical Form 
[AC,BC,CC,DC] = tf2ss(numC,denC);
%% Transfer Function
Circuit = 1/(0.4125*s+11);

%% ----------------------------------------------------------------------
%% Ball
numB = ((Km*i_o)/(x_o^2));
denB = [-Mb 0 (((Km*i_o^2)/(x_o^3)))];
%% Controllable Canonical Form
[AB,BB,CB,DB] = tf2ss(numB,denB);
%% Transfer Function
Ball = -1.333/(0.068*s^2-190.6);
%% ----------------------------------------------------------------------

%% Controllability

if ((length(AC) - rank(ctrb(AC,BC)) == 0) && (length(AB) - rank(ctrb(AB,BB)) == 0))
    disp('The Circuit & Ball is fully controllable');
else
    disp('The Circuit or the ball is not controllable');
end

%% Startup Controller
PI = 27.341*((1+0.057*s)/(s));
innerLoop = feedback(PI*Circuit,1);


