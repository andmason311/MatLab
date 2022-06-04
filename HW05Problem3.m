function[] = HW05Problem3()
syms x %y
% f1=x==0
% f2=y==0
% f3=x*70+y*31-6000
% f4=x*6+y*9-2400
% f5=x*24+y*60-12000
% f6=x+.7*y %maximize 


f2=0;
f3=6000/31-x.*70/31;
f4=2400/9-x.*6/9;
f5=12000/60-x.*24/60;
x=0:1:40;
plot(x,f2,x,f3,x,f4,x,f5);