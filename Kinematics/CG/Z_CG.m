function h = Z_CG(b,L,f_l,f_r,W,H)
% Calculate the Vertical component of the cars center of gravity, CG
%
% Input:
% b = distance from rear axil to center og gravity {found in X_CG}
% L = distance from front to rear axil
% Llr = Corner weight on left rear tire
% Rlr = Coner weight on right rear tire
% W = Weight of the car
% r = static radius of the tires 
% H = Hight that front tires are lifted off the ground
%
% Output:
% h = height above rear axil


th = asin(H/L);
F_front = f_l + f_r;
h = (W*cos(th)*b - L*cos(th)*F_front)/(W*sin(th));
end

