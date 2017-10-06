function [ xr, n ] = a3root_bisection( f,xl,xu,tol  )
%This is the function that finds the root using the bisection method.
%   input
%       f - input funtion
%       xl - the lower x value that is to be intially tested
%       xu - the upper x value that is to be intially tested
%       tol - the tollarnace of error
%
%   output
%       xr - the x value of the root
%       n - number of interations 
%
%
if xl>=xu
    errordlg('The lower limit is either greater than or equal to the upper limit!','Limit Error');
    error('The lower limit is either greater than or equal to the upper limit!')
end
if tol<=0
    errordlg('The error tolerance is not positive!','Tolerance Error');
    error('The error tolerance is not positive!')
end
% XU=[];
% XL=[];
% XR=[];
% XT=[];
% XF=[];
n=0;
n_max=1E9;
x=xu;
upper_value=subs(f,x);
x=xl;
lower_value=subs(f,x);
err=abs((xu-xl)/(xu+xl))*100;
check_root=lower_value*upper_value;
if check_root>=0
    errordlg('Can not be sure that a root exist between the two bounds.','Root Error')
    error('Can not be sure that a root exist between the two bounds.')
end
crun=true;
   while crun
       xr=(xl+xu)/2;
       x=xr;
       fxr=subs(f,x);
%        XF(n+1)=fxr;
%        XU(n+1)=(xu);
%        XL(n+1)=(xl);
%        XR(n+1)=(xr);
       if abs(fxr)<tol;
           crun=false;
       elseif err<.1
           crun=false;
       elseif n==n_max
           errordlg('Max number of iterations hit before finding an acceptable root.','Iteration Error')
           crun=false;
       elseif fxr<0
           xl=xr;
       else
           xu=xr;
       end
      n=n+1; 
   end
end

