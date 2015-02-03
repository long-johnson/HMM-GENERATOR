function [Np,Zp,Tp,Mp,Pip,A] = getdata(fnamenums,fnamepi,fnamea)
fid=fopen(fnamenums,'rt','n','UTF-8');
t=fread(fid,[1 4]);
Np=t(1,1);
Tp=t(1,2);
Zp=t(1,3);
Mp=t(1,4);
fclose(fid);

fid=fopen(fnamepi,'rt','n','UTF-8');
Pip=fread(fid,[Np,1],'double');
fclose(fid);

fid=fopen(fnamea,'rt','n','UTF-8');
A=fread(fid,[Np,Np],'double');
fclose(fid);
   


