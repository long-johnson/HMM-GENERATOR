N=3;
T=100;
K=100;

TR=zeros(2*K,2*N*N);
TRg=zeros(2*K,1);
fid = fopen('..\..\HMM\HMM\derivs\Tr.txt','rt');
Kt=2*K;
k=1;
while k<=Kt 
%for k=1:1:Kt
    TRg(k)=fscanf(fid,'%d',1);
    if TRg(k)==0
        Kt=Kt-1;
        k=k-1;
    
    else
        for i=1:1:2*N*N
            TR(k,i)=fscanf(fid,'%f',1);
        end;
    end;
    k=k+1;
%end;
end;
fclose (fid);
MEGASVM=svmtrain(TR(1:Kt,:),(TRg(1:Kt,:)),'kernel_function','linear');


Test1=zeros(K,2*N*N);
fid = fopen('..\..\HMM\HMM\derivs\Test1.txt','rt');
Kt=K;
k=1;
while k<=Kt
    isC=fscanf(fid,'%d',1);
    if isC==0
        k=k-1;
        Kt=Kt-1;
    else
        for i=1:1:2*N*N
            Test1(k,i)=fscanf(fid,'%f',1);
        end;
    end;
    k=k+1;
end;
fclose (fid);

G1=zeros(Kt);
G1=svmclassify(MEGASVM,Test1(1:Kt,:));
SUCCESS1=0;
for k=1:1:Kt
    if G1(k,1)==1
        SUCCESS1=SUCCESS1+1;
    end;
end;
SUCCESS1=SUCCESS1/Kt;

Test2=zeros(K,2*N*N);
fid = fopen('..\..\HMM\HMM\derivs\Test2.txt','rt');
Kt=K;
k=1;
while k<=Kt
    isC=fscanf(fid,'%d',1);
    if isC==0
        k=k-1;
        Kt=Kt-1;
    else
        for i=1:1:2*N*N
            Test2(k,i)=fscanf(fid,'%f',1);
        end;
    end;
    k=k+1;
end;
fclose (fid);
G2=svmclassify(MEGASVM,Test2(1:Kt,:));
SUCCESS2=0;
for k=1:1:Kt
    if G2(k,1)==2
        SUCCESS2=SUCCESS2+1;
    end;
end;
SUCCESS2=SUCCESS2/Kt;


SUCCESS=(SUCCESS1+SUCCESS2)/2;
disp(SUCCESS);