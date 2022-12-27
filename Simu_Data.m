clear;

%% The parameters of the mathematical model:
% Fv = 14;
% Fp = 14;
% d = 75;
% L = 300;

Fv = 25;
Fp = 25;
d = 70;
L = 800;

alpha_p = 0;
alpha_v = 0;
P = 0.075;
P_dual = 0.080;
phi_p = 0;
phi_v = [0 -1/4 -1/2 -3/4];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters of the CCDs

% Parameters of the system
% % Fv = 25;
% % Fp = 25;
% % d = 70;
% % L = 800;

% Fv = 35;
% Fp = 35;
% d = 75;
% L = 1000;

Lgp = 11;
Wgp = 5;
 
% %% 1/4 CCD
% Lgv = 3.6;
% Wgv = 2.7;


% %% 1/3 CCD
% Lgv = 4.8;
% Wgv = 3.6;

% %% 1/2 CCD
Lgv = 6.4;
Wgv = 4.8;

SizeofPixel = 5.2e-3;
Res_L = 1280;
Res_W = 1024;

% Lgv = SizeofPixel*Res_L;
% Wgv = SizeofPixel*Res_W;


% %% 2/3 CCD
% Lgv = 8.8;
% Wgv = 6.6;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Need to Get the Resolution Unit length of the camera

Mv = L/Fv;

%% The caperture resolution of the Camera
FOV_Resolution = SizeofPixel*Mv;






