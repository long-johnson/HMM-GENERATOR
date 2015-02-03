function [deriv]=alfa_der(ALF1_N,A_N,B_N,A,B,alf_t,alf_s,c,T,N)
cd=zeros(T);
alf_t_d=zeros(T,N);
alf_s_d=zeros(T,N);
for i=1:1:N
    alf_t_d(1,i)=ALF1_N(i);
    cd(1)=cd(1)+alf_t_d(1,i);
end;
cd(1)=-c(1,1)^2*cd(1);

for t=2:1:T
    for i=1:1:N
        alf_s_d(t-1,i)=cd(t-1)*alf_t(t-1,i)+alf_t_d(t-1,i)*c(1,t-1);
    end;
    for i=1:1:N
        sum1=0;
        sum2=0;
       for j=1:1:N
           sum1=sum1+alf_s_d(t-1,i)*A(j,i)+alf_s(t-1,j)*A_N(j,i);
           sum2=sum2+alf_s(t-1,j)*A(j,i);
       end;
       alf_t_d(t,i)=sum1*B(i,t)+sum2*B_N(i,t);
       cd(t)=cd(t)+alf_t_d(t,i);
    end;
    cd(t)=-c(1,t)^2*cd(t);
end;

deriv=0;
for t=1:1:T
    deriv=deriv+cd(t)/c(1,t);
end;