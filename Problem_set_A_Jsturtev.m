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

