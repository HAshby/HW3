%extra to be used later 
 xl=3;
 xu=3;
% if xl>=xu
%     errordlg('The lower limit is either greater than or equal to the upper limit!','Limit Error');
% end
xl<=xu;
run=true; 
syms x
f=3*x;
x=5;
subs(f,x)
