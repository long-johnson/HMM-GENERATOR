function write_O(Ok,K,T,Z,filename)
fid = fopen(filename,'wt');
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