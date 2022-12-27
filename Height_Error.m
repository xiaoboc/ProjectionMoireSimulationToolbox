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

height_dif = h_computed-h;
Max_Error = max(max(height_dif));
Min_Error = min(min(height_dif));

figure()
surfc(X,Y,height_dif)
shading interp
title('Height Error')

Max_Error-Min_Error