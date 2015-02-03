function [O]=genO(Q,tau,mu,sig,T)
Z=size(mu,1);
O=zeros(Z,1,1,T);
ksi=unifrnd(0,1,1,1000*T);
for t=1:1:T
i=gendiscr(tau(Q(1,t),:),ksi(1,1000*t));%number of mixture component
mt=mu(:,:,Q(1,t),i)';
st=sig(:,:,Q(1,t),i)';
O(:,:,1,t)=mvnrnd(mt,st)';
end;