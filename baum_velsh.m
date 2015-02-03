function [PI_E,A_E,TAU_E,MU_E,SIG_E]=baum_velsh(K,Ok,TAU1,MU1,SIG1,A1,PI1)
Z=size(Ok,1);
T=size(Ok,4);
M=size(TAU1,2);
N=size(TAU1,1);
alf_s_k=zeros(T,N,K);
alf_t_k=zeros(T,N,K);
bet_s_k=zeros(T,N,K);
c_k=zeros(1,T,K);
P_s_k=zeros(1,K);
gam_s_k=zeros(T,N,K);
ksi_s_k=zeros(T-1,N,N,K);
gamd_s_k=zeros(T,N,M,K);
B_k=zeros(N,T,K);

nev0=0;
% A_E=A1;

 %PI_E=PI1;
 %TAU_E=TAU1;
%  SIG_E=SIG1;
%  MU_E=MU1;
for iter=1:1:5
    disp(['iter=',num2str(iter)]);
    nev1=1;
    for k=1:1:K
        B_k(:,:,k)=calcB(Ok(:,:,:,:,k),TAU1,MU1,SIG1);
        [alf_s_k(:,:,k),bet_s_k(:,:,k),c_k(:,:,k),P_s_k(:,k),alf_t_k(:,:,k)]=get_alf_bet_scale(PI1,B_k(:,:,k),A1);
        [gam_s_k(:,:,k),ksi_s_k(:,:,:,k),gamd_s_k(:,:,:,k)]=get_gam_ksi_scale(alf_s_k(:,:,k),bet_s_k(:,:,k),P_s_k(:,k),A1,B_k(:,:,k),TAU1,MU1,SIG1,Ok(:,:,:,:,k));
        for t=1:1:T
            nev1=nev1*c_k(1,t,k);            
        end;
    end;    
    nev1=log(nev1);
    
    gam_sum=zeros(N);
    gamd_sum=zeros(N,M);    
    for t=1:1:T-1
        for k=1:1:K
            for i=1:1:N
                gam_sum(i)=gam_sum(i)+gam_s_k(t,i,k);
                for m=1:1:M
                    gamd_sum(i,m)=gamd_sum(i,m)+gamd_s_k(t,i,m,k);
                end;
            end;
        end;
    end;
        
    
    PI_E=zeros(N,1);
    for i=1:1:N
        for k=1:1:K
            PI_E(i,1)=PI_E(i,1)+gam_s_k(1,i,k);
        end;
        PI_E(i,1)=PI_E(i,1)/K;
    end;
%     
    A_E=zeros(N,N);
    for i=1:1:N
        for j=1:1:N            
            tmp2=0;
            for k=1:1:K
                for t=1:1:(T-1)
                    tmp2=tmp2+ksi_s_k(t,i,j,k)*c_k(1,t+1,k);
                end;
            end;
            A_E(i,j)=tmp2/gam_sum(i);            
        end;
    end;
%     
%  
    TAU_E=zeros(N,M);
    for i=1:1:N
        for m=1:1:M
            TAU_E(i,m)=gamd_sum(i,m)/gam_sum(i);
        end;
    end;
% %     
    MU_E=zeros(Z,1,N,M);
    for i=1:1:N
        for m=1:1:M            
            for k=1:1:K
                for t=1:1:T
                    MU_E(:,:,i,m)=MU_E(:,:,i,m)+gamd_s_k(t,i,m,k)*Ok(:,:,1,t,k);
                end;
            end;
            MU_E(:,:,i,m)=MU_E(:,:,i,m)/gamd_sum(i,m);
        end;
    end;
    
    SIG_E=zeros(Z,Z,N,M);
    for i=1:1:N
        for m=1:1:M
            for k=1:1:K
                for t=1:1:T
                    vec=Ok(:,:,1,t,k)-MU_E(:,:,i,m);
                    SIG_E(:,:,i,m)=SIG_E(:,:,i,m)+gamd_s_k(t,i,m,k)*(vec*vec');
                end;
            end;
            SIG_E(:,:,i,m)=SIG_E(:,:,i,m)/gamd_sum(i,m);
        end;
    end;
    PI1=PI_E;
     A1=A_E;
      TAU1=TAU_E;
    MU1=MU_E;
    SIG1=SIG_E;
    
    disp(abs(nev0-nev1))
    nev0=nev1;
end;