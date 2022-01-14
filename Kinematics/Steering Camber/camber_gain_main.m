clear;clc;
% simulates the dynamic camber through a turn. 
% tire is immagined as a left front tire

% Assumtions:
%     dynamc camber is purely a function of steer and has nothing to do with
%     chassis role or from bump

% INPUT ------------------
caster = 4;%4.759; % deg
KPI = 3; % deg
static_camber = 0; %deg

r6 = 7.5; % distance from upper to lower ball joint in verticle direction
r2 = 1; % in --> distance from lower upright pivot to tire centerline

tire_thickness = 3.69; % in --> from ground to lower upright pivot

th2  = 0; %deg --> defines the angle of turn around the lower ball joint
th4 = th2; %deg --> defines the angle of turn around the upper ball joint
% ------------------------

% CALCULATED -------------
th = caster;
phi = KPI;
y = static_camber;

r7 = r6*tand(th); % in --> longitudinal displacement between upper and lower ball joints
r8 = r6*tand(phi); %in --> lateral displacement between upper and lower ball joints
r1 = sqrt(r7^2+r8^2); %in --> combined lat and long distance between upper nd lower ball joints
th1 = atan(r7/r8); % in --> angle for r1
camber_pull = (tire_thickness+r6)*tan(y); % in --> amount of laterl movement from initial static_camber gain or loss
r4 = r1*cos(th1) + r2*cos(th2) - camber_pull; % in --> diagram
% ------------------------

r3_init = get_r3(r1,r2,r4,th1,th2,th4); % in -> initial guess --> diagram
th3_init = -pi/2; % deg -> initial guess --> diagram

start = th2;
end_val = 55*(pi/180);
res = .01;
size = get_needed_size(start,end_val,res);

r3 = zeros(size,1);
th3 = zeros(size,1);
camber_change = zeros(size,1);
x = zeros(size,1);

tol = .001;
ct = 0;
true = 1;


if end_val < start
    res = -res;
end
for thi = start:res:end_val
    ct = ct+1;
    [r3_init,th3_init] = get_r3(r1,r2,r4,th1,thi,thi);
    r3(ct,1) = r3_init;
    th3(ct,1) = th3_init;
    if ct ~=0
%         j = get_joints(r1,r2,r3_init,r4,th1,thi,th3_init,thi);
%         anitmate_linkage(j(1,1),j(1,2),j(2,1),j(2,2),j(3,1),j(3,2),j(4,1),j(4,2),j(5,1),j(5,2));
    end
    x(ct,1) = r3(ct,1)*cos(th3(ct,1))*cos(thi) + r3(ct,1)*sin(th3(ct,1))*sin(thi);
    camber_change(ct,1) = atan2(x(ct,1),r6)*(180/pi);
end

for i = 1:length(th3)
    if th3(i,1) ~= abs(th3(i,1))
        th3(i,1) = 2*pi + th3(i,1);
    end
end

th_turn = start:res:end_val;
figure(2)
plot(th_turn.*(180/pi),camber_change,'o')
title('Dynamic Camber Due to Turning')
xlabel('Tire Turn [deg]');
ylabel('Dynamic Camber [deg]');


