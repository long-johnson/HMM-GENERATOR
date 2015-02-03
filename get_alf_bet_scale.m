function [alf_s,bet_s,c,P_s,at]=get_alf_bet_scale(PI,B,A)
N=size(PI,1);
T=size(B,2);
% alf_t=zeros(T,N);
% alf_s=zeros(T,N);
% bet_t=zeros(T,N);
% bet_s=zeros(T,N);
% c=zeros(1,T);
% alf_t_sum=0.;
% for i=1:1:N
%     alf_t(1,i)=PI(i,1)*B(i,1);
%     alf_t_sum=alf_t_sum+alf_t(1,i);
% end;
% for t=1:1:T-1
%     for i=1:1:N
%         alf_s(t,i)=alf_t(t,i)/alf_t_sum;
%     end;
%     alf_t_sum=0.;
%     for i=1:1:N
%         for j=1:1:N
%             alf_t(t+1,i)=alf_t(t+1,i)+alf_s(t,j)*A(j,i);
%         end;
%         alf_t(t+1,i)=alf_t(t+1,i)*B(i,t+1);
%         alf_t_sum=alf_t_sum+alf_t(t+1,i);
%     end;
%     c(1,t)=(alf_s(t,1)/alf_t(t,1));
% end;
% 
% P_s=0.;
% for i=1:1:N
%         alf_s(T,i)=alf_t(T,i)/alf_t_sum;
%         P_s=P_s+alf_s(T,i);
%         bet_s(T,i)=1.;        
% end;
% 
% c(T)=(alf_s(T,1)/alf_t(T,1));
% for t=T-1:-1:1
%     for i=1:1:N 
%         bet_t(t+1,i)=c(1,t+1)*bet_s(t+1,i);
%     end;
%     for i=1:1:N
%         for j=1:1:N
%             bet_s(t,i)=bet_s(t,i)+A(i,j)*B(j,t+1)*bet_t(t+1,j); %ËÎË A(J,I)? ¬ ÃﬁÕ—“≈–≈ I,J, ¬ Ã≈“Œƒ≈ Õ¿Œ¡Œ–Œ“
%         end;
%     end;
% end;
% 
% alf_s=zeros(T,N);
% bet_s=zeros(T,N);
% for i=1:1:N
%   alf_s(1,i)=PI(i,1)*B(i,1); 
%   bet_s(T,i)=1.;
% end;
% for t=1:1:(T-1)
%     for i=1:1:N
%         alf_sum=0;
%         for j=1:1:N
%             alf_sum=alf_sum+alf_s(t,j)*A(j,i);
%         end;
%         alf_s(t+1,i)=B(i,t+1)*alf_sum;
%     end;
% end;
% P_s=sum(alf_s(T,:));
% for t=(T-1):(-1):1
%     for i=1:1:N
%         for j=1:1:N
%             bet_s(t,i)=bet_s(t,i)+ bet_s(t+1,j)*B(j,t+1)*A(i,j);
%         end;
%     end;
% end;
% c=zeros(1,T);

alf_s=zeros(T,N);
bet_s=zeros(T,N);
c=zeros(1,T);
at=zeros(T,N);
bt=zeros(T,N);
for i=1:1:N
    at(1,i)=PI(i,1)*B(i,1);
end;
for t=1:1:(T-1)
    for i=1:1:N
        atsum=0;
        for n=1:1:N
            atsum=atsum+at(t,n);
        end;
        alf_s(t,i)=at(t,i)/atsum;
    end;
    
    for i=1:1:N
        alf_sum=0;
        for j=1:1:N
            alf_sum=alf_sum+alf_s(t,j)*A(j,i);
        end;
        at(t+1,i)=B(i,t+1)*alf_sum;
    end;
    
    c(1,t)=alf_s(t,1)/at(t,1);
end;
P_s=0;
for i=1:1:N
        atsum=0;
        for n=1:1:N
            atsum=atsum+at(T,n);
        end;
        alf_s(T,i)=at(T,i)/atsum;
        P_s=P_s + alf_s(T,i);
end;
c(1,T)=alf_s(T,1)/at(T,1);

for i=1:1:N
    bet_s(T,i)=1;
end;

for t=(T-1):(-1):1
   for i=1:1:N
       bt(t+1,i)=c(1,t+1)*bet_s(t+1,i);
   end;
   for i=1:1:N
       for j=1:1:N
            bet_s(t,i)=bet_s(t,i)+A(i,j)*B(j,t+1)*bt(t+1,j);
       end;
   end;
end;
% disp(at);
% disp(bt);
% alf_s=at;
% bet_s=bt;


