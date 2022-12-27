if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

if ~exist('phase_unwrapped')
    Phase_Unwrapping
end

figure()
surfc(X,Y,h_computed)
shading interp
title('Unwrapped Object Shape')