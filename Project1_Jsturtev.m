%% Exercise 2.8
A = [0.02 0.06 0.1; 0 0.4 0.04; 0.18 0.01 0.1];
d = [200 180 175].';
Am = [1 0 0; 0 1 0; 0 0 1] - A;
AmI = inv(Am);
% a) The total production must be 249 product 1, 317 for product 2, and 248 
% of product 3
prod = AmI*d;
% b) If the demand of product 2 increases by 1, then product 3
% production should increase by 0.0757, and increase by 0.1515 if p2
% increases by 2, and decrease by 0.0757 if product 2 production decreases
% by 1.
increase_1 = AmI(2,3)
increase_2 = 2*increase_1
increase_neg1 = -1*increase_1
% c) 
AmI
%% Problem 2.10
M = [0.02 0 0.02 0.04; 0 0.01 0.05 0.04; 0.03 0 0.01 0.02; 0.02 0.05 0.01 0];
I_M = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] + M + M^2 + M^3 + M^5;
increase = I_M(1,1:4)
% Using the infinite approximation method cutting off at M^5, if the
% demand of product one increases by one, then product 2 must increase
% by 0.021, product 3 must increase by 0.021, and product 4 must increase
% by 0.0414
%% Problem 2.15
% a) The reason that this is viable is because it implies that one of
% product one requires more than one of product 2 to be made. This is fine
% because you can just make more product 2 to compensate. However, the
% previous question says that product one needs more than one product one
% to be made, which is impossible because you would run out of product one
% when trying to make product one. 
% b)
M = [0.06 1.02; 0.05 0.1]
I_M = [1 0; 0 1] - M
I_M_I = inv(I_M)
% c) The p that corresponds to the given demand is [370 243]
p = I_M_I*[100; 200]
% d) With the below calculations below, it is clear that the infinite sum
% converges
IPM = [1 0; 0 1] + M
IPM2 = IPM + M^2
IPM3 = IPM2 + M^3
IPM4 = IPM3 + M^4
IPM5 = IPM4 + M^5
IPM6 = IPM5 + M^6
IPM7 = IPM6 + M^7
IPM8 = IPM7 + M^8
%% Problem 3.9
% a)
p1 = [6 3 1].';
p2 = [4 1 1].';
p3 = [7 1 1].';
T = [1 0 -8; 0 1 -2; 0 0 1];
T_R = inv(T);
R = [cos(pi/3) -sin(pi/3) 0; sin(pi/3) cos(pi/3) 0; 0 0 1];
full = T_R*R*T;
p1_rot = full*p1
p2_rot = full*p2
p3_rot = full*p3
% The image of this rotation of pi/3 around (8,2) for (6, 3),(4, 1),(7, 1)
%would be (6.13, 0.77), (6.87, -1.96), (8.37, 0.63)
% b) picture is the center of rotation as a red 'o', the original points as
% blue 'x' and the rotation results as green 'x'
x = [6 4 7];
y = [3 1 1];
x_r = [6.13 6.87 8.37];
y_r = [0.77 -1.96 0.63];
figure(1)
plot(8, 2, 'ro')
xlim([3 10])
ylim([-2.5 4])
hold on
plot(x,y, 'bx')
plot(x_r,y_r, 'gx')
%% Problem 3.16
p1 = [0 3 1 1].';
p2 = [-6 3 1 1].';
p3 = [3 1 10 1].';
T = [1 0 0 2; 0 1 0 -3; 0 0 1 -6; 0 0 0 1];
R = [cos(7*pi/6) -sin(7*pi/6) 0 0; sin(7*pi/6) cos(7*pi/6) 0 0; 0 0 1 0; 0 0 0 1];
full = R*T;
p1_rot = full*p1
p2_rot = full*p2
p3_rot = full*p3
% The image of the shift by (2, -3,-6) followed by a rotation of 7pi/6 
% around the z-axis (8,2) for (0, 3, 1),(-6, 3, 1),(3, 1, 10)
% would be (-1.73, -1, -5), (3.46, 2, -5), (-5.33, -0.77, 4)
%% Problem 3.17
M = [1 0 0 0; 0 1 0 0; 0 0 0 00; 0 0 -1/10 1];
points = [1 -2 3; 2 3 2; 3 1 2; 1 1 1];
proj = M*points;
proj_1 = proj(1:2, 1)/(proj(4,1))
proj_2 = proj(1:2, 2)/(proj(4,2))
proj_3 = proj(1:2, 3)/(proj(4,3))
% The projections of points (1,2,3), (-2, 3,1), (3, 2, 2) onto the x-y
% plane from perspective z=10 results in (1.42, 2.56), (-2.22, 3.33),
% (3.75, 2.5)