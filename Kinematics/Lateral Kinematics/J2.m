function J2 = J2(th1,th4)
%J2 

Jx = [cos(-th1), -cos(-th4)];

Jy = [sin(-th1), -sin(-th4)];

J2 = [Jx;Jy];
end

