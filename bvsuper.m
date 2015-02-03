function [PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1]=bvsuper(K,Ok1,TAU11,MU11,SIG11,A11,PI11,NumInit,T)
p=-10^10;
for n=1:1:NumInit
    [PI_E10,A_E10,TAU_E10,MU_E10,SIG_E10]=baum_velsh(K,Ok1,TAU11,MU11(:,:,:,:,n),SIG11(:,:,:,:,n),A11,PI11);
    p1=0;
    for k=1:1:K
        p1=p1+getP(Ok1,PI_E10,A_E10,TAU_E10,MU_E10,SIG_E10,T);
    end;
    if p1>p
        PI_E1=PI_E10;
        A_E1=A_E10;
        TAU_E1=TAU_E10;
        MU_E1=MU_E10;
        SIG_E1=SIG_E10;
    end;
end;