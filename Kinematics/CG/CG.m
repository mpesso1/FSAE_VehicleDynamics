clear;clc;

L = 64; %in --> wheelbase
W = 600; %lbs --> total weight
Llf = 140; %lbs --> left front weight
Rlf = 140; %lbs --> right front weight
Llr = 160; %lbs --> left rear weight
Rlr = 160; %lbs --> right rear weight
T = 55; %in --> track := average between front and rear
H = 31; %in --> height that car was lifted on cg test
r = 8; %in --> radius of tires
f_l = 120; %lbs --> front left weight during lift
f_r = 120; %lbs --> front right weight during lift

Wheel_Center_Line_above_ground = 8; %in


[a,b] = X_CG(L,W,Llf,Rlf); % Longitude position of CG ->
h = Z_CG(b,L,f_l,f_r,W,H) + Wheel_Center_Line_above_ground; % Vertical position of CG ^ 
% [y1,y2] = Y_CG(W,T,Llf,Rlf,Llr,Rlr); % Lateral position of CG *
% 
print_values(h,b,a);