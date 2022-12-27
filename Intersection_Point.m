function [Int_Point]= Intersection_Point(Point1,Point2)

% Intersection_Point.m
% function of intersection point of line passing two 
% points with the z=0 plane
% 
% INPUT: two points which construct a line
% 
% OUTPUT: the intersection point of the line with the Z=0 plane

x1 = Point1(1);
y1 = Point1(2);
z1 = Point1(3);

x2 = Point2(1);
y2 = Point2(2);
z2 = Point2(3);

Int_Point(3) = 0;
Int_Point(2) = y2-z1*(y2-y1)/(z2-z1);
Int_Point(1) = x1-z1*(x2-x1)/(z2-z1);

% End