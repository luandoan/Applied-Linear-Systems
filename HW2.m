% Luan Cong Doan - ME5554 - Applied Linear System - Homework 2
close all;
clear all;
clc;


A = [0 -5; 1 -2];   % state space matrix
B = [0; 1];     % input matrix
C = [1 0];      % output matrix
D = 0;          % direct transmission matrix

x0 = [1;-1];   % initial condition;
syms t s;

T = linspace(0,5,10);    % time vector
phi = zeros(2,2,10);    % create temperate matrix
for i = 1:10
    phi(:,:,i) = expm(A*T(i));
end

phi11 = zeros(10,1);
phi12 = zeros(10,1);
phi21 = zeros(10,1);
phi22 = zeros(10,1);

for i = 1:10
    phi11(i) = phi(1,1,i);
    phi12(i) = phi(1,2,i);
    phi21(i) = phi(2,1,i);
    phi22(i) = phi(2,2,i);
end

% Part 2b and 2c
syms a b c d t;
A = [a b;c d];

PB1 = expm(A*t);

A(1,1) = 0; A(1,2) = -5;
A(2,1) = 1; A(2,2) = -2;       % numerical elements in matrix A
PB = expm(A*t);                 % re-calculate 
T = linspace(0,5,10);           % time vector

p11 = PB(1,1);
p12 = PB(1,2);
p21 = PB(2,1);
p22 = PB(2,2);

for i = 1:10
    PB11(i) = double(subs(p11,{t},T(i)));
    PB12(i) = double(subs(p12,{t},T(i)));
    PB21(i) = double(subs(p21,{t},T(i)));
    PB22(i) = double(subs(p22,{t},T(i)));
end

% part 2d and 2e
syms s t;
R = s*eye(2) - A;
RI = inv(R);
PD = ilaplace(RI);

T = linspace(0,5,10);   % time vector

for i = 1:10
    PD11(i) = double(subs(PD(1,1),{t},T(i)));
    PD12(i) = double(subs(PD(1,2),{t},T(i)));
    PD21(i) = double(subs(PD(2,1),{t},T(i)));
    PD22(i) = double(subs(PD(2,2),{t},T(i)));
end

% plot and comparison
figure;
subplot(3,1,1);
plot(T,phi11);
xlabel('time T');
ylabel('A_{11}');
title('Numerical Represent - 2a');
subplot(3,1,2);
plot(T,PB11,'r');
xlabel('time T');
ylabel('B_{11}');
title('Numerical Represent - 2c');
subplot(3,1,3);
plot(T,PD11,'g');
xlabel('time T');
ylabel('D_{11}');
title('Numerical Represent - 2e');

figure;
subplot(3,1,1);
plot(T,phi12);
title('Numerical Representation - 2a');
xlabel('time T');
ylabel('A_{12}');
subplot(3,1,2);
plot(T,PB12,'r');
title('Numerical Representation - 2b');
xlabel('time T');
ylabel('B_{12}');
subplot(3,1,3);
plot(T,PD12,'g');
title('Numerical Representation - 2d');
xlabel('time T');
ylabel('D_{12}');

figure;
subplot(3,1,1);
plot(T,phi21);
title('Numerical Representation - 2a');
xlabel('time T');
ylabel('A_{21}');
subplot(3,1,2);
plot(T,PB21,'r');
title('Numerical Representation - 2b');
xlabel('time T');
ylabel('B_{21}');
subplot(3,1,3);
plot(T,PD21,'g');
title('Numerical Representation - 2d');
xlabel('time T');
ylabel('D_{21}');

figure;
subplot(3,1,1);
plot(T,phi22);
title('Numerical Representation - 2a');
xlabel('time T');
ylabel('A_{22}');
subplot(3,1,2);
plot(T,PB22,'r');
title('Numerical Representation - 2b');
xlabel('time T');
ylabel('B_{22}');
subplot(3,1,3);
plot(T,PD22,'g');
title('Numerical Representation - 2d');
xlabel('time T');
ylabel('D_{22}');
plot(T,PD21,'g');
title('Numerical Representation - 2d');
xlabel('time T');
ylabel('D_{21}');

% Part 3 with initial value x0 + assume that u(t) = 0
x_t = PB*x0;
for i = 1:10
    x_t11(i) = double(subs(x_t(1,1),{t},T(i)));
    x_t21(i) = double(subs(x_t(2,1),{t},T(i)));
end
figure;
plot(T,x_t11,T,x_t21,'r');
xlabel('time T');
ylabel('X(t)');
title('State Trajectory');
legend('x_1','x_2');
