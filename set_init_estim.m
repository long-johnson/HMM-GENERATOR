function [PI1,A1,TAU1,MU1,SIG1]=set_init_estim(N,M,Z)

A1=[0.5 0.5; 
    0.5 0.5];

TAU1=zeros(N,M);
MU1=zeros(Z,1,N,M);
SIG1=zeros(Z,Z,N,M);
PI1=zeros(N,1);

% TAU1(1,:)=[1.];
% TAU1(2,:)=[1.];
% MU1(:,:,1,1)=[0.2];
% MU1(:,:,2,1)=[5.2];
% SIG1(:,:,1,1)=[0.5];
% SIG1(:,:,2,1)=[6.5];
TAU1(1,:)=[0.7,0.3];
TAU1(2,:)=[0.3,0.7];
%MU1=[6 -6; 6 0];
MU1(:,:,1,1)=[0.2];
MU1(:,:,2,1)=[5.5];
MU1(:,:,1,2)=[-4.3];
MU1(:,:,2,2)=[-9];
%SIG1=[0.5 1; 6.5 0.9];
SIG1(:,:,1,1)=[0.5];
SIG1(:,:,2,1)=[1.2];
SIG1(:,:,1,2)=[0.7];
SIG1(:,:,2,2)=[0.9];
PI1=[0.7; 0.3];

% PI1=[0.25, 0.25, 0.25, 0.25]';
% TAU1=ones(N,M)/M;
% for i=1:1:N
%     TAU1(i,:)=[0.1, 0.1, 0.8];
% end;
% MU1=zeros(1,M*N*Z);
% MU1=reshape(MU1,[Z 1 N M]);
% SIG1=zeros(1,M*N*Z*Z);
% SIG1=reshape(SIG1,[Z Z N M ]);
% for i=1:1:N
%     for j=1:1:M
%         SIG1(:,:,i,j)=eye(Z);
%     end;
% end;
% 
% A1=[0.6 0.1  0.2 0.1;
%     0.1 0.6  0.1 0.2;
%     0.2 0.1  0.6 0.1;
%     0.1 0.2  0.1 0.6];