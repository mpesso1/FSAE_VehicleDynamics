R5 = 5; %in -- chassis welds
R6 = 9.5; %in -- UCA
R7 = 6.5; %in -- knuckle welds
R8 = 13.5; %in -- LCA

th5 = pi/2; %rad


% Guesses --- irelavent
th7r= pi*2/3; 
th8r  = 0;


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
            th7(c,:) = th7n; % essentially the incination angle 
            th8(c,:) = th8n; % angle of lower control arm
            nb(c,:) = pi - th8(c,:) - th7(c,:); % sets up geometry for pull rod
            gb(c,:) = 2*pi - nb(c,:) - th5 - abs(th8n) - th7n + th6; % sets up geometry for pull rod
            lb(c,:) = sqrt(R5^2 + R6^2 - 2*R5*R6*cos(gb(c,:))); % Irrelavent, used for measurment --> distance that pull rod would need to be, but just used to measure its change in length to relate to changed position...
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






