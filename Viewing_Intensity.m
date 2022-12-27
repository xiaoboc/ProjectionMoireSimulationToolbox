
if ~exist('d')
    fprintf(1,'No System Setup Data Available.\n');
    return;
else if ~exist('h')
    fprintf(1,'No Object Data Available.\n');
    return;
    end 
end

Mv = L/Fv;
Mp = L/Fp;

Pv = P;
Pp = P;

tan_viewing = X./(L-h);

tan_projection = (d-X)./(L-h);

nv = (X+h.*tan_viewing)/Mv/Pv;
np = (X-h.*tan_projection)/Mp/Pp-d/Mp/Pp;

Iv = 1+cos(2*pi*nv);
Ip = 1+cos(2*pi*np);

I = Iv.*Ip;

figure()
imagesc(Iv); colormap(gray)
axis image
title('Viewing Intensity');