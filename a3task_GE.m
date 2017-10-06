function [ x ] = a3task_GE( A,b )
%Solving systems of equations using Gauss Elimination.
%   Inputs
%       A: Matrix A is a matrix form of the system of equations you want to
%       solve.
%       b: The solution matrix for the systems of equations 
%   Outputs
%       x: The values of the "x"s for the system of equations. 
%   

As=size(A); %Check the size of the matrix size
Bs=size(b);
C=zeros(As(1));
m=zeros(As(1));
a=1;
B=1;
c=1;
q=1;
z=0;
for N=As(1) %Makes sure there are no zeros in the upper triangle. 
    for M=As(1)
        Q =length(A(a,B))>1 || isnumeric(A(a,B))~=1;
        if Q==1
            errordlg('Every member of matrix A is not a single number.','Matrix Error')
            error('Every member of matrix A is not a single number.')
        end
       B=B+1; 
    end
    a=a+1;
end
for N=As(1)
    Q=length(B(c))>1 || isnumeric(B(c))~=1;
    if Q==1
            errordlg('Every member of matrix B is not a single number.','Matrix Error')
            error('Every member of matrix B is not a single number.')
    end
        c=c+1;
end
%Makes sure the matrixs can be used
    if As(1)~=As(2)
            errordlg('Matrix A is not a square matrix.','Matrix Error')
            error('Matrix A is not a square matrix.')
        elseif Bs(2)~=1
            errordlg('Matrix B is not a column matrix.','Matrix Error')
            error('Matrix A is not a column matrix.')
        elseif As(1)~=Bs(1)
            errordlg('Matrix A and matrix B are not compatible.','Matrix Error')
            error('Matrix A and matrix B are not compatible')
        else
    end
    for M=1:As(1) %Makes sure there are no zeros in the upper triangle. 
        z=z+1;
        y=z;
        for N=y:As(1)
            C(y,z)=A(y,z);
            Q=A(y,z)==0;
            if Q==1
                errordlg('Every member of the upper triangle of matrix A must be non-zero.','Matrix Error')
                error('Every member of the upper triangle of matrix A must be non-zero.')
            end
            q=q+1;
            y=y+1;
        end
        
    end
    %forward Sub
     for J=1:As(1)-1
        for I=J+1:As(1)
            m(I,J)=A(I,J)/A(J,J);
            for K=J+1:As(1)
                A(I,K)=A(I,K)-m(I,J)*A(J,K);
            end
            b(I)=b(I)-m(I,J)*b(J);
        end
     end
     %Backward Sub
     x=zeros(As(1),1);
     for I=As(1):-1:1
         x(I)=b(I);
         for J=I+1:As(1)
            x(I)=x(I)-A(I,J)*x(J);        
         end 
         x(I)=x(I)/A(I,I);
     end 
end

