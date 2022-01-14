clear;clc;

% 4 bar
d = 3.623; % in --> distance fro ground to lower ball joint
percent_front_brake_bias = .53; % 
l = 64; % in --> wheelbase
h = 15.7; % in --> cg height

r1 = 0;
th1 = pi/2;

r3_init = 0;
th3 = pi/2-.1;

r4 = 6;
th4 = pi/2 + 4*pi/180;

r2 = r4; %dependent on lateral view
th2_init = pi/4;

% ---- 
start = r1;
end_val = 3;
res = .1;
size = get_needed_size(start,end_val,res);

r3 = zeros(size,1);
th2 = zeros(size,1);
phi = zeros(size,1);
percentage_anti_dive_FRONT = zeros(size,1);
svsa_length = zeros(size,1);
svsa_height = zeros(size,1);
percentage_anti_squat_REAR = zeros(size,1);
percetage_anti_lift_REAR = zeros(size,1);

tol = .00001;
ct = 0;
true = 1;

for ri = start:res:end_val
    while true
        if abs(sum(E1(ri,r2,r3_init,r4,th1,th2_init,th3,th4))) <= tol
            ct = ct+1;
            r3(ct,1) = r3_init;
            th2(ct,1) = th2_init;
            
            C = pi - th2(ct,1) - abs(pi/2-th3);
            B = th2(ct,1) - abs(th1 - pi/2);
            A = pi - (B + C);
            
            c_len = r2*sin(C)/sin(A);
            e = d + c_len*sin(th1-pi/2);
            f = c_len*cos(th1-pi/2);
            svsa_length(ct,1) = f;
            svsa_height(ct,1) = e;
            phi(ct,1) = atan(e/f)*(180/pi);
            percentage_anti_dive_FRONT(ct,1) = tand(phi(ct,1))*(l/h)*percent_front_brake_bias;
            percentage_anti_squat_REAR(ct,1) = tand(phi(ct,1))*(l/h);
            percetage_anti_lift_REAR(ct,1) = tand(phi(ct,1))*(l/h)*(1-percent_front_brake_bias);
            j = get_joints(ri,r2,r3_init,r4,th1,th2_init,th3,th4);
            anitmate_linkage(j(1,1),j(1,2),j(2,1),j(2,2),j(3,1),j(3,2),j(4,1),j(4,2),j(5,1),j(5,2));
            
            break
        else
            change = J1(r2,th2_init,th3)\E1(ri,r2,r3_init,r4,th1,th2_init,th3,th4);
            th2_init = th2_init - change(1);
            r3_init = r3_init - change(2);
        end

    end
end


get_results(th2(end,1),end_val,th4);

r = start:res:end_val;
figure(2)
plot(r,(th2-th2(1,1))*(180/pi));
title('Dynamic Caster per Tire Displacement');
xlabel('Tire Lift [in]');
ylabel('Caster Change [deg]');
