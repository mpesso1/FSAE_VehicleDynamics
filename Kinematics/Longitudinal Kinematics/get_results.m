function get_results(th2_last,r1,th4)
%GET_RESULTS
%   r2 = distance from each A arm mounting point on upright
%   r3 = distance that upper aarm mounting point is lateraly offset from bottom mounting point

disp(['initial caster: ',num2str(th4*(180/pi)-90),' deg']);
disp('    Can change varibales to chage inittial caster')
disp('  ');
disp(['change in caster from elevating:  ',num2str((pi/2-th2_last)-(th4)),' deg']);
disp('  ');
disp(['total amount of wheel travel: ',num2str(r1), 'in']);
end

