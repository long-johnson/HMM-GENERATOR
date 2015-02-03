function [B]=calcB(O,TAU,MU,SIG)
M=size(TAU,2);
N=size(TAU,1);
T=size(O,4);
B=zeros(N,T);

for i=1:1:N 
    for t=1:1:T
      for k=1:1:M
         B(i,t)=B(i,t)+TAU(i,k)*g(O(:,:,1,t),MU(:,:,i,k),SIG(:,:,i,k)); 
      end;
    end;
end;