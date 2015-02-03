function [ro]=r_matr(A,B)
ro=0;
M=size(A,1);
N=size(A,2);
% for i=1:1:M
%     for j=1:1:N
%         ro=ro+(A(i,j)-B(i,j))^2;
%     end;
% end;
% ro=sqrt(ro);
for i=1:1:M
    for j=1:1:N
        ro=max(ro,abs(A(i,j)-B(i,j)));
    end;
end;