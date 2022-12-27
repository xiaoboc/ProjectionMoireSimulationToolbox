function [Check_Shaded] = Shaded_Area(X, Four_Points)

Chech_Shaded =  ones(size(X));

Four_Points(:,1) = Four_Points(:,1)+(size(X,2)+1)/2;
Four_Points(:,2) = Four_Points(:,2)+(size(X,1)+1)/2;

nx=fix(Four_Points(:,1));
ny=fix(Four_Points(:,2));

if (nx(1) ~= Four_Points(1,1))
    nx(1)= nx(1)+1;
end

if (ny(1) ~= Four_Points(1,2))
    ny(1)= ny(1)+1;
end

if (nx(2) ~= Four_Points(2,1))
    nx(2)= nx(2)+1;
end

if (ny(2) ~= Four_Points(2,2))
    ny(2)= ny(2);
end

if (nx(3) ~= Four_Points(3,1))
    nx(3)= nx(3);
end

if (ny(3) ~= Four_Points(3,2))
    ny(3)= ny(3);
end

if (nx(4) ~= Four_Points(4,1))
    nx(4)= nx(4);
end

if (ny(4) ~= Four_Points(4,2))
    ny(4)= ny(4)+1;
end

for jj = ny(1):ny(2)
    hdthrd1 = fix((jj-ny(1))*(nx(1)-nx(2))/(ny(1)-ny(2))+nx(1))+1;
    hdthrd2 = fix((jj-ny(4))*(nx(4)-nx(3))/(ny(4)-ny(3))+nx(4));
     
    for ii = hdthrd1:hdthrd2
        Chech_Shaded(ii,jj)=NaN;
    end
end





