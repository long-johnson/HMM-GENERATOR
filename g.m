function [Res]=g(x,mu,sig)
%z=size(mu,1);
Res=mvnpdf(x',mu',sig');%exp(-((x-mu)')*inv(sig)*(x-mu)*0.5)/((2*pi)^(0.5*z)*sqrt(det(sig)));