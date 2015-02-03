function [Res]=gendiscr(tt,ksi)

i=1;
while ksi>0
ksi=ksi-tt(i);
i=i+1;   
end;
Res=i-1;