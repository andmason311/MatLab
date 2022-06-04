function[] = HW05Problem4()
%x1=A1 to C1
%x1=A1 to C2
%x1=A1 to C3
%x1=A2 to C1
%x1=A2 to C2
%x1=A2 to C3

%55x1+90x2+105x3+55x4+85x5+120x6 %x1+x2+x3<=.5
%65x1+100x2+115x3+55x4+85x5+120x6 %x1+x2+x3>.5

% x1+x2+x3<=1.6
% x4+x5+x6<=.8
% x1+x4>=.9
% x2+x6>=.7
% x3+x6>=.6
% x1,x2,x3,x4,x5,x6>=0

x1=.8;
x2=0;
x3=.3;
x4=.1;
x5=.7;
x6=0;

a = [1 1 1 0 0 0; 0 0 0 1 1 1; -1 0 0 -1 0 0; 0 -1 0 0 -1 0; 0 0 -1 0 0 -1];
b = [1.6; 0.8;-0.9;-0.7;-0.3];
x0= [2, 2, 2, 2, 2, 2];
aHold=[];
bHold=[];
bm =[0, 0, 0, 0, 0, 0];
c = fmincon(@HW05Problem4a, x0, a, b, aHold, bHold, bm);
disp(c);
cost= feval(@HW05Problem4a, c);
sprintf('The minimized cost is $%.2f.',cost)