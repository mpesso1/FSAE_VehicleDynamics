function size = get_needed_size(start,end_pos,res)
%GET_NEEDED_SIZE Summary of this function goes here
%   Detailed explanation goes here
size = (start-end_pos)/res;
if size ~= abs(size) 
    size = round(size*-1);
else
    size = round(size);
end
end

