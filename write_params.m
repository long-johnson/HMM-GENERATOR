function write_params(Ok,PI,A,TAU,MU,SIG,PI1,A1,TAU1,MU1,SIG1,K,T,Z,N,M,NumInit,filename)

fid = fopen([filename 'Params.txt'],'wt');
fprintf(fid,'%d %d %d %d %d %d',N,M,Z,T,K,NumInit);
fclose(fid);

%   fprintf(fid,'%10.10f\n',P_AS(i,j,l));
fid = fopen([filename 'PI.txt'],'wt');
for i=1:1:N
  fprintf(fid,'%10.10f\n',PI(i,1));  
end;
fclose(fid);

fid = fopen([filename 'PI1.txt'],'wt');
for i=1:1:N
  fprintf(fid,'%10.10f\n',PI1(i,1));  
end;
fclose(fid);

fid = fopen([filename 'A.txt'],'wt');
for i=1:1:N
   for j=1:1:N
       fprintf(fid,'%10.10f ',A(i,j));  
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'A1.txt'],'wt');
for i=1:1:N
   for j=1:1:N
       fprintf(fid,'%10.10f ',A1(i,j));  
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'TAU.txt'],'wt');
for i=1:1:N
   for m=1:1:M
       fprintf(fid,'%10.10f ',TAU(i,m));  
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'TAU1.txt'],'wt');
for i=1:1:N
   for m=1:1:M
       fprintf(fid,'%10.10f ',TAU1(i,m));  
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'MU.txt'],'wt');
for i=1:1:N
   for m=1:1:M
       for z=1:1:Z
            fprintf(fid,'%10.10f ',MU(z,1,i,m)); 
       end;
       fprintf(fid,'\n');
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'MU1.txt'],'wt');
for n=1:1:NumInit
for i=1:1:N
   for m=1:1:M
       for z=1:1:Z
            fprintf(fid,'%10.10f ',MU1(z,1,i,m,n)); 
       end;
       fprintf(fid,'\n');
   end;
   fprintf(fid,'\n');
end;
fprintf(fid,'\n\n');
end;
fclose(fid);

fid = fopen([filename 'SIG.txt'],'wt');
for i=1:1:N
   for m=1:1:M
       for z1=1:1:Z
           for z2=1:1:Z
                fprintf(fid,'%10.10f ',SIG(z1,z2,i,m)); 
           end;
       end;
       fprintf(fid,'\n');
   end;
   fprintf(fid,'\n');
end;
fclose(fid);

fid = fopen([filename 'SIG1.txt'],'wt');
for n=1:1:NumInit
for i=1:1:N
   for m=1:1:M
       for z1=1:1:Z
           for z2=1:1:Z
                fprintf(fid,'%10.10f ',SIG1(z1,z2,i,m,n)); 
           end;
       end;
       fprintf(fid,'\n');
   end;
   fprintf(fid,'\n');
end;
end;
fclose(fid);

fid = fopen([filename 'Ok.txt'],'wt');
for k=1:1:K
    for t=1:1:T
        for z=1:1:Z
            fprintf(fid,'%10.10f ',Ok(z,1,1,t,k));
        end;
        fprintf(fid,'  ');
    end;
    fprintf(fid,'\n\n');
end;
fclose (fid);
