clear;clc;

% -- Car
track = 46; %in --> vehicle track
d = 3.263; %in --> lower aarm mounting on upright to bottom of tire
% ------

% 4bar 

r1 = 10.896; %in --> lower aarm
th1 = 1.28*(pi/180); % radians

r2 = 7.5; %in --> upright verticle distance
th2_init = pi/2; % radians

kpi = 3*(pi/180);
r3 = r2*tan(kpi); %in --> defines inclination
th3_init = th2_init - pi/2; % radians

r5 = 6.1; %in --> frame mounting distance
th5 = 90*(pi/180); % radians

th4_init = 0; % radians
r4 = geometric_r4(r1,th1,r2,th2_init,r5,th5,r3,th3_init); %in --> upper a arm

r6 = r2*cos(atan2(r3,r2)); %in --> IA vector

r7_init = 6; %in --> vector from r1 to tires IC

r8_init = 8; %in --> vector from r4 to tires IC

rc_x = get_rc_X(track,r1,th1); % distance from from lower aarm mount to half of track

start = th1; %deg --> start angle of lower control arm
end_deg = pi/4; %deg --> ending angle of lower control arm
step_size = .01; %deg --> resolution
size = get_needed_size(start,end_deg,step_size);


th2 = zeros(size,1);
th3 = zeros(size,1);
th4 = zeros(size,1);
c = zeros(size,1);
g = zeros(size,1);

only_one = 0;

true = 1;
true2 = 1;
tol = 0.00001; % --> tolerance
ct = 0;
if end_deg < start
    step_size = -step_size;
end
for thi = start:step_size:end_deg
    while true
        if abs(sum(E1(r1,r2,r3,r4,r5,thi,th2_init,th3_init,th4_init,th5))) <= tol
            ct = ct+1;
            th2(ct,1) = th2_init;
            th3(ct,1) = th3_init;
            th4(ct,1) = th4_init;
            while true2
                if abs(sum(E2(r1,r2,r3,r7_init,r8_init,r4,r6,thi,th4(ct,1),th2(ct,1)))) <= tol
%                     c(ct,1) = r1+r7_init;
%                     
%                     j = d + c(ct,1)*sin(thi);
%                     i = c(ct,1)*cos(thi);
%                     f = track/2 - 4;
%                     g(ct,1) = j*f/i;
                    
                    if ct == 1
                        add_jj = d/tan(thi);
                        add_3 = r3*tan(th4_init);
                        a = r2+add_3;
                        C = pi/2 - abs(th4_init);
                        B = pi/2 + thi;
                        A = pi - (C + B);
                        f = track/2;
                        c = a*sin(abs(C))/sin(abs(A));
                        if thi > 0
                            i = -c*sin(th1) + d;
                        else
                            i = c*sin(-thi) + d;
                        end
                        jj = c*cos(thi);
                        g(ct,1) = f*i/jj;
                        
                        if A+B+C ~= pi
                            disp('error')
                        end



                        
                    end
                    j = get_joints(r1,r2,r3,r4,r5,thi,th2_init,th3_init,th4_init,th5);
                    anitmate_linkage(j(1,1),j(1,2),j(2,1),j(2,2),j(3,1),j(3,2),j(4,1),j(4,2),j(5,1),j(5,2),j(6,1),j(6,2),rc_x,g(1,1),d,r1,th1);
                    break
                elseif -th4>=-thi
                    disp('error: ')
                    disp(['th4: ',num2str(th4_init)]);
                    disp(['th1: ',num2str(thi)]);
                    break
                else
                    change_2 = J2(thi,th4_init)\E2(r1,r2,r3,r7_init,r8_init,r4,r6,thi,th4_init,th2_init);
                    r7_init = r7_init - change_2(1);
                    r8_init = r8_init - change_2(2);
                end
                  
            end
            
            break
        else 
            change = J1(r4,th4_init,r2,th2_init,r3,th3_init)\E1(r1,r2,r3,r4,r5,thi,th2_init,th3_init,th4_init,th5);
            th4_init = th4_init - change(1);
            th2_init = th2_init - change(2);
            th3_init = th2_init - pi/2;
        end
    end
end

get_results(r2,r3,g(1,1));
    


% ------ Roll Parameters
roll = -pi/12; % deg --> amount of roll -> negative means outside tire, positive means inside tire
th2_roll_init = pi/2;

r8 = d;
th8_roll_init = th2_roll_init;

th3_roll_init = th2_roll_init - pi/2;

th4_roll_init = th4(1,1);

[r7,th7_roll_init] = get_r7(track,g(1,1),r2,r8,r3,r4,th3(1,1),th4(1,1));

[r6,th6] = get_r6(g(1,1),track);

start_roll = th7_roll_init; %deg --> start angle of lower control arm
end_deg_roll = start_roll+roll; %deg --> ending angle of lower control arm
step_size = .01; %deg --> resolution
size = get_needed_size(start_roll,end_deg_roll,step_size);

th2_roll = zeros(size,1);
camber_roll_gain = zeros(size,1);

tol = .0001;
true = 1;
cr = 0;
if end_deg_roll < start_roll
    step_size = -step_size;
end
for thi = start_roll:step_size:end_deg_roll
    while true
        if abs(sum(E_roll(r2,r3,r4,r6,r7,r8,th2_roll_init,th3_roll_init,th4_roll_init,th6,thi,th8_roll_init))) <= tol
            cr = cr+1;
            th2_roll(cr,1) = th2_roll_init;
            camber_roll_gain(cr,1) = (th2_roll_init - th2_roll(1,1))*(180/pi);

            if cr == 1
%                     j_roll = get_roll_joints(r2,r3,r4,r6,r7,r8,th2_roll_init,th3_roll_init,th4_roll_init,th6,thi,th8_roll_init);
%                     anitmate_linkage_roll(j_roll(1,1),j_roll(1,2),j_roll(2,1),j_roll(2,2),j_roll(3,1),j_roll(3,2),j_roll(4,1),j_roll(4,2),j_roll(5,1),j_roll(5,2),j_roll(6,1),j_roll(6,2),j_roll(7,1),j_roll(7,2));
%                     
            end
            break
        else 
            change = J_roll(r2,r3,r4,r8,th2_roll_init,th3_roll_init,th4_roll_init,th8_roll_init)\E_roll(r2,r3,r4,r6,r7,r8,th2_roll_init,th3_roll_init,th4_roll_init,th6,thi,th8_roll_init);
            th4_roll_init = th4_roll_init - change(1);
            th2_roll_init = th2_roll_init - change(2);
            th3_roll_init = th2_roll_init - pi/2;
            th8_roll_init = th2_roll_init;
        end
    end
end
    

th7 = start_roll:step_size:end_deg_roll;

% figure(1)
% plot(th7.*(180/pi)-th7(1,1)*180/pi,camber_roll_gain);
% title('Camber Effects from Chassis Roll');
% xlabel('Roll [deg]');
% ylabel('Camber Gain [deg]')

th1 = start:abs(step_size):end_deg;

figure(2)
plot(th1.*(180/pi),(th2-th2(1,1)).*(180/pi));
title('Camber Gain per Tire Lift');
xlabel('Lower Control Arm Angle [deg]');
ylabel('Camber Gain [deg]');








