function [PIA,TAUMUSIG,PIATAUMUSIG]=comb_der(P_A,P_PI,P_TAU,P_MU,P_SIG,Z,N,M)
PIA=zeros(1,N*N+N);
for i=1:1:N
    PIA(1,i)=P_PI(i,1);
    for j=1:1:N
        PIA(1,N+j+(i-1)*N)=P_A(i,j);
    end;
end;

TAUMUSIG=zeros(1,N*M+N*M*Z+N*M*Z*Z);
for i=1:1:N
    for m=1:1:M
        TAUMUSIG(1,(i-1)*M+m)=P_TAU(i,m);
        for z1=1:1:Z
            TAUMUSIG(1,N*M+(i-1)*M+m+(z1-1)*N*M)=P_MU(z1,i,m);
            for z2=1:1:Z
                TAUMUSIG(1,N*M+N*M*Z+(i-1)*M+m+(z1-1)*N*M*Z+(z2-1)*N*M)=P_SIG(z1,z2,i,m);
            end;
        end;
    end;
end;

PIATAUMUSIG=[PIA TAUMUSIG];