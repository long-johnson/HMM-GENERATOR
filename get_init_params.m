function [N,Z,M,PI,A,MU,SIG,TAU,PI1,A1,MU1,SIG1,TAU1]=get_init_params(TestNumber,NumInit)
da=0.2;

switch TestNumber
    case 10
        N=3;
        Z=1;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1 0.7 0.2; 
            0.2 0.2 0.6;
            0.8 0.1 0.1];

        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
    case 11
        N=3;
        Z=1;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1+da 0.7-da 0.2; 
        0.2 0.2+da 0.6-da;
        0.8-da 0.1 0.1+da];

        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
        
    case 20
    N=3;
    Z=2;
    M=3;
    PI=[1.; 0; 0];
    A=[0.1 0.7 0.2; 
        0.2 0.2 0.6;
        0.8 0.1 0.1];
    
    TAU=[0.3 0.5 0.2;
        0.3 0.5 0.2
        0.3 0.5 0.2];
    MU=zeros(Z,1,N,M);
    SIG=zeros(Z,Z,N,M);
    
    tmp=[1;1];       
    for i=1:1:N
    for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%+[0;1];
    end;
    end;
    
    for i=1:1:N
        for m=1:1:M
            SIG(:,:,i,m)=eye(Z);
        end;
    end;
    
    PI1=[0.5; 0.25; 0.25];
    A1=ones(N,N)/N;
    TAU1=ones(N,M)/M;
    
    MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
   
    case 21
    N=3;
    Z=2;
    M=3;
    PI=[1.; 0; 0];
    
    A=[0.1+da 0.7-da 0.2; 
        0.2 0.2+da 0.6-da;
        0.8-da 0.1 0.1+da];
    
    TAU=[0.3 0.5 0.2;
        0.3 0.5 0.2
        0.3 0.5 0.2];
    MU=zeros(Z,1,N,M);
    SIG=zeros(Z,Z,N,M);
    
    tmp=[1;1];       
    for i=1:1:N
    for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%+[0;1];
    end;
    end;
    
    for i=1:1:N
        for m=1:1:M
            SIG(:,:,i,m)=eye(Z);
        end;
    end;
    
    PI1=[0.5; 0.25; 0.25];
    A1=ones(N,N)/N;
    TAU1=ones(N,M)/M;
    
    MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+tmp*unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
   
         
    case 30
        N=3;
        Z=3;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1 0.7 0.2; 
            0.2 0.2 0.6;
            0.8 0.1 0.1];

        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1;1;1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%+[0;1;2];
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+tmp*unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
        
    case 31
         N=3;
        Z=3;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1+da 0.7-da 0.2; 
        0.2 0.2+da 0.6-da;
        0.8-da 0.1 0.1+da];

        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1;1;1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%+[0;1;2];
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
        
    case 51
         N=2;
        Z=2;
        M=3;
        PI=[1; 0];% 0; 0];
        A=[0.3 0.7; 
            0.7 0.3];

        tmp=[1;1]; 
        MU=ones(1,M*N*Z);
        MU=reshape(MU,[Z 1 N M]);
        for i=1:1:N
        for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%i*rand(Z,1);
        end;
        end;

        SIG=zeros(1,M*N*Z*Z);
        SIG=reshape(SIG,[Z Z N M ]);
        for i=1:1:N
        for j=1:1:M
        SIG(:,:,i,j)=eye(Z)*(i+j)/(M+N);
        end;
        end;

        TAU=[0.3 0.5 0.2; 
            0.3 0.5 0.2]; 
            %0.3 0.5 0.2; 
            %0.3 0.5 0.2];

        PI1=[0.5; 0.5];%[0.25; 0.25; 0.25; 0.25];
        TAU1=ones(N,M)/M;
    %     for i=1:1:N
    %         TAU1(i,:)=[0.1, 0.1, 0.8];
    %     end;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;

        A1=[0.5 0.5; 
            0.5 0.5];

    case 52
        N=2;
        Z=2;
        M=3;
        PI=[1; 0];
        A=[0.4 0.6; 
            0.6 0.4];
    %

        tmp=[1;1]; 
        MU=ones(1,M*N*Z);
        MU=reshape(MU,[Z 1 N M]);
        for i=1:1:N
        for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%i*rand(Z,1);
        end;
        end;

        SIG=zeros(1,M*N*Z*Z);
        SIG=reshape(SIG,[Z Z N M ]);
        for i=1:1:N
        for j=1:1:M
        SIG(:,:,i,j)=eye(Z)*(i+j)/(M+N);
        end;
        end;

        TAU=[0.3 0.5 0.2; 
            0.3 0.5 0.2];

        PI1=[0.5; 0.5];
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;

        A1=[0.5 0.5; 
        0.5 0.5];
    case 41
         N=2;
        Z=2;
        M=3;
        PI=[1; 0];
        A=[0.4 0.6; 
            0.6 0.4];
    %

        tmp=[1;1]; 
        MU=ones(1,M*N*Z);
        MU=reshape(MU,[Z 1 N M]);
        for i=1:1:N
        for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%i*rand(Z,1);
        end;
        end;

        SIG=zeros(1,M*N*Z*Z);
        SIG=reshape(SIG,[Z Z N M ]);
        for i=1:1:N
        for j=1:1:M
        SIG(:,:,i,j)=eye(Z)*(i+j)/(M+N);
        end;
        end;

        TAU=[0.3 0.5 0.2; 
            0.3 0.5 0.2];

        PI1=[0.5; 0.5];
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;

        A1=[0.5 0.5; 
        0.5 0.5];
    case 42
         N=2;
        Z=2;
        M=3;
        PI=[1; 0];
        A=[0.43 0.57; 
            0.57 0.43];
    
        tmp=[1;1]; 
        MU=ones(1,M*N*Z);
        MU=reshape(MU,[Z 1 N M]);
        for i=1:1:N
        for j=1:1:M
        MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3);%i*rand(Z,1);
        end;
        end;

        SIG=zeros(1,M*N*Z*Z);
        SIG=reshape(SIG,[Z Z N M ]);
        for i=1:1:N
        for j=1:1:M
        SIG(:,:,i,j)=eye(Z)*(i+j)/(M+N);
        end;
        end;

        TAU=[0.3 0.5 0.2; 
            0.3 0.5 0.2];

        PI1=[0.5; 0.5];
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;

        A1=[0.5 0.5; 
        0.5 0.5];
    case 101
         N=3;
        Z=8;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1 0.7 0.2; 
            0.2 0.2 0.6;
            0.8 0.1 0.1];

        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1;1;1;1;1;1;1;1];%;1;1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3)+[0;1;2;3;4;5;6;7];%8;9];
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+tmp*unifrnd(-1,1)*(n)/NumInit;%tmp*((i-1)*10+(j-1)*3+2);%i*rand(Z,1);
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
        
    case 102
         N=3;
        Z=8;
        M=3;
        PI=[1.; 0; 0];
        A=[0.1+da 0.7-da 0.2; 
        0.2 0.2+da 0.6-da;
        0.8-da 0.1 0.1+da];
    
        TAU=[0.3 0.5 0.2;
            0.3 0.5 0.2
            0.3 0.5 0.2];
        MU=zeros(Z,1,N,M);
        SIG=zeros(Z,Z,N,M);

        tmp=[1;1;1;1;1;1;1;1];%;1;1];       
        for i=1:1:N
        for j=1:1:M
            MU(:,:,i,j)=tmp*((i-1)*10+(j-1)*3)+[0;1;2;3;4;5;6;7];%8;9];
        end;
        end;

        for i=1:1:N
            for m=1:1:M
                SIG(:,:,i,m)=eye(Z);
            end;
        end;

        PI1=[0.5; 0.25; 0.25];
        A1=ones(N,N)/N;
        TAU1=ones(N,M)/M;

        MU1=zeros(Z,1,N,M,NumInit);
        for n=1:1:NumInit
            for i=1:1:N
                for j=1:1:M
                    MU1(:,:,i,j,n)=MU(:,:,i,j)+tmp*unifrnd(-1,1)*(n)/NumInit;
                end;
            end;
        end;

        SIG1=zeros(Z,Z,N,M,NumInit);
        for n=1:1:NumInit
        for i=1:1:N
            for j=1:1:M
                SIG1(:,:,i,j,n)=SIG(:,:,i,j)+eye(Z)*unifrnd(0,0.5)*(n)/NumInit;
            end;
        end;
        end;
otherwise
    disp('wrong test')
end