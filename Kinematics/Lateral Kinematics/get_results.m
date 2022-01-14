function get_results(r2,r3,g)
%GET_RESULTS
%   r2 = distance from each A arm mounting point on upright
%   r3 = distance that upper aarm mounting point is lateraly offset from bottom mounting point

disp(['King Pin Inclination: ',num2str((r3/r2)*180/pi),' deg']);
disp('    To change caster change the value of r3')
disp('  ');
disp(['estimated roll center hieght: ',num2str(g),' in']);
disp('    To alter roll center height adjust the angle of the upper and lower control arm')




end

