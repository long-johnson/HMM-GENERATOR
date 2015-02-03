NumInit=5;
T=100;
K=100;
% 
[N,Z,M,PI1,A1,MU1,SIG1,TAU1,PI11,A11,MU11,SIG11,TAU11]=get_init_params(101,NumInit);
[Ok1,Q1]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
write_params(Ok1,PI1,A1,TAU1,MU1,SIG1,PI11,A11,TAU11,MU11,SIG11,K,T,Z,N,M,NumInit,'..\..\HMM\HMM\model1\');

[N,Z,M,PI2,A2,MU2,SIG2,TAU2,PI21,A21,MU21,SIG21,TAU21]=get_init_params(102,NumInit);
[Ok2,Q2]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
write_params(Ok2,PI2,A2,TAU2,MU2,SIG2,PI21,A21,TAU21,MU21,SIG21,K,T,Z,N,M,NumInit,'..\..\HMM\HMM\model2\');


[Otest1,Q11]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
write_O(Otest1,K,T,Z,'..\..\HMM\HMM\model1\Otest1.txt');
[Otest2,Q21]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
write_O(Otest2,K,T,Z,'..\..\HMM\HMM\model1\Otest2.txt');

% [Otest1,Q12]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
% write_O(Otest1,K,T,Z,'..\..\HMM\HMM\model2\Otest1.txt');
% [Otest2,Q22]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
% write_O(Otest2,K,T,Z,'..\..\HMM\HMM\model2\Otest2.txt');

% 
% N=2;
% TR=zeros(2*K,2*N*N);
% fid = fopen('..\..\HMM\HMM\derivs\Tr.txt','rt');
% for k=1:1:2*K
%     for i=1:1:2*N*N
%         TR(k,i)=fscanf(fid,'%f',1);
%     end;
% end;
% fclose (fid);
% MEGASVM=svmtrain(TR,[ones(K,1);ones(K,1)*2],'kernel_function','quadratic');
% 
% % 
% Test1=zeros(K,2*N*N);
% fid = fopen('..\..\HMM\HMM\derivs\Test1.txt','rt');
% for k=1:1:K
%     for i=1:1:2*N*N
%         Test1(k,i)=fscanf(fid,'%f',1);
%     end;
% end;
% fclose (fid);
% G1=svmclassify(MEGASVM,Test1);
% SUCCESS1=0;
% for k=1:1:K
%     if G1(k,1)==1
%         SUCCESS1=SUCCESS1+1;
%     end;
% end;
% SUCCESS1=SUCCESS1/K;
% 
% Test2=zeros(K,2*N*N);
% fid = fopen('..\..\HMM\HMM\derivs\Test2.txt','rt');
% for k=1:1:K
%     for i=1:1:2*N*N
%         Test2(k,i)=fscanf(fid,'%f',1);
%     end;
% end;
% fclose (fid);
% G2=svmclassify(MEGASVM,Test2);
% SUCCESS2=0;
% for k=1:1:K
%     if G2(k,1)==2
%         SUCCESS2=SUCCESS2+1;
%     end;
% end;
% SUCCESS2=SUCCESS2/K;







% [PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1]=bvsuper(K,Ok1,TAU11,MU11,SIG11,A11,PI11,NumInit,T);
% 
% [N,Z,M,PI2,A2,MU2,SIG2,TAU2,PI21,A21,MU21,SIG21,TAU21]=get_init_params(42,NumInit);
% [Ok2,Q2]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
% [PI_E2,A_E2,TAU_E2,MU_E2,SIG_E2]=bvsuper(K,Ok2,TAU21,MU21,SIG21,A21,PI21,NumInit,T);
% 
% [Ok21,Q21]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
% [Ok11,Q11]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
% 
% P11=zeros(1,K);
% P12=zeros(1,K);
% P21=zeros(1,K);
% P22=zeros(1,K);
% PG1=zeros(K,1);
% PG2=zeros(K,1);
% PS1=0;
% PS2=0;
% for k=1:1:K
% P11(1,k)=getP(Ok11(:,:,:,:,k),PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1,T);
% P12(1,k)=getP(Ok11(:,:,:,:,k),PI_E2,A_E2,TAU_E2,MU_E2,SIG_E2,T);
% if P11(1,k)>P12(1,k)
%     PG1(k,1)=1;
%     PS1=PS1+1;
% else
%     PG1(k,1)=2;
% end;
% P21(1,k)=getP(Ok21(:,:,:,:,k),PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1,T);
% P22(1,k)=getP(Ok21(:,:,:,:,k),PI_E2,A_E2,TAU_E2,MU_E2,SIG_E2,T);
% if P21(1,k)>P22(1,k)
%     PG2(k,1)=1;
% else
%     PG2(k,1)=2;
%     PS2=PS2+1;
% end;
% end;
% 
% L=2;
% PIS(:,:,1)=PI_E1;
% PIS(:,:,2)=PI_E2;
% AS(:,:,1)=A_E1;
% AS(:,:,2)=A_E2;
% TAUS(:,:,1)=TAU_E1;
% TAUS(:,:,2)=TAU_E2;
% MUS(:,:,:,:,1)=MU_E1;
% MUS(:,:,:,:,2)=MU_E2;
% SIGS(:,:,:,:,1)=SIG_E1;
% SIGS(:,:,:,:,2)=SIG_E2;
% [P_PIS1,P_AS1,P_TAUS1,P_MUS1,P_SIGS1,TR1]=get_der(Ok1,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA1.txt');
% [P_PIS2,P_AS2,P_TAUS2,P_MUS2,P_SIGS2,TR2]=get_der(Ok2,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA2.txt');
% 
% [P_PIS11,P_AS11,P_TAUS11,P_MUS11,P_SIGS11,T11]=get_der(Ok11,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA11.txt');
% [P_PIS21,P_AS21,P_TAUS21,P_MUS21,P_SIGS21,T21]=get_der(Ok21,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA21.txt');
% 
% 
% disp('svm start')
% MEGASVM=svmtrain([TR1;TR2],[ones(K,1);ones(K,1)*2],'kernel_function','linear');
% G11=svmclassify(MEGASVM,T11);
% G21=svmclassify(MEGASVM,T21);

% 
% disp('investigation1')
% [N,Z,M,PI3,A3,MU3,SIG3,TAU3,PI31,A31,MU31,SIG31,TAU31]=get_init_params(31,NumInit);
% 
% T=50;
% pogrs=zeros(1,10);
% xs=zeros(1,10);
% i=1;
% for K=10:10:110
%     xs(1,i)=K;
%     [Ok3,Q3]=gen_signal(PI3,A3,TAU3,MU3,SIG3,T,K,Z,N);
%     [PI_E3,A_E3,TAU_E3,MU_E3,SIG_E3]=baum_velsh(K,Ok3,TAU31,MU31,SIG31,A31,PI31);
%     pogrs(i)=pogresh(PI3,PI_E3,A3,A_E3,TAU3,TAU_E3,MU3,MU_E3,SIG3,SIG_E3);
%     i=i+1;
% end;
% disp('investigation2')
% K=50;
% pogrs1=zeros(1,10);
% xs1=zeros(1,10);
% i=1;
% for T=10:10:110
%     xs1(1,i)=T;
%     [Ok3,Q3]=gen_signal(PI3,A3,TAU3,MU3,SIG3,T,K,Z,N);
%     [PI_E3,A_E3,TAU_E3,MU_E3,SIG_E3]=baum_velsh(K,Ok3,TAU31,MU31,SIG31,A31,PI31);
%     pogrs1(i)=pogresh(PI3,PI_E3,A3,A_E3,TAU3,TAU_E3,MU3,MU_E3,SIG3,SIG_E3);
%     i=i+1;
% end;


% [N,Z,M,PI2,A2,MU2,SIG2,TAU2,PI21,A21,MU21,SIG21,TAU21]=get_init_params(32);
% T=100;
% K=100;
% [Ok1,Q1]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
% [Ok11,Q11]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
% [Ok2,Q2]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
% [Ok21,Q21]=gen_signal(PI2,A2,TAU2,MU2,SIG2,T,K,Z,N);
% 
% [PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1]=baum_velsh(K,Ok1,TAU11,MU11,SIG11,A11,PI11);
% disp('baum1')
% [PI_E2,A_E2,TAU_E2,MU_E2,SIG_E2]=baum_velsh(K,Ok2,TAU21,MU21,SIG21,A21,PI21);
% disp('baum2')

% [N,Z,M,PI1,A1,MU1,SIG1,TAU1,PI11,A11,MU11,SIG11,TAU11]=get_init_params(31);
% %[N,Z,M,PI2,A2,MU2,SIG2,TAU2,PI21,A21,MU21,SIG21,TAU21]=get_init_params(32);
% disp('investigation1')
% T=50;
% pogrs=zeros(1,10);
% xs=zeros(1,10);
% i=1;
% for K=10:10:110
%     xs(1,i)=K;
%     [Ok1,Q1]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
%     [PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1]=baum_velsh(K,Ok1,TAU11,MU11,SIG11,A11,PI11);
%     pogrs(i)=pogresh(PI1,PI_E1,A1,A_E1,TAU1,TAU_E1,MU1,MU_E1,SIG1,SIG_E1);
%     i=i+1;
% end;
% 
% K=50;
% pogrs1=zeros(1,10);
% xs1=zeros(1,10);
% i=1;
% for T=10:10:110
%     xs1(1,i)=T;
%     [Ok1,Q1]=gen_signal(PI1,A1,TAU1,MU1,SIG1,T,K,Z,N);
%     [PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1]=baum_velsh(K,Ok1,TAU11,MU11,SIG11,A11,PI11);
%     pogrs1(i)=pogresh(PI1,PI_E1,A1,A_E1,TAU1,TAU_E1,MU1,MU_E1,SIG1,SIG_E1);
%     i=i+1;
% end;
% P11=zeros(1,K);
% P12=zeros(1,K);
% P21=zeros(1,K);
% P22=zeros(1,K);
% PG1=zeros(K,1);
% PG2=zeros(K,1);
% PS1=0;
% PS2=0;
% for k=1:1:K
% P11(1,k)=getP(Ok11(:,:,:,:,k),PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1,T);
% P12(1,k)=getP(Ok11(:,:,:,:,k),PI_E2,A_E1,TAU_E2,MU_E2,SIG_E2,T);
% if P11(1,k)>P12(1,k)
%     PG1(k,1)=1;
%     PS1=PS1+1;
% else
%     PG1(k,1)=2;
% end;
% P21(1,k)=getP(Ok21(:,:,:,:,k),PI_E1,A_E1,TAU_E1,MU_E1,SIG_E1,T);
% P22(1,k)=getP(Ok11(:,:,:,:,k),PI_E2,A_E2,TAU_E2,MU_E2,SIG_E2,T);
% if P21(1,k)>P22(1,k)
%     PG2(k,1)=1;
% else
%     PG2(k,1)=2;
%     PS2=PS2+1;
% end;
% end;
% disp('classiication1')
% PS1=PS1/K;
% PS2=PS2/K;
% 
% L=2;
% PIS(:,:,1)=PI_E1;
% PIS(:,:,2)=PI_E2;
% AS(:,:,1)=A_E1;
% AS(:,:,2)=A_E2;
% TAUS(:,:,1)=TAU_E1;
% TAUS(:,:,2)=TAU_E2;
% MUS(:,:,:,:,1)=MU_E1;
% MUS(:,:,:,:,2)=MU_E2;
% SIGS(:,:,:,:,1)=SIG_E1;
% SIGS(:,:,:,:,2)=SIG_E2;
% [P_PIS1,P_AS1,P_TAUS1,P_MUS1,P_SIGS1,TR1]=get_der(Ok1,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA1.txt');
% [P_PIS2,P_AS2,P_TAUS2,P_MUS2,P_SIGS2,TR2]=get_der(Ok2,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA2.txt');
% 
% [P_PIS11,P_AS11,P_TAUS11,P_MUS11,P_SIGS11,T11]=get_der(Ok11,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA11.txt');
% [P_PIS21,P_AS21,P_TAUS21,P_MUS21,P_SIGS21,T21]=get_der(Ok21,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,'vecA21.txt');
% 
% 
% disp('svm start')
% MEGASVM=svmtrain([TR1;TR2],[ones(K,1);ones(K,1)*2],'kernel_function','linear');
% G11=svmclassify(MEGASVM,T11);
% G21=svmclassify(MEGASVM,T21);
% SUCCESS1=0;
% SUCCESS2=0;
% for k=1:1:K
%     if G11(k,1)==1
%         SUCCESS1=SUCCESS1+1;
%     end;
%     if G21(k,1)==2
%         SUCCESS2=SUCCESS2+1;
%     end;
% end;
% SUCCESS1=SUCCESS1/K;
% SUCCESS2=SUCCESS2/K;

