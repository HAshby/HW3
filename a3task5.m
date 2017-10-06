%This code runs a3task_GE.m
close ALL;
clear ALL;
clc;
A=[12 -6 3 8 3 ; 8 17 -2 9 4 ; -4 8 19 -5 -3 ; -2 5 4 17 -3 ; 7 3 8 -2 11];
b=[21;12;40;-28;20];
solnVec=a3task_GE(A,b);
