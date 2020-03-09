%% 2.14
% a) The reason that this is not viable is because it implies that one of
% product one requires more than one of product one to be made. This is fine
% because you can just make more product 2 to compensate. This is 
% impossible because you would run out of product one when trying to make 
% product one. 
% b)
M = [1.02 0.06; 0.05 0.1]
I_M = [1 0; 0 1] - M
I_M_I = inv(I_M)
% c) The infinite sum approach assumes that the internal demand of the
% system can be met. However, this is not true in this case, so this rule
% does not apply. Also, the chapter clearly states that the property this
% rule is based on, (I-M)^-1= I + M + M^2 + ... only works for special
% cases of square matrices, and this is not one of those special matrices.
% The follwing calculations clearly show the infinite sum does not converge
% 
IPM = [1 0; 0 1] + M
IPM2 = IPM + M^2
IPM3 = IPM2 + M^3
IPM4 = IPM3 + M^4
IPM5 = IPM4 + M^5
IPM6 = IPM5 + M^6
IPM7 = IPM6 + M^7
IPM8 = IPM7 + M^8
%% 3.28
M_10 = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 -1/10 1];
M_100 = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 -1/100 1];
M_1000 = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 -1/1000 1];
M_1000000 = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 -1/1000000 1];
syms x y z
points = [x y z 1].';


proj = M_10*points;
proj_1_10 = proj(1:2, 1)/(proj(4,1))

proj = M_100*points;
proj_1_100 = proj(1:2, 1)/(proj(4,1))

proj = M_1000*points;
proj_1_1000 = proj(1:2, 1)/(proj(4,1))

proj = M_1000000*points;
proj_1_1000000 = proj(1:2, 1)/(proj(4,1))

proj = M_INF*points;
% a) as P->inf, the fraction -1/z->0, so the matrix below would be the
% projection matrix. This is the matrix mentioned earlier that provides [x
% y 0 1].', which makes sense because as the viewing point gets further
% away, it looks more like whatever is viewed is a 2D object (relative Z
% distances of projected object are insignificant compared to viewing 
% distance)
M_INF = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 1];
% b) P->INF*[x y z 1].' = [x y 0 1], as expected
proj_1_INF = proj(1:2, 1)/(proj(4,1))
%% 5.10
% a & b use example where n = 10, essentially there will just be an extra
% row in the A matrix of [3 1] and row in the Y matrix of [2] for each
% value of n beyond 10 (and 1 less if n<10)
n = 10
A = [1 2 3*ones(n,1).'; ones(n+2,1).'].';
Y = [1 1 2*ones(n,1).'].';
At = A.';
A2 = At*A;
A2_inv = inv(A2);
At_Y = At*Y;
res = A2_inv*At_Y
% c & d) as n->INF, res -> [0.6, 0.2]. This gives 3*1.8 + 0.2 = 2, 
% as expected. This makes sense because as more points of the same value 
% are added to the data, the error when guessing a line through that point 
% will shrink. at n->INF, the first to data points are irrelevant with 
% respect to the points at (3,2), so there should just be a line through 
% there. 
%% 6.10
% a)
A = [1 -1 0; 0 1 -1; 1 0 -1]; 
At = A.';
r = [3 2 2].';
r_adj = At*r;
A_adj = At*A;
M = [A_adj(1, 1:3); A_adj(2, 1:3); 1 1 1];
r_hat = [r_adj(1, 1); r_adj(2, 1); 0];
ranks = inv(M)*r_hat
% b)
A = [1 -1 0; 0 1 -1; 1 0 -1; 1 0 -1]; 
At = A.';
r = [3 2 1 1].';
r_adj = At*r;
A_adj = At*A;

M = [A_adj(1, 1:3); A_adj(2, 1:3); 1 1 1];
r_hat = [r_adj(1, 1); r_adj(2, 1); 0];
ranks = inv(M)*r_hat
% c) Based on these results, it is better for your ranking to win at once
% by 2 points than it is to win twice by one point.
%% 7.10
% a)
T = [0.8 0.05 0; 0.12 0.9 0.25; 0.08 0.05 0.75];
% b) T not being symmetric means that the population is moving out of some
% areas faster than people are moving in, and vice versa.
% c)
x = [0.6 0.2 0.2].';
T_1 = T*x
T_2 = T*T_1
% d)
e = eig(T)
[V, D] = eig(T)
steady = V(1:3,  1)/sum(V(1:3,1))
% f) for k = 28, T^k*x will be the same as steady state to 4 decimal places
k = 28;
power = T;
for i = 1:k
    power = T*power;
end
res = (power*x - steady)*(10^4)


