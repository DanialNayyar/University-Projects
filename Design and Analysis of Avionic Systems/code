clc
clear variables % Clears the command window and all variables every time the code is ran. 

R = 0.110; % Dimensions of the mechanism (as seen in figure 1)
r = 0.080;
L = 0.150;
X = 0.030;
Y = 0.150;

theta_deg = -11:1:11; % Matrix of the angles the stick can move in degrees
theta_rads = theta_deg * pi/180; % Convert to radians

sau_rads = zeros(size(theta_rads)); % Pre-allocate sau_rads, stops Matlab from wasting memory, as the matrix of the correct size is already made
sau_deg = zeros(size(theta_rads)); % Pre-allocate sau_deg, stops Matlab from wasting memory, as the matrix of the correct size is already made

% Calculate sau_deg values for theta_deg values
for i = 1:length(theta_rads)
    phi = 0.01; %Inital guess to begin the loop
    y = 0; % Inital guess to begin the loop
    while abs(phi-y) > eps(phi) % The while loop iterates as long as the condition is true
        y = phi;
        phi = asin((-sqrt(L^2-(R*cos(theta_rads(i))-r*cos(phi)-X)^2)+Y+R*sin(theta_rads(i)))/r); %the equation to calculate the SAU angle
    end
    sau_rads(i) = phi;
    sau_deg(i) = sau_rads(i)*180/pi;
end

ma_psau = zeros(1, length(theta_deg) - 1); % Pre-allocate MA_PSAU array, stops Matlab from wasting memory and computes the result faster. (Stops its from getting stuck in a loop)

%The for loop below iterates through the length of the theta_deg matrix starting at the second value. This is to allow it to minus from the first value and then assign it to individual matrices numerator (num) and denominator (den)
for i = 2:length(theta_deg)
    num = theta_deg(i-1) - theta_deg(i);
    den = sau_deg(i-1) - sau_deg(i);
    ma_psau(i-1) = num/den;
end


disp(MA_PSAU) %Output the values of MA_PSAU for all theta_deg values into command/console window, used as a method to check if the code ran sucessfully
disp(theta_deg)

%plots the graph for the mechanical advantage  against input angle 
plot(theta_deg(2:end), ma_psau)
xlabel('Theta (degrees)')
ylabel('MA_PSAU ')




%Given that the mechanical advantages are reciprocals of each other, this part of the code will do the reciprocal for each value of the mechanical advantage Pivot to SAU and stores it in the matrix MA_SAUP
MA_SAUP = zeros(1, length(ma_psau));
for i = 1:length(ma_psau)
    MA_SAUP(i) = 1/i;
end

disp(MA_SAUP)

%plots the graph for the mechanical advantage  against input angle 
plot(theta_deg(2:end),MA_SAUP)
xlabel('Theta (degrees)')
ylabel('MA_SAUP ')
title('Mechanical Advantage (SAU to Pivot) vs Input Degrees')


Isau = 4; %Initialises the value of the inertia of the sau
%Code block below loops through the length of the matrix ma_psau and multiplies each of the values to set value of the inertia of the sau.
for i=1:length(ma_psau)
    Isaup(i) = Isau * ma_psau(i);
end

disp(Isaup)



Imech = 0.0001  %Initialises the value of the inertia of the mechanism

Igrip = 0.07; %Initialises the value of the inertia of the grip


%Code block below loops through the length of the matrix Isaup and adds the inertias to together for each of the input angles, which were calculated above
for i=1:length(Isaup)
    Ipivot(i) = Isaup(i) + Imech + Igrip;
end

disp(Ipivot)

r = 0.42;  %Initialises the value of the distance from the gip to the pivot point


%Code block below loops through the inertia values of the pivot point and divides each value by the distance ‘r’ and stores it in the apparent mass, Mapp matrix
for i=1:length(Ipivot)
    Mapp(i) = Ipivot(i)/r^2;
end

disp(Mapp)

plot(theta_deg(2:end),Mapp) %Plots the graph of input angle against the apparent mass
