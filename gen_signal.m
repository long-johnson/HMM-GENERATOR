function [Ok,Q]=gen_signal(PI,A,TAU,MU,SIG,T,K,Z,N)
ro=10;
Q=zeros(1,T,K);
EA=zeros(N,N);
while ro>0.05
    EA=zeros(N,N);
    for k=1:1:K
        [Q(:,:,k)]=genQ(PI,A,T);
        EA=fitA(Q(:,:,k),N,T)+EA;
    end;
    EA=EA/K;
    ro=r_matr(A,EA);
end;

Ok=zeros(Z,1,1,T);
for k=1:1:K
   Ok(:,:,:,:,k)=genO(Q(:,:,k),TAU,MU,SIG,T);
end;