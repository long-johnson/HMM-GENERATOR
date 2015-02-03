function [pogr]=pogresh(PI,PI_E,A,A_E,TAU,TAU_E,MU,MU_E,SIG,SIG_E)
N=size(PI,1);
M=size(MU,4);
pogr=r_matr(PI,PI_E)+r_matr(A,A_E);
for i=1:1:N
    for m=1:1:M
        pogr=pogr+r_matr(MU(:,:,i,m),MU_E(:,:,i,m))+r_matr(SIG(:,:,i,m),SIG_E(:,:,i,m))+abs(TAU(i,m)-TAU_E(i,m));
    end;
end;
