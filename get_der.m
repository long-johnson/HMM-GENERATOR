function [P_PIS,P_AS,P_TAUS,P_MUS,P_SIGS,MA]=get_der(Ok,PIS,AS,TAUS,MUS,SIGS,L,K,N,Z,T,M,fnameA)
%L - ЧИСЛО КЛАССОВ
P_PIS=zeros(N,1,L);
P_AS=zeros(N,N,L);
P_TAUS=zeros(N,M,L);
P_MUS=zeros(Z,N,M,L);
P_SIGS=zeros(Z,Z,N,M,L);
MA=zeros(K,L*N*N);
for k=1:1:K
    for l=1:1:L
        B=calcB(Ok(:,:,:,:,k),TAUS(:,:,l),MUS(:,:,:,:,l),SIGS(:,:,:,:,l));
        [alf_s,bet_s,c,P_s,alf_t]=get_alf_bet_scale(PIS(:,:,l),B,AS(:,:,l));
         [P_PI,P_A,P_TAU,P_MU,P_SIG]=get_derivative(alf_s,alf_t,AS(:,:,l),B,c,Ok(:,:,:,:,k),MUS(:,:,:,:,l),SIGS(:,:,:,:,l),PIS(:,:,l),TAUS(:,:,l),Z,N,M,T);
         MA(k,((l-1)*N*N+1):l*N*N)=reshape(P_A,[1,N*N]);
         P_PIS(:,:,l)=P_PIS(:,:,l)+P_PI;
         P_AS(:,:,l)=P_AS(:,:,l)+P_A;
         P_TAUS(:,:,l)=P_TAUS(:,:,l)+P_TAU;
         P_MUS(:,:,:,l)=P_MUS(:,:,:,l)+P_MU;
         P_SIGS(:,:,:,:,l)=P_SIGS(:,:,:,:,l)+P_SIG;
    end;
end;
fidA = fopen(['D:\УНИВЕР УЧЕБА\материалы по дипломной\matlab\получение данных и генератор\файлы с векторами\' fnameA],'wt');
for l=1:1:L
    for i=1:1:N
        for j=1:1:N
            fprintf(fidA,'%10.10f\n',P_AS(i,j,l));
        end;
    end;
end;

fclose(fidA);


