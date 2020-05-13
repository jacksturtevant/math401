%% Problem 11.2
% a)
A = ones(5) - [0 1 0 1 0; 0 1 0 1 0; 0 0 0.5 0 0; 1 0 0 0 1; 0 1 1 1 0]
figure(1)
imshow(A,'border','tight','InitialMagnification',1000)
% b)
[U, S, V] = svd(A)
% c)
[U,S,V] = svd(A);
% 4 singular values
SP = S;
SP(5,5)=0;
AP1 = A*SP*transpose(V)
figure(2)
imshow(AP1,'border','tight','InitialMagnification',1000)
% 3 singular values
SP(4,4)=0;
AP2 = A*SP*transpose(V)
figure(3)
imshow(AP2,'border','tight','InitialMagnification',1000)
% 2 singular values
SP(3,3)=0;
AP3 = A*SP*transpose(V)
figure(4)
imshow(AP3,'border','tight','InitialMagnification',1000)
% 1 singular value
SP(2,2)=0;
AP4 = A*SP*transpose(V)
figure(5)
imshow(AP4,'border','tight','InitialMagnification',1000)
%% Problem 11.3
% a)
A = imread('naddpod.jpeg');
A = rgb2gray(A);A = double(A);A = A-min(A(:));A = A/max(A(:));
figure(1)
imshow(A,'border','tight');
% b)
[U,S,V] = svd(A);
% c) There are 300 singular values for this image
% d)
figure(2)
SP = S;for i=[225:300];SP(i,i)=0;end;
AP = U*SP*transpose(V);
imshow(AP,'border','tight');
% e)
figure(3)
SP = S;for i=[150:300];SP(i,i)=0;end;
AP = U*SP*transpose(V);
imshow(AP,'border','tight');
% f)
figure(3)
SP = S;for i=[75:300];SP(i,i)=0;end;
AP = U*SP*transpose(V);
imshow(AP,'border','tight');
% g) In order to achieve 99.9% image variance, 152 singular values are
% needed. This gives a compression of 1.013 (so there is actually more data
% using a 99.9% image variance than using the normal image)
svals = diag(S);
k = 152
vpa(sum(svals(1:k).^2)/sum(svals.^2),6)
compression = (2.0*k)/300.0
figure(4)
SP = S;for i=[k:300];SP(i,i)=0;end;
AP = U*SP*transpose(V);
imshow(AP,'border','tight');
%% 12.1
plus = [1 0 1; 0 0 0; 1 0 1];
plus = reshape(plus, [9 1])
cross = [0 1 0; 1 0 1; 0 1 0];
cross = reshape(cross, [9 1])
a = [1 1 0; 1 0 1; 0 1 0];
a = reshape(a, [9 1])
b = [0 1 0; 1 0 1; 1 0 1];
b = reshape(b, [9 1]);
c = [1 0 1; 0 0 1; 1 1 0];
c = reshape(c, [9 1]);
d = [1 1 1; 0 0 0; 1 0 1];
d = reshape(d, [9 1]);
% The first is closer to the x character
norm(a - plus)
norm(a - cross)
% The second is equally close to both characters
norm(b - plus)
norm(b - cross)
% The third is closer to the + character
norm(c - plus)
norm(c - cross)
% The fourth is closer to the + character
norm(d - plus)
norm(d - cross)
%% 12.5
O1 = [0 0 1; 0 1 0; 0 0 0];
O1 = reshape(O1, [9 1]);
O2 = [0.5 0 0; 0 1 0; 0 0 0];
O2 = reshape(O2, [9 1]);
O3 = [0 0 0; 0 1 0; 0 0.5 0];
O3 = reshape(O3, [9 1]);
O4 = [0.5 0 0; 0.5 1 0; 0 0.5 0];
O4 = reshape(O4, [9 1]);
O = [O1 O2 O3 O4];
[UO, SO, VO] = svd(O);
BO = UO(:, 1:2)
J1 = [0 0 0; 0.5 1 0; 0 0 0];
J1 = reshape(J1, [9 1]);
J2 = [0 0 0; 1 1 0; 1 0 0];
J2 = reshape(J2, [9 1]);
J3 = [1 0 0; 1 1 0; 0 0 0];
J3 = reshape(J3, [9 1]);
J4 = [0 0 0; 1 0 1; 0 0 1];
J4 = reshape(J4, [9 1]);
J = [J1 J2 J3 J4];
[UJ, SJ, VJ] = svd(J);
BJ = UJ(:, 1:2)
U1 = [0 0 0; 0 1 0; 0 0 0];
U1 = reshape(U1, [9 1]);
U2 = [0 0 0.5; 0.5 0 1; 0 0 0.5];
U2 = reshape(U2, [9 1]);
% The first character is closer to the 'O' basis, whereas the second is
% closer to the 'J' basis
norm(U1 - BO*BO.'*U1)
norm(U1 - BJ*BJ.'*U1)
norm(U2 - BO*BO.'*U2)
norm(U2 - BJ*BJ.'*U2)
%% 12.6
C1 = [0.5 0 0; 0.5 0 1; 0.5 0 0];
C1 = reshape(C1, [9 1]);
C2 = [0 0 0; 0 1 1; 0 0 0];
C2 = reshape(C2, [9 1]);
C3 = [0.5 0 0; 0 1 1; 0.5 0 0];
C3 = reshape(C3, [9 1]);
C4 = [0 0 0; 0 1 1; 0.5 0 0];
C4 = reshape(C4, [9 1]);
C = [C1 C2 C3 C4];
[UC, SC, VC] = svd(C);
BC = UC(:, 1:2)
L1 = [0 1 1; 0 1 1; 0.5 0 0];
L1 = reshape(L1, [9 1]);
L2 = [0.5 1 1; 0 1 1; 0 0 1];
L2 = reshape(L2, [9 1]);
L3 = [0 0.5 1; 0 0.5 1; 0 0 0.5];
L3 = reshape(L3, [9 1]);
L4 = [1 1 1; 0 1 1; 0 0 0.5];
L4 = reshape(L4, [9 1]);
L = [L1 L2 L3 L4];
[UL, SL, VL] = svd(L);
BL = UL(:, 1:2)
U1 = [0 0 1; 0 1 1; 0 0 0];
U1 = reshape(U1, [9 1]);
U2 = [0 0.5 0; 0 0.5 1; 0 0 0];
U2 = reshape(U2, [9 1]);
% The first character is closer to the 'C' basis, whereas the second is
% closer to the 'L' basis
norm(U1 - BL*BL.'*U1)
norm(U1 - BC*BC.'*U1)
norm(U2 - BL*BL.'*U2)
norm(U2 - BC*BC.'*U2)
%% 13.1
A = createadjacency([1 2; 2 3; 3 4; 1 3], 4)
% a) There are 3 walks of length 3 from vertex 1 to vertex 3
A3=A^3;
A3(1, 3)
% b) There are 790748 walks of length 20 from vertex 2 to vertex 4
A20 = A^20;
A20(2, 4)
% c)
% Intuitively, there are only 3 possible walks of length 3 from vertex 4,
% none of which end at vertex four. There is 3-4-3. 3-2-1, and 3-1-2 (these
% are listed by destination after making a walk of length 1.
%% 13.2
A = createadjacency([1 2; 2 3; 3 4; 1 4; 3 5], 5)
% a) There are 4 walks of length 3 from vertex 1 to vertex 2
A3=A^3;
A3(1, 2)
% b) There are 853 walks of length 10 from vertex 2 to vertex 4
A10 = A^10;
A10(2, 4)
% c)
% First, it is easy to see that there are only odd number walks from vertex
% 3 to vertex five. This is obvious because it takes one walk to get from
% vertex 3 to 5, and any way of starting at 3 and getting back to 3 to make
% the walk from 3 to 5 takes an even amount of walks. Next, for the odd
% numbered walks, there are full walks of size 1, 3, and 5 that go from 3
% to 5, and after these numbers, (7,9,...) the walks will be combinations
% of these walks, so the number will grow exponentially. 
for k = 1:9
    A_temp = A^k;
    A_temp(3,5)
end
% d)
% First, there are only even number walks from vertex
% 2 to vertex 4. This is obvious because it takes two walks to get from
% vertex 2 to 4 by going through 1 or 3. After this point, a number of 
% doubling back (e.g 2-1-4-1-4) will allow you to go from 2 to four. As the
% walk length increases, the double backs, and detours going from 3 to 5
% and back, can be permutated causing exponential growth again.
for k = 1:9
    A_temp = A^k;
    A_temp(2,4)
end
%% 13.5
% a)
% Intuitively, I would cut the 2-3 and 3-4 edge, or the 2-3 and 1-4 edge,
% or the 1-2 and 3-4 edge
L = createlaplacian([1 2; 2 3; 3 4; 1 4; 3 5], 5)
[V, D] = eig(L)
V(1:5, 2)
% b) The fiedler Method would make cuts at 2-3 and 3-4
% c) The results match on one possible cut, the Fielder method does not
% account for all possible cuts that creat a 2-3 split