function [r6,th6] = get_r6(rch,track)
%GET_R6 
th6 = atan2(-rch,track/2);
r6 = sqrt(rch^2 + (track/2)^2);
end

