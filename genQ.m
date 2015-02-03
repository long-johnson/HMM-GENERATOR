function [Q]=genQ(PI,A,T)
ksi=unifrnd(0,1,1,T);

Q=zeros(1,T);
Q(1,1)=gendiscr(PI,ksi(1,1));
for i=2:1:T
    Q(1,i)=gendiscr(A(Q(1,i-1),:),ksi(1,i));
end;
