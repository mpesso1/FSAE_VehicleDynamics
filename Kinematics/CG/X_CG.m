function [a,b] = X_CG(L,W,Llf,Rlf)
% Calculates the static position of cars longitudenal position of its
% Center of Gravity, CG.
%
% Input:
% L = Wheelbase --> Distance from front axil to rear axil
% W = Total weight of the car
% Llf = Corner weight on left front tire
% Rlf = Corner weight on right front tire
% Llr = Corner weight on left rear tire
% Rlr = Coner weight on right rear tire
% 
% Output:
% a = Distance from front axil to CG
% b = Distance from rear axil to CG

Ff = Llf + Rlf; % Weight on front axil from longitude view
b = L*(Ff/W);
a = L - b;
end

