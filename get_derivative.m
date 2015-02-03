function [P_PI,P_A,P_TAU,P_MU,P_SIG]=get_derivative(alf_s,alf_t,A,B,c,O,MU,SIG,PI,TAU,Z,N,M,T)
P_PI=zeros(N,1);
P_A=zeros(N,N);
P_MU=zeros(Z,N,M);
P_SIG=zeros(Z,Z,N,M);
P_TAU=zeros(N,M);

ALF1_PI=zeros(N,N);
for i=1:1:N
    for x=1:1:N
        if i==x
            ALF1_PI(i,x)=B(i,1);
        else
            ALF1_PI(i,x)=0;
        end;
    end;           
end;

ALF1_A=zeros(N,N,N);

B_MU=zeros(N,T,N,M,Z);
for i=1:1:N    
    for t=1:1:T
        for mx=1:1:M
            for z=1:1:Z
                B_MU(i,t,i,mx,z)=TAU(i,mx)*mvnpdf(O(:,:,1,t)',MU(:,:,i,mx)',SIG(:,:,i,mx))*(O(z,1,1,t)-MU(z,1,i,mx))/SIG(z,z,i,mx);
            end;
        end;
    end;        
end;

B_SIG=zeros(N,T,N,M,Z,Z);
dets=zeros(N,M); %определители ковариационных матриц
for i=1:1:N
   for m=1:1:M
       dets(i,m)=1;
       for z=1:1:Z
           dets(i,m)=dets(i,m)*SIG(z,z,i,m);
       end;
   end;
end;

for i=1:1:N    
    for t=1:1:T
        for mx=1:1:M
            for z=1:1:Z
                B_SIG(i,t,i,mx,z,z)=TAU(i,mx)*mvnpdf(O(:,:,1,t)',MU(:,:,i,mx)',SIG(:,:,i,mx))*0.5*((O(z,1,1,t)-MU(z,1,i,mx))^2/SIG(z,z,i,m)^2-1/dets(i,m));
            end;
        end;
    end;        
end;

ALF1_MU=zeros(N,N,M,Z);
ALF1_SIG=zeros(N,N,M,Z,Z);
for i=1:1:N
    for mx=1:1:M
       for z=1:1:Z
           ALF1_MU(i,i,mx,z)=PI(i,1)*B_MU(i,1,i,mx,z);
           ALF1_SIG(i,i,mx,z)=PI(i,1)*B_SIG(i,1,i,mx,z,z);
       end;
    end;
end;

B_A=zeros(N,T,N,N);
B_PI=zeros(N,T,N);

A_A=zeros(N,N,N,N);
for i=1:1:N
    for j=1:1:N
        A_A(i,j,i,j)=1;
    end;
end;
A_MU=zeros(N,N,N,M,Z);
A_SIG=zeros(N,N,N,M,Z,Z);
A_PI=zeros(N,N,N);

A_TAU=zeros(N,N,N,M);

B_TAU=zeros(N,T,N,M);
for i=1:1:N
    for t=1:1:T
        for mx=1:1:M
            B_TAU(i,t,i,mx)=g(O(:,:,1,t),MU(:,:,i,mx),SIG(:,:,i,mx));
        end;        
    end;
end;

ALF1_TAU=zeros(N,N,M);
for i=1:1:N
    for mx=1:1:M
        ALF1_TAU(i,i,mx)=PI(i,1)*B_TAU(i,1,i,mx);
    end;
end;

for i=1:1:N
    P_PI(i,1)=alfa_der(ALF1_PI(:,i),A_PI(:,:,i),B_PI(:,:,i),A,B,alf_t,alf_s,c,T,N);
end;

for i=1:1:N
    for j=1:1:N
        P_A(i,j)=alfa_der(ALF1_A(:,i,j),A_A(:,:,i,j),B_A(:,:,i,j),A,B,alf_t,alf_s,c,T,N);
    end;
end;

for i=1:1:N
    for m=1:1:M
        for z=1:1:Z
            P_MU(z,i,m)=alfa_der(ALF1_MU(:,i,m,z),A_MU(:,:,i,m,z),B_MU(:,:,i,m,z),A,B,alf_t,alf_s,c,T,N);
            P_SIG(z,z,i,m)=alfa_der(ALF1_SIG(:,i,m,z,z),A_SIG(:,:,i,m,z,z),B_SIG(:,:,i,m,z,z),A,B,alf_t,alf_s,c,T,N);
        end;
    end;
end;

for i=1:1:N
    for m=1:1:M
        P_TAU(i,m)=alfa_der(ALF1_TAU(:,i,m),A_TAU(:,:,i,m),B_TAU(:,:,i,m),A,B,alf_t,alf_s,c,T,N);
    end;
end;
