if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

if ~exist('I_moire')
    Moire_Predict
end

figure()
imagesc(phase); colormap(gray)
title('Wrapped Phase Map')
axis image