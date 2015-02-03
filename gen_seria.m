function [Ok]=gen_seria(K,Q,TAU,MU,SIG,T)
Z=size(MU,1);
Ok=zeros(Z,1,1,T,K);
for k=1:1:K 
Ok(:,:,:,:,k)=genO(Q,TAU,MU,SIG,T);
end;

