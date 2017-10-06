function [ root, err,numIter, exitFlag ] = a3root_falseposition( fun, lb, ub, err_max, iter_max )
%This is the function that finds the root using the fales position method.
%   input
%       fun - input funtion
%       lb - the lower x value that is to be intially tested
%       ub - the upper x value that is to be intially tested
%       err_max - the tollarnace of error
%       iter_max - max number of iterrations the loop will run
%
%   output
%       root - the x value of the root
%       numIter - number of interations 
%       err - the error
%       exitFlag - states why the program terminated
%           1 - program ran normally
%           0 - max iterations reached
%          -1 - invalid bracket specification
%          -2 - invalid return value
%
%
% XL=[];
% XU=[];
% ROOT=[];
syms x %sets the system up to handle symbolic functions.
crun=true;
letter=symvar(fun); %insures the function is in terms of "x".
letter=double(x==letter);
LLB=length(lb); %checks inputs for validity 
LUB=length(ub);
LER=length(err_max);
LITER=length(iter_max);
inputs=[lb ub err_max iter_max];
One=isnumeric(inputs(1));
Two=isnumeric(inputs(2));
Three=isnumeric(inputs(3));
Four=isnumeric(inputs(4));
if letter == false
        errordlg('The function you entered is not in terms of "x".','Funtion Error')
        error('The function you entered is not in terms of "x".')
elseif LLB~=1 || One ~=1
        errordlg('Lower bound is not a single number.','Input Error')
        error('Lower bound is not a single number.')
elseif LUB~=1 || Two ~=1
        errordlg('Upper bound is not a single number.','Input Error')
        error('Upper bound is not a single number.')
elseif LER~=1 || Three ~=1
        errordlg('Max error is not a single number.','Input Error')
        error('Max error is not a single number.')
elseif LITER~=1 || Four ~=1 || iter_max<=0
    errordlg('Max interger is not a single, positive, number.','Input Error')
    error('Max interger is not a single number.')
end
XRold=0;
n=0;
flb=double(subs(fun,x,lb));
fub=double(subs(fun,x,ub));
check_root=flb*fub;
n_max=iter_max;
    if check_root>=0 %checks roots
        errordlg('Can not be sure that a root exist between the two bounds.','Root Error')
        error('Can not be sure that a root exist between the two bounds.')
    elseif err_max<=0 %checks error
        errordlg('The error tolerance is not positive!','Tolerance Error');
        error('The error tolerance is not positive!')
    
        
   end
while crun
    flb=double(subs(fun,x,lb)); %derrmins value at upper and lower bounds
    fub=double(subs(fun,x,ub));
    xr=(ub*flb-lb*fub)/(flb-fub);
    XRnew=xr;
    %ROOT(n+1)=xr; %take this out
    %XL(n+1)=lb; %take this out
    %XU(n+1)=ub; %take this out
    err=abs((XRnew-XRold)/(XRnew))*100;
    fxr=double(subs(fun,x,xr));
    if flb>=fub %makes sure upper bound it greater than the lower bound
        errordlg('The lower limit is either greater than or equal to the upper limit!','Limit Error');
        crun=false;
        e=-1;
    elseif check_root>=0 %insures a root is certain between the bounds
        e=-1;
        crun=false;
        errordlg('Can not be sure that a root exist between the two bounds.','Root Error')
    elseif isnumeric(flb)~=1 || isnumeric(fub)~=1   %ends code if a value is not a number. 
        crun=false;
        e=-2;
        errordlg('Invalid return value for function.','Return Error')
    
    elseif n==n_max %ends code if max number of iterations are run.
        errordlg('Max number of iterations hit before finding an acceptable root.','Iteration Error')
        crun=false;
        e=0;
    elseif flb*fub*fxr == 0
        crun=false;
        e=1;
        err=0;
        elseif err<=err_max; %code ends normally
        crun=false;
        e=1;
    elseif fxr<0 %replaces bounds
        lb=xr;
        XRold=XRnew;
    else
        ub=xr;
        XRold=XRnew;
       
    end
    n=n+1;
end %prepares to exit function
exitFlag=e;
root=xr;
numIter=n;
%Ignore after this 
%XT=[XU;XL;ROOT]
end

