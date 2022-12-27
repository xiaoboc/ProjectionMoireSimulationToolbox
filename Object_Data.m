if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
end

index=2;

% [X,Y]= meshgrid(-50:0.1:50, -50:0.1:50);

[X,Y]= meshgrid(-300*FOV_Resolution:4*FOV_Resolution:300*FOV_Resolution, ...
                -300*FOV_Resolution:4*FOV_Resolution:300*FOV_Resolution);



X_index = size(X,1);
Y_index = size(Y,2);

% The Object
h = (sqrt(10*50^2-(X).^2-(Y).^2))/2+0.05-76; 

% h = zeros (X_index, Y_index);
% 
% for i= 250:1:750
%     for j= 250:1:750
%         h(i,j)=10;
%     end 
% end
