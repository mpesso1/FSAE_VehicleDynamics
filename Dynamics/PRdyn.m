function dy = PRdyn(t,y,ft,f)

mt = 12.59; %kg mass of tire --- inertia effects
mc = 43; %kg coner weight on tire --- force
l3 = .1016; %m length to pull rod 
l4 = .0508; %m length to spring and damper
kt = 81.64; %N/m spring in tire
ks = 43781.7; %N/m spring in actual spring
b = 700; %Ns/m damping friction
%f = interp1(ft,f,t,'spline'); %N interpolation to make time values match
f = 0; %N
g = 9.81; %m/s^2 gravity



dy = [(l3/l4)*(y(2)/mt);...
    mc*g + f - kt*y(3) - (l3/l4)*ks*y(1) - (l3/l4)^2*(y(2)*b/mt);...
    y(2)/mt];


