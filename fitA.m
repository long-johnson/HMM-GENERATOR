function [AE]=fitA(Q,N,T)
AE=zeros(N,N);
for t=1:1:T-1
    AE(Q(1,t),Q(1,t+1))=AE(Q(1,t),Q(1,t+1))+1;
end;
for i=1:1:N
    AE(i,:)=AE(i,:)/sum(AE(i,:));
end;
