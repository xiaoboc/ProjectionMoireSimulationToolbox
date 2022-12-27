
if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

%% fringe predict

M=L/Fv;

figure()
for i=1:4
    subplot(2,2,i)

    I_moire = 1+0.5*cos(2*pi*h*d./(L-h)./M/P + 2*pi*phi_v(i)+2*pi*d/M/P);
    %% the moire pattern has been veryfied.
    
    I_phase(:,:, i) =  I_moire;

    imagesc(I_moire); colormap(gray)
    axis image
   
    xlabel(-(i-1)/4)
    ylabel('Grating One')
end


tan_phase = (I_phase(:,:, 2)-I_phase(:,:,4))./(I_phase(:,:, 1)-I_phase(:,:,3));

% the relative phase of the object
phase = atan(tan_phase);  

lemda1 = L^2*P/Fv/d;

h_wrapped = phase*lemda1/2/pi;