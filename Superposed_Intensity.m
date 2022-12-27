
if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

figure()
imagesc(I); colormap(gray)
title('Superposed Intensity');
axis image