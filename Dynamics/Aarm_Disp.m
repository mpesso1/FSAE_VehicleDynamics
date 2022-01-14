clear;clc;
% Front Suspension
% ---------------------------------------------
% ---------------------------------------------

% ====== Front Suspension Parameters ======

mt = 6.649; %kg mass of tire --- inertia effects (14.66lbs)
mc = 63.5; %kg coner weight on tire --- force
kt = 600; %N/m spring in tire
ks = 52538; %N/m spring in actual spring 250lbf/in**
b = 2000; %Ns/m damping friction

track_front = 1.168; % m

sf = .430; % m --> spring base

rch_front = 0.058; % m --> height of front roll center


l3 = .0807; %m length to spring and damper 
l4 = .0358; % m length to pull rod
gravity = 9.81; %m/s^2 gravityGPS_Altitudem


% ====== Front Suspension Geometry ======

R1 = 6; %in -- chassis welds
R2 = 11.25; %in -- UCA
R3 = 7.625; %in -- knuckle welds
R4 = 13.75; %in -- LCA

th1 = 9*pi/20; %rad

% ---------------------------------------------
% ---------------------------------------------



% Rear Suspension
% ---------------------------------------------
% ---------------------------------------------

% ====== Rear Suspension Parameters ======

mtb = 11.19; %kg mass of tire --- inertia effects
mcb = 72.57; %kg coner weight on tire --- force
ktb = 600; %N/m spring in tire
ksb = 61294.38; %N/m spring in actual spring 300lbf/in**
bb = 2000; %Ns/m damping friction

track_rear = 1.143; % m

sr = .426; % m --> spring base

rch_rear = .0887; % m --> height of rear roll center off of ground

l3b = .0774; %m length to spring and damper 
l4b = .0628; %m length to pull rod
gravity = 9.81; %m/s^2 gravityGPS_Altitudem


% ====== Rear Suspension Geometry ======

R5 = 5; %in -- chassis welds
R6 = 9.5; %in -- UCA
R7 = 6.625; %in -- knuckle welds
R8 = 13; %in -- LCA

th5 = 7*pi/15; %rad

% ---------------------------------------------
% ---------------------------------------------


% Guesses --- irelavent
th7r= pi*2/3; 
th8r  = 0;


% Guesses --- irelavent
th3r= pi*2/3; 
th4r  = 0;



% Algorithm
% ------------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------------
E = @(th2,th3r,th4r) [-(R1*cos(th1) + R2*cos(th2) - R3*cos(th3r) - R4*cos(th4r));...
                    -(R1*sin(th1) + R2*sin(th2) - R3*sin(th3r) - R4*sin(th4r))];

J = @(th2,th3r,th4r) [R3*sin(th3r) R4*sin(th4r);
                    -R3*cos(th3r) -R4*cos(th4r)];
c = 0;  
for th2 = pi/60:.01:17*pi/180 % need full span of arm movement
    cycle = true;
    while cycle
        th3n = th3r;
        th4n = th4r ;
    
        test = sum(E(th2,th3n,th4n));
        if abs(test) <= .00005
            c = c + 1;
            th3(c,:) = th3n; % essentially the incination angle 
            th4(c,:) = th4n; % angle of lower control arm
            n(c,:) = pi/2 - th1; % sets up geometry for pull rod
            g(c,:) = n(c,:) + pi/2 + th2; % sets up geometry for pull rod
            l(c,:) = sqrt(R1^2 + R2^2 - 2*R1*R2*cos(g(c,:)));                                       % Irrelavent, used for measurment --> distance that pull rod would need to be, but just used to measure its change in length to relate to changed position...
            delt_l(c,:) = l(c,:) - l(1,1); %movement of pull rod
            tire_lift(c,:) = R4*sin(th4(c,:)) - R4*sin(th4(1,1)); % movement of tire relative to pull rod
            break
        else
            ch = J(th2,th3n,th4n)\E(th2,th3n,th4n);
            th3r= th3n + ch(1);
            th4r  = th4n + ch(2);
        end
    end
end


E = @(th6,th7r,th8r ) [-(R5*cos(th5) + R6*cos(th6) - R7*cos(th7r) - R8*cos(th8r ));...
                    -(R5*sin(th5) + R6*sin(th6) - R7*sin(th7r) - R8*sin(th8r ))];

J = @(th6,th7r,th8r ) [R7*sin(th7r) R8*sin(th8r );
                    -R7*cos(th7r) -R8*cos(th8r )];
c = 0;  
for th6 = pi/8:.01:1.3446 % need full span of arm movement
    cycle = true;
    while cycle
        th7n = th7r;
        th8n = th8r ;
    
        test = sum(E(th6,th7n,th8n));
        if abs(test) <= .00005
            c = c + 1;
            th7(c,:) = th7n; % incination angle 
            th8(c,:) = th8n; % angle of lower control arm
            nb(c,:) = pi/2 - th5; % sets up geometry for pull rod
            gb(c,:) = nb(c,:) + pi/2 + th6; % sets up geometry for pull rod
            lb(c,:) = sqrt(R5^2 + R6^2 - 2*R5*R6*cos(gb(c,:)));                                     % Irrelavent, used for measurment --> distance that pull rod would need to be, but just used to measure its change in length to relate to changed position...
            delt_lb(c,:) = lb(c,:) - lb(1,1); %movement of pull rod
            tire_liftb(c,:) = R8*sin(th8(c,:)) - R8*sin(th8(1,1)); % movement of tire relative to pull rod
            break
        else
            ch = J(th6,th7n,th8n)\E(th6,th7n,th8n);
            th7r= th7n + ch(1);
            th8r  = th8n + ch(2);
        end
    end
end
% ------------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------------


cg_height = .3987; %m
wheelbase = 1.626; %m
percentage_antidive = .32; %%{PERCENTAGE}
percentage_antilift = .14; %%{PERCENTAGE}
percentage_antisquat = .2983; %%{PERCENTAGE}
total_vehicle_mass = 272.16; %kg

Kf = sf^2*ks/1375;
Kr = sr^2*ksb/1375;

a = .8636; %in distance front cg to front axil
b_base = wheelbase - a;
th_roll_axis = atan((rch_rear - rch_front)/wheelbase); % rad --> angle conecting front and rear roll center
e = a*tan(th_roll_axis); % m --> used to calculate H
H = cg_height - e; % m --> distance from roll axis to cg height
