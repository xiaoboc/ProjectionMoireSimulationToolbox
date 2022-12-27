function [nv,np] = Profile(X,h,L,Mv,Mp,Pv,Pp,d)

tan_viewing = X./(L-h);

tan_projection = (d-X)./(L-h);

nv = (X+h.*tan_viewing)/Mv/Pv;
np = (X-h.*tan_projection)/Mp/Pp-d/Mp/Pp;