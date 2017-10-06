%test 2
clc
clear 
syms x y
fun=3*sin(1/4*pi*x);
lb=-2;
ub=3;
err_max=.00001;
iter_max=20;
[ xr,n ] = a3root_bisection( fun,lb,ub,err_max  );
[ Root, err,numIter, exitFlag ] = a3root_falseposition( fun, lb, ub, err_max, iter_max );
B=table(xr,n);
A=table(Root,err,numIter,exitFlag);
display(B)
display(A)