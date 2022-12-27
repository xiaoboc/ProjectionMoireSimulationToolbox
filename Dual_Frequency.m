if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end


figure()
for i=1:4
    subplot(2,2,i)

    I_moire_dual = 1+0.5*cos(2*pi*h*d./(L-h)./M/P_dual + 2*pi*phi_v(i)+2*pi*d/M/P_dual);
    %% the moire pattern has been veryfied.
    
    I_phase_dual(:,:, i) =  I_moire_dual;

    imagesc(I_moire_dual); colormap(gray)
    axis image
   
    xlabel(-(i-1)/4)
    ylabel('Grating Two')
end

tan_phase_dual = (I_phase_dual(:,:, 2)-I_phase_dual(:,:,4))./(I_phase_dual(:,:, 1)-I_phase_dual(:,:,3));

% the relative phase of the object
phase_dual = atan(tan_phase_dual);  

lemda2 = L^2*P_dual/Fv/d;

lemda12 = lemda1*lemda2/(lemda1-lemda2);

if lemda12<0
   lemda12 =  -lemda12;
end

phase12=phase-phase_dual;

m = (P_dual/(P_dual-P)*phase12-phase)/2/pi;

OPD=(phase+2*pi*m)*lemda1/2/pi;

Error_dual = OPD-h_computed;

figure()
surfc(X,Y,OPD)
shading interp


