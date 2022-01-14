# FSAE_VehicleDynamics
Dynamics and Kinimatics of FSAE vehicle simulated base of Tire Data

Each folder contains code that simulates either the kinematics or the dynamics of the vehicle.  The kinematic scripts should be used early in the design process to determine 
how each parameter you set influences the dynamic behavior of the car e.g. camber gain.  It should be noted that each of the simulations assume that its individual components
are acting alone and not influencing the rest of the vehicle.  As you should know this is not true.  For example the sterring simulation demonstrates how kpi and caster affect 
the camber when sterring; however it does not account that kpi and caster will lift the tire when turing and change the double wishbone geometry relative to the vehicle and 
additionally change the camber of the tire, or also the fact that when you are turning your vehicle is also probably rolling out of the turn which is also effecting camber.
A finished product of all of these simulations would link them together.  However, this was not accomplished.  Using this code requires a respectable understanding of vehicle
dynamics, as making good use of it would require jumping from one script to the next with you assumptions and iterating over it until you are happy with the results.  

The dymaics model has been tested with data collected from the ecu and potentiometers that were mounted on the 2020 vehicle.  Results provides little to no error.  It wouldn't 
be a bad idea to retest the model before using it again.  It simulates how the suspension will counteract loads applied to an individual front and rear tire.  It accounts for
longitudinal, lateral, and arodynamic loading.  All loads can be adjusted with the graphical interface.  It would be wise to use this in series with the kinimatic codos to 
see how loads additionally effect the geometry of the suspension.

It should also be noted that in 2021 when I wrote these codes, no one else on the team looked over them to check for errors.  If you do happen to find any errors or something
does not seem correct feel free to reach me.

ps BE CARFUL OF UNITS

337-321-0557
Mason Pesson
