function setfiles(fnums,fpi,fa)
fid=fopen(fnums,'wt');
N=4;T=5;Z=2;M=3;
A=[N, T, Z, M];
fwrite(fid,A,'uint8');
fclose(fid);
fid=fopen(fpi,'wt');
Ppi=zeros(N,1);
for i=1:1:N
Ppi(i,1)=1./N;    
end;

fwrite(fid,Ppi,'double');
fclose(fid);
fid=fopen(fa,'wt');
AA=[0.1,0.4,0.3,0.2;0.2,0.1,0.4,0.3;0.3,0.2,0.1,0.4;0.4,0.3,0.2,0.1];
%disp(A)
fwrite(fid,AA,'double');
fclose(fid);



