%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Projection Moire Simulation Toolkit based on MIT Model 
%% By Xiaobo Chen at Nov 23, 2004
%% xiaoboc@sjtu.edu.cn
%% Copyright All Reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This program is to determine the size of the projection area and viewing
%% area. Give the grating size, focal length, distance of the two optical axes
%% and distance between the grating and object
%% Only for the case the optical lines of viewing lens and projection 
%% lens are parallel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
end


% Computing... 
figure()
hold on

% plot3(0,0,0);
% plot3(-d,0,0);

patch([Lgv/2,Lgv/2,-Lgv/2,-Lgv/2],[Wgv/2,-Wgv/2,-Wgv/2,Wgv/2],[-Fv,-Fv,-Fv,-Fv],'g')
patch([Lgp/2,Lgp/2,-Lgp/2,-Lgp/2]-d,[Wgp/2,-Wgp/2,-Wgp/2,Wgp/2],[-Fv,-Fv,-Fv,-Fv],'r')

%% modified :)
%%L = L+Fv;

Mv = -(L)/Fv;
Mp = -(L)/Fp;

patch([Lgv/2,Lgv/2,-Lgv/2,-Lgv/2]*Mv,[Wgv/2,-Wgv/2,-Wgv/2,Wgv/2]*Mv,[L-Fv-0.01,L-Fv-0.01,L-Fv-0.01,L-Fv-0.01],'g')
patch([Lgp/2,Lgp/2,-Lgp/2,-Lgp/2]*Mp-d,[Wgp/2,-Wgp/2,-Wgp/2,Wgp/2]*Mp,[L-Fv,L-Fv,L-Fv,L-Fv],'r')

line([Lgv/2,Lgv/2*Mv],[Wgv/2,Wgv/2*Mv],[-Fv,L-Fv])
line([Lgv/2,Lgv/2*Mv],[-Wgv/2,-Wgv/2*Mv],[-Fv,L-Fv])
line([-Lgv/2,-Lgv/2*Mv],[-Wgv/2,-Wgv/2*Mv],[-Fv,L-Fv])
line([-Lgv/2,-Lgv/2*Mv],[Wgv/2,Wgv/2*Mv],[-Fv,L-Fv])

line([Lgp/2,Lgp/2*Mp]-d,[Wgp/2,Wgp/2*Mp],[-Fv,L-Fv])
line([Lgp/2,Lgp/2*Mp]-d,[-Wgp/2,-Wgp/2*Mp],[-Fv,L-Fv])
line([-Lgp/2,-Lgp/2*Mp]-d,[-Wgp/2,-Wgp/2*Mp],[-Fv,L-Fv])
line([-Lgp/2,-Lgp/2*Mp]-d,[Wgp/2,Wgp/2*Mp],[-Fv,L-Fv])

%view(0,-60);
axis equal
grid on
xlabel 'x'
ylabel 'y'
zlabel 'z'
title 'View Simulation'

% To check the size of the view
view(0,-90)