% ME 5554 - Applied Linear Systems - On class matlab;

close all;
clear all;
clc;

% Example 1 - Sep 17, 2015
A = [0 -5; 1 -2];
syms t s;
whos % test current variables and inputs
phi1 = expm(A*t);
p11 = phi1(1,1);
p12 = phi1(1,2);
p13 = phi1(2,1);
p14 = phi1(2,2);
T = linspace(0,5,100);

for i = 1:100,
    P11(i) = double(subs(p11,{t},T(i)));
    P12(i) = double(subs(p12,{t},T(i)));
    P13(i) = double(subs(p13,{t},T(i)));
    P14(i) = double(subs(p14,{t},T(i)));
end
plot(T,P11,T,P12,'r',T,P13,'b',T,P14,'g');
legend('\phi_{11}','\phi_{12}','\phi_{13}','\phi_{14}');
xlabel('time');
ylabel('\phi');
title('Numerical Representation - HW 2a');
grid on;

R = s*eye(2) - A;

RI = inv(R);

phi2 = ilaplace(RI);





    