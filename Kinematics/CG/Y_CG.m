function [z1,z2] = Y_CG(W,T,Llf,Rlf,Llr,Rlr)
% Calculate the static lateral position of the center of gravity CG
%
% Input:
% W = Weight of the car
% Llf = Corner weight on left front tire
% Rlf = Corner weight on right front tire
% Llr = Corner weight on left rear tire
% Rlr = Coner weight on right rear tire
% T = Track --> Length from right tire to left tire
%       this code assumes that both rear and front tread are the same
% 
% Output:
% z1 = lateral position measured from right tire
% z2 = lateral position measured from left tire

F_left = Llf + Llr;
F_right = Rlf + Rlr;

z1 = (F_left/W)*T;
z2 = T - z1;
end

