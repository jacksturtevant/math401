%% 4.1
A = [1 2 3; -1 0 2; 5 1 1; 2 2 0];
b = [1 2 3 4]
x =inv(A'*A)*A'*b.'
l = norm(A*x-b)

%% 4.3
A = [1 3; 2 3; -1 0; 0 3];
b = [0 0 0 1]
x =inv(A'*A)*A'*b.'
l = norm(A*x-b)

A * x

%% 4.10
c1 = [1 -1 0];
c2 = [2 1 3];

proj = ((c1 * c2.')*c1)/(norm(c1)^2);

diff = c2 - proj;
diff*c1.';

b = [1 3 0];
proj_b1 = ((c1 * b.')*c1)/(norm(c1)^2);
proj_b2 = ((diff * b.')*diff)/(norm(diff)^2);

proj_b = proj_b1+proj_b2;

A= [1 2; -1 1; 0 3];
b_hat = proj_b.';

% solution of x for part a
x = linsolve(A, b_hat)
% solution of x for part b
x_e = inv(A.'*A)*A.'*b.'

% difference between solutions using method a and method b
x-x_e

A * x;
A * x_e;
