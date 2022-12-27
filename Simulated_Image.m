
if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

Length_Image =  SizeofPixel*Res_L;
Width_Image = SizeofPixel*Res_W;

%% The Field of View of Camera

Mv = L/Fv;
Mp = L/Fp;

FOV_Length = Length_Image*Mv;
FOV_Width = Width_Image*Mv;

% Has been moved to Simu_Data  Jan 10,2005
% %% The caperture resolution of the Camera
% FOV_Resolution = SizeofPixel*Mv


%% To decide the size of FOV and transfer the object to new coordinate
%% system

FOV_Step = 4*FOV_Resolution;

[X_Image,Y_Image]= meshgrid(-FOV_Length/2:FOV_Step:FOV_Length/2,...
                            -FOV_Width/2:FOV_Step:FOV_Width/2);
                        
X_index_Image = size(X_Image,1);
Y_index_Image = size(X_Image,2);

h_Image_bk = zeros(X_index_Image,Y_index_Image);

h_Image_ob = h;

%% Modified to seperate the object with the background
% h_Image((X_index_Image-X_index)/2+1:(X_index_Image-(X_index_Image-X_index)/2),...
%         (Y_index_Image-Y_index)/2+1:(Y_index_Image-(Y_index_Image-Y_index)/2))...
%         = h;

%% Judge whether all the viewing area is illuminated by light projected.

Projection_Length = Lgp*Mv;
Projection_Width = Wgp*Mv;

I_Image_View_bk = zeros(X_index_Image,Y_index_Image);

Pv = P;
Pp = P;

% tan_viewing_Image = X_Image./(L-h_Image);
% tan_projection_Image = (d-X_Image)./(L-h_Image);

[nv_Image_bk,np_Image_bk] = Profile(X_Image,h_Image_bk,L,Mv,Mp,Pv,Pp,d);
[nv_Image_ob,np_Image_ob] = Profile(X,h_Image_ob,L,Mv,Mp,Pv,Pp,d);
% nv_Image = (X_Image+h_Image.*tan_viewing_Image)/Mv/Pv;
% np_Image = (X_Image-h_Image.*tan_projection_Image)/Mp/Pp-d/Mp/Pp;

I_Image_View_bk = 1+cos(2*pi*np_Image_bk);
I_Image_View_ob = 1+cos(2*pi*np_Image_ob);


%% Right trim
if Projection_Length/2-d < FOV_Length/2
    Delta_n = round((FOV_Length/2-Projection_Length/2+d)/FOV_Step);
    
%   I_Image_View_bk(:,end-Delta_n+1:end) = zeros(X_index_Image,Delta_n);
    I_Image_View_bk(:,end-Delta_n+1:end) = NaN;
end

%% Up and Below trim
if Projection_Width/2 < FOV_Width/2 

    Delta_n = round((FOV_Width/2-Projection_Width/2)/FOV_Step);
    
%   I_Image_View_bk(1:Delta_n,:) = zeros(Delta_n,Y_index_Image);
%   I_Image_View_bk(end-Delta_n+1:end,:) = zeros(Delta_n,Y_index_Image);
    
    I_Image_View_bk(1:Delta_n,:) = NaN;
    I_Image_View_bk(end-Delta_n+1:end,:) = NaN;
end

%% Left trim

if Projection_Length/2+d < FOV_Length/2 
    Delta_n = round((FOV_Length/2-Projection_Length/2-d)/FOV_Step);
    
%   I_Image_View_bk(:,1:Delta_n) = zeros(Y_index_Image,Delta_n);   
    I_Image_View_bk(:,1:Delta_n) = NaN;
end


%% Need to code to add the shade area here...
%% 




%%
%% End of adding the shade area


%% Combine the backgroud and the object together and show the figure

h_Image_Combined = h_Image_bk;
h_Image_Combined((X_index_Image-X_index)/2+1:(X_index_Image-(X_index_Image-X_index)/2),...
                  (Y_index_Image-Y_index)/2+1:(Y_index_Image-(Y_index_Image-Y_index)/2))...
                   = h_Image_ob;

I_Image_View_Combined = I_Image_View_bk;

I_Image_View_Combined((X_index_Image-X_index)/2+1:(X_index_Image-(X_index_Image-X_index)/2),...
                     (Y_index_Image-Y_index)/2+1:(Y_index_Image-(Y_index_Image-Y_index)/2))...
                      = I_Image_View_ob;

                  
%% Top View Pattern                  
figure()
imagesc(I_Image_View_Combined); colormap(gray)
axis image            
                      
           

% 3D fringe visualization
figure()
mesh(X_Image,Y_Image,h_Image_Combined,I_Image_View_Combined)
colormap(gray)
axis equal
view(-30,30)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Projection to the image plane  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% THe shade of the Object need to be removed from The backgroud Intensity
%% The Zero point needs to be right upon the object
%% if only need to view projection area, it's NOT necessary

Oc = [0 0 L];

x1=X(1,1);
x2=X(end);

y1=Y(1,1);
y2=Y(end);


Int_Point_LeftTop= Intersection_Point([x1 y1 h(1,1)],Oc);
Int_Point_RightDown=Intersection_Point([x2 y2 h(end)],Oc);


n_left = fix((Int_Point_LeftTop(1)+FOV_Length/2)/FOV_Step);
n_up = fix((Int_Point_LeftTop(2)+FOV_Width/2)/FOV_Step);
n_right = fix((FOV_Length/2-Int_Point_RightDown(1))/FOV_Step);
n_down = fix((FOV_Width/2-Int_Point_RightDown(2))/FOV_Step);






figure()
imagesc(I_Image_View_Combined); colormap(gray)
axis image

% % 3D fringe visualization
% figure()
% mesh(X_Image,Y_Image,h_Image,I_Image_View)
% colormap(gray)
% axis equal

%% three problems
% 1, how to detect the discontinuous area
% 2, how to detect front-back problem
% 3, ho wto detect the shade area



%% Project the object pattern to the viewing plane!













