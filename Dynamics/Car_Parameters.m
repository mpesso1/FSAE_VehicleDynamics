mt = 12.59; %kg mass of tire --- inertia effects
mc = 43; %kg coner weight on tire --- force
kt = 81.64; %N/m spring in tire
ks = 43781.7; %N/m spring in actual spring
b = 2000; %Ns/m damping friction


l3 = .1016; %m length to pull rod 
l4 = .0508; %m length to spring and damper
g = 9.81; %m/s^2 gravityGPS_Altitudem



% force generated on spring
% force_front = ks*(PotFrontRightmm-90)*10^-3; % Actual forces experianced by springs
% force_back = ksb*(PotFrontRightmm-90)*10^-3;
% t = linspace(0,60,460)'; %for car test data -- Simulink
% forcef = [t,force_front]; %for car test data -- Simulink
% forceb = [t,force_back];


% PLOTS FROM DRIVE DATA

% figure(1)
% plot(Times,PotBackRightmm,'ro')
% title('Displacment of  Back Spring')
% ylabel('Displacement [mm]')
% xlabel('Time [s]')
% figure(3)
% plot(Times,PotFrontRightmm,'ro')
% title('Displacment of Front Spring')
% ylabel('Displacement [mm]')
% xlabel('Time [s]')
% figure(2)
% hold on
% plot(Times,Lateral_accg,'bo')
% plot(Times,Longitudinal_ag,'ko')
% title('Acceleration')
% legend('Lateral','Longitudinal')
% ylabel('Acceleration [g]')
% xlabel('Time [s]')
% hold off






