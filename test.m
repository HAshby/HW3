%test
clc
clear 
syms x y
fun=3*sin(1/2*pi*x);
lb=-1;
ub=1;
err_max=.1;
iter_max=10000;
A=[12 -6 3 8 4 ; 8 17 -2 10 4 ; -4 8 19 -5 -3 ; -2 5 4 17 -3 ; 7 3 8 -2 11];
b=[28;12;40;-28;50];
aa=A;
bb=b;

%code starts here 
As=size(A); %Check the size of the matrix size
Bs=size(b);
C=zeros(As(1));
m=zeros(As(1));
N=1;
M=1;
a=1;
B=1;
c=1;
d=1;
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
     for J=1:As(1)-1
        for I=J+1:As(1)
            m(I,J)=A(I,J)/A(J,J);
            for K=J+1:As(1)
                A(I,K)=A(I,K)-m(I,J)*A(J,K);
            end
            b(I)=b(I)-m(I,J)*b(J);
        end
     end
     x=zeros(As(1),1);
     for I=As(1):-1:1
         x(I)=b(I)
         for J=I+1:As(1)
            x(I)=x(I)-A(I,J)*x(J);        
         end 
         x(I)=x(I)/A(I,I);
     end
%             P=A(J,J); %Finds the numbers in the instance.
%             W=A(I+1,J); %Finds the A value to the right and below the current number.
%             O=W/P; %Finds the number to be eliminated 
%             A(I+1,:)=A(I+1,:)-O*A(J,:); %Eliminates the instant in matrix A.
%             b(I+1)=b(I+1)-O*b(J); %Eliminates the instant in matrix B.
      
  
%Cut after this
CVC=aa\bb;
AWS(:,1)=x;
AWS(:,2)=CVC;
display(AWS);
 

    %solnVec=x;

%
%Real Code begins 
% XL=[];
% XU=[];
% ROOT=[];
% syms x %sets the system up to handle symbolic functions.
% crun=true;
% letter=symvar(fun); %insures the function is in terms of "x".
% letter=double(x==letter);
% LLB=length(lb); %checks inputs for validity 
% LUB=length(ub);
% LER=length(err_max);
% LITER=length(iter_max);
% inputs=[lb ub err_max iter_max];
% One=isnumeric(inputs(1));
% Two=isnumeric(inputs(2));
% Three=isnumeric(inputs(3));
% Four=isnumeric(inputs(4));
% if letter == false
%         errordlg('The function you entered is not in terms of "x".','Funtion Error')
%         error('The function you entered is not in terms of "x".')
% elseif LLB~=1 || One ~=1
%         errordlg('Lower bound is not a single number.','Input Error')
%         error('Lower bound is not a single number.')
% elseif LUB~=1 || Two ~=1
%         errordlg('Upper bound is not a single number.','Input Error')
%         error('Upper bound is not a single number.')
% elseif LER~=1 || Three ~=1
%         errordlg('Max error is not a single number.','Input Error')
%         error('Max error is not a single number.')
% elseif LITER~=1 || Four ~=1
%     errordlg('Max interger is not a single number.','Input Error')
%     error('Max interger is not a single number.')
% end
% XRold=0;
% n=0;
% flb=double(subs(fun,x,lb));
% fub=double(subs(fun,x,ub));
% check_root=flb*fub;
% n_max=iter_max;
%     if check_root>=0 %checks roots
%         errordlg('Can not be sure that a root exist between the two bounds.','Root Error')
%         error('Can not be sure that a root exist between the two bounds.')
%     elseif err_max<=0 %checks error
%         errordlg('The error tolerance is not positive!','Tolerance Error');
%         error('The error tolerance is not positive!')
%     
%         
%    end
% while crun
%     flb=double(subs(fun,x,lb)); %derrmins value at upper and lower bounds
%     fub=double(subs(fun,x,ub));
%     xr=(ub*flb-lb*fub)/(flb-fub);
%     XRnew=xr;
%     %ROOT(n+1)=xr; %take this out
%     %XL(n+1)=lb; %take this out
%     %XU(n+1)=ub; %take this out
%     err=abs((XRnew-XRold)/(XRnew))*100;
%     fxr=double(subs(fun,x,xr));
%     if flb>=fub %makes sure upper bound it greater than the lower bound
%         errordlg('The lower limit is either greater than or equal to the upper limit!','Limit Error');
%         crun=false;
%         e=-1;
%     elseif check_root>=0 %insures a root is certain between the bounds
%         e=-1;
%         crun=false;
%         errordlg('Can not be sure that a root exist between the two bounds.','Root Error')
%    
%     
%     elseif isnumeric(flb)~=1 || isnumeric(fub)~=1   %ends code if a value is not a number. 
%         crun=false;
%         e=-2;
%         errordlg('Invalid return value for function.','Return Error')
%     
%     elseif n==n_max %ends code if max number of iterations are run.
%         errordlg('Max number of iterations hit before finding an acceptable root.','Iteration Error')
%         crun=false;
%         e=0;
%     elseif flb*fub*fxr == 0
%         crun=false;
%         e=1;
%         elseif err<=err_max; %code ends normally
%         crun=false;
%         e=1;
%     elseif fxr<0 %replaces bounds
%         lb=xr;
%         XRold=XRnew;
%     else
%         ub=xr;
%         XRold=XRnew;
%        
%     end
%     n=n+1;
% end %prepares to exit function
% exitFlag=e;
% root=xr;
% numIter=n;
% %Ignore after this 
% %XT=[XU;XL;ROOT]
% exitFlag=e
% root=xr
% numIter=n
% fxr
% %Ignore after this 
% %XT=[XU;XL;ROOT]