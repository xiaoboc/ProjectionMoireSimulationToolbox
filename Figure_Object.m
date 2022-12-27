if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end    
end


%figure the object
figure()
surfc(X,Y,h)
shading interp
title('Object')