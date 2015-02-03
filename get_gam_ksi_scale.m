function [gam_s,ksi_s,gamd_s]=get_gam_ksi_scale(alf_s,bet_s,P_s,A,B,TAU,MU,SIG,O)
T=size(alf_s,1);
N=size(alf_s,2);
M=size(TAU,2);
gam_s=zeros(T,N);
ksi_s=zeros(T-1,N,N);
gamd_s=zeros(T,N,M);
for t=1:1:T
  for i=1:1:N
    gam_s(t,i)=alf_s(t,i)*bet_s(t,i)/P_s; %gam_s(t,i)+
    
    pr=0;
    for k=1:1:M
        pr=pr+TAU(i,k)*mvnpdf(O(:,:,1,t)',MU(:,:,i,k)',SIG(:,:,i,k)');        
    end;
    for k=1:1:M
        gamd_s(t,i,k)=TAU(i,k)*mvnpdf(O(:,:,1,t)',MU(:,:,i,k)',SIG(:,:,i,k)')*gam_s(t,i)/pr;           
    end;
  end;  
end;
% 
% for t=1:1:T
%     for i=1:1:N
%       for k=1:1:M
%           gamd_s(t,i,k)=gamd_s(t,i,k)*gam_s(t,i);
%       end;
%     end;
% end;


for t=1:1:T-1
    for i=1:1:N
        for j=1:1:N
            ksi_s(t,i,j)=alf_s(t,i)*A(i,j)*B(j,t+1)*bet_s(t+1,j)/P_s;
        end;
    end;
end;

