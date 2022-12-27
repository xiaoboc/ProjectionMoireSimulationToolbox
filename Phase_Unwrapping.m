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


%%%%%%%%%%%%% begin of Phase Unwrapping %%%%%%%%%
phase_wrapped = phase;

%% One dimension unwrapping
for i=2:Y_index
    flag_Neg = phase_wrapped(:,i)-phase_wrapped(:,i-1)>pi/2;
    flag_Pos = phase_wrapped(:,i-1)-phase_wrapped(:,i)>pi/2;    
    
    flag = sum(flag_Neg)+ sum(flag_Pos);
    
    if flag ~= 0

        temp_matrix = ones(1,Y_index);
        for j=1:i-1
            temp_matrix(j) = 0;
        end

        modified_phase = -flag_Neg*temp_matrix+flag_Pos*temp_matrix;

        phase_wrapped = phase_wrapped + modified_phase*pi;
    end
end

%% the other dimension unwrapping

for i=2:X_index
    flag_Neg = phase_wrapped(i,:)-phase_wrapped(i-1,:)>pi/2;
    flag_Pos = phase_wrapped(i-1,:)-phase_wrapped(i,:)>pi/2;    
    
    flag = sum(flag_Neg)+ sum(flag_Pos);
    
    if flag ~= 0

        temp_matrix = ones(X_index,1);
        for j=1:i-1
            temp_matrix(j) = 0;
        end

        modified_phase = -temp_matrix*flag_Neg+temp_matrix*flag_Pos;

        phase_wrapped = phase_wrapped + modified_phase*pi;
    end
end

phase_unwrapped = phase_wrapped;

%%%%%%%%%%%%% End of Phase Unwrapping %%%%%%%%%

h_computed = phase_unwrapped*lemda1/2/pi;

figure()
imagesc(phase_unwrapped); colormap(gray)
title('Unwrapped Phase Map')
axis image

