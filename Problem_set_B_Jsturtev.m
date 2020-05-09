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