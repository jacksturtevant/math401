%% Section 5.2 Example
A = [1 -1 1; 0 0 1; 1 1 1; 4 2 1];
At = A.';
A2 = At*A;
A2I = inv(A2);
Y = [2 0 2 3].';
AtY = At*Y;
res = A2I*AtY;
%% Problem 5.3
% part a
A = [1 -1 1; 0 0 1; 1 1 1; 9 3 1];
At = A.';
A2 = At*A;
A2I = inv(A2);
Y = [3 1 2 9].';
AtY = At*Y;
res = A2I*AtY
% part b
figure(1)
x=-4:0.1:4;
y=res(1)*x.^2+res(2)*x+res(3);
plot(x,y)
hold on
x1 =[-1 0 1 3];
plot(x1, Y, 'o')
% part c
syms s
eqn = 1.0455*s^2 -0.5545*s + 1.2909 == 10.0;
vpasolve(eqn)
%% Problem 5.4
% part a
A = [exp(-2) 1; 1 1; exp(4) 1];
At = A.';
A2 = At*A;
A2I = inv(A2);
Y = [0 3 4].';
AtY = At*Y;
res = A2I*AtY
% part b
figure(2)
x=-4:0.1:4;
y=res(1)*exp(x)+res(2);
plot(x,y)
hold on
x1 =[-2 0 4];
plot(x1, Y, 'o')
% part c
syms s
eqn = res(1)*exp(s) + res(2);
diff_eq = diff(eqn);
vpa(subs(diff_eq, s, 1))