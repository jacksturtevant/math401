%% Problem 8.2
% A)
% Just by looking at this mini-internet, it seems that the pages should be 
% ranked as follows, first being highest rank, last being lowest rank
% P6
% P4
% P2
% P1
% P3/P5
% B)
links = [3,2; 2,1; 2,6; 2,4; 1,6; 6,4; 5,6];
PM = creategpmatrix(links, 6);
[V, D] = eig(PM)
ranks = V(1:6, 1)
% C)
% The only disparity between my original guess and the actual answer are
% the ranks for P4 and P6. I guessed P6 would be ranked higher because it
% has more incoming links, but after seeing the answer, these links are 
% from pages that are less important than the two pages linking to P4

%% Problem 8.3
% A) Find one that doesn't converge
% This question is simple, just find a markov chain that does not converge
% the most trivial example is the one below, where at each stage 100% of
% the web surfers will switch to the other page. The steady state for this
% would be 50-50, but this is only acheived if the initial surfers are 
% split 50-50. Essentially this has 2 pages pointing to each other
PM = [0 1; 1 0]
[V, D] = eig(PM)
ranks = V(1:2, 2)
% B) Find one that converges oddly
% For this problem, it is quite simple. There should be 3 pages, 1, 2 and 3
% Pages 1 and 3 link to page 2. Page 2 links to page 3. This will give page
% 1 a rank of zero, as seen below
PM = [0 0 0; 1 0 1; 0 1 0];
[V, D] = eig(PM);
ranks = V(1:3, 1)
%% Problem 8.8
links = [1, 2; 1,5; 1,10; 2,5; 2,1; 3,5; 4,7; 4,9; 5,7; 5,4; 6,9; 7,10; 7,3;
    8,3; 8,2; 9,8; 9,1; 10,1; 10,3]
PM = creategpmatrix(links, 10);
[V, D] = eig(PM);
ranks = V(1:10, 1)
% So, the ranks are, from highest to lowest: 
% P5, P7, P3, P1, P10, P4, P9, P2, P8, P6
%% Problem 9.1a
A = [1.0, 2.0, -3.0; 0 1.0 1.0; 1.0 2.0 5.0; -1.0 0 2.0];
AAT = A*A';
ATA = A.'*A;
[U, E1] = eig(AAT)
% For some reason, the sign of this column is the opposite of what it
% should be, which breaks the SVD
U(1:4,2) = -U(1:4,2)
% Have to reposition 0 to be at the end
U = U(:, [2 3 4 1])
[V, E2] = eig(ATA)
Sigma = sqrt(E2);
Sigma = [Sigma; 0 0 0]
[X, Y, Z] = svd(A)
% Check
A_check = U*Sigma*V.'
A_check = X*Y*Z.'
%% 10.1 
% The greatest variance for these points is along the line with slope 
% -0.8225/-0.5688
A = [1 4 -1 -5; 2 3 -3 -8]
[U, S, V] = svd(A)
direction = U(1:2,1)
%% 10.3b
% For this data set, the most variance is along the axis given by
% [-0.0887, -0.0871, -0.5817, -0.5964, -0.5389]
% which gives a variance of 946.27, which is 98.8% of the total variance
A = [0 1.0 1.0 2.0 2.0; 1.0 2.0 2.0 0 1.0; 7.0 8.0 8.0 8.0 9.0; 8.0 9.0 9.0 8.0 7.0; 7.0 7.0 7.0 9.0 7.0]
[U, S, V] = svd(A)
direction = U(1:5,1)
variance = S(1,1)^2
percent_variance = S(1,1)^2/(S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2+S(5,5)^2)
%% 10.6
% In order to capture at least 95% of the total variance, four singular
% values must be used in the matrix reconstruction
A = [1 0 1 1 0 1 1; 0 1 1 0 1 1 0; 1 0 0 1 0 0 1; 0 0 1 1 1 0 1; 0 1 1 0 0 1 0; 1 1 0 1 1 1 1; 0 1 0 1 0 1 0; 1 0 1 1 1 0 1]
[U, S, V] = svd(A)
var_1 = S(1,1)^2/(S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2+S(5,5)^2+S(6,6)^2+S(7,7)^2)
var_1 = (S(1,1)^2+S(2,2)^2)/(S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2+S(5,5)^2+S(6,6)^2+S(7,7)^2)
var_1 = (S(1,1)^2+S(2,2)^2+S(3,3)^2)/(S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2+S(5,5)^2+S(6,6)^2+S(7,7)^2)
var_1 = (S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2)/(S(1,1)^2+S(2,2)^2+S(3,3)^2+S(4,4)^2+S(5,5)^2+S(6,6)^2+S(7,7)^2)
SP = S;
SP(5,5) = 0;
SP(6,6) = 0;
SP(7,7) = 0;
A_mod = U*SP*V.'
%% 10.7
% a
A = [2 -0.1 5.9 2.3 2.9 -5.1 1.9 3.6; 3.2 4.8 -2.2 5.5 0.9 -1.7 3.0 3.6; 17.0 13.0 1.5 21.0 3.7 -18 15 15]
[U, S, V] = svd(A)
x1 = U(1:3, 1)
x2 = U(1:3, 2)
normal = cross(x1,x2)
SP = S;
SP(3,3) = 0;
A_mod = U*SP*V.'
P1 = A_mod(1:3, 1)
syms x y z
P = [x,y,z].'
eq = dot(normal, P-P1)
% The equation for this plane would be 
% 0.44x + 0.8605y + 0.2567z = 0
x = (3963393977600653)/9007199254740992.0
y = (7750905772421713)/9007199254740992.0
z = (2311840457290543)/9007199254740992.0
b = 131392781922061/2535301200456458802993406410752.0
z_val = 0 - x*10 - y*-3
% given x=10, y=-3, we would have z = -1.81

