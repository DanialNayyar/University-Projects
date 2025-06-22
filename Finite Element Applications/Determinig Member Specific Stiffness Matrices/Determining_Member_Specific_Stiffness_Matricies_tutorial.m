% Determining Member-Specific Stiffness Matricies

function [Klocal, Kglobal] = Determining_Member_Specific_Stiffness_Matricies_tutorial(d,E,x1,y1,x2,y2)

%Script to dertermine the local and global stiffness matricies associated
%to a 1D truss element starting (x1,y1) and ending at (x2,y2). This
%implementation is for circullar cross-section bar.
%Tutorial given by Dr. Okereke



%Computations

% Surface Area
A = (pi*d^2)/4

% Coordinate Position
coord_pos = [x1,y1,x2,y2]

% Axial Rigidity, Ea

Ea = E*A

%Length of bar, L

L = sqrt((x2-x1)^2 + (y2-y1)^2)

%% Determining the angles of the bar, w.r.t. global refrence frame

if y2>y1 && x2==x1 %along +ve y axis
    theta = 90
elseif y2 ==y1 && x2<x1 % along -ve x axis
    theta = 180
elseif y2 == y1 && x2>x1 %along +ve x axis
    theta = 0
elseif x2==x1 && y2<y1 %% along -ve y axis 
    theta = 270
else
    theta0 = atan((y2-y1)/(x2-x1))
end

% Which case (quadrant)
if x2>x1 && y2>y1 %first 
    theta = theta0 
elseif x2<x1 && y2>1 %second
    theta = 180-theta0
elseif x2<x1 && y2<y1  %third
        theta = 180+theta0 
elseif x2>x1 && y2<y1 %fourth
    theta = theta0 +360
end

% Sine and Cosine 
c = cosd(theta)
s = sind(theta)

% Local Stiffness Matrix, Klocal
Klocal = (Ea/L) *[1,0,-1,0;
                0,0,0,0;
                -1,0,1,0;
                0,0,0,0]

%Global Stiffness Matix, Kglobal
Kglobal = (Ea/L) * [c^2, s*c, -c*2, -s*c;
                    s*c, s^2, -s*c, s^2;
                    -c^2,-s*c, c^2, s*c;
                    -s*c, -s^2, s*c, s^2]
