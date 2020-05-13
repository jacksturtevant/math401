function M = genmatrixfromfragment(v,m)
% Generates the matrix M_m from the key fragment vector v.
% Note that the length of v must be >= 2m-1.
% Usage:
% >> genmatrixfromfragment([1;0;1;1;0;1;1;1;1;0;1;1;0],3)
% ans =
% 1 0 1
% 0 1 1
% 1 1 0
M = [];for i=1:m;M=[M v(i:i+m-1)];end;
end