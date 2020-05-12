function M = createadjacency(v,n)
% Create the Adjacency Matrix for a graph.
% Usage:
% createadjacency([1,2;2,3;1;4],5)
% Will create a graph with 5 vertices
% and edges joining 1-2, 2-3 and 1-4.
M = zeros(n,n);
for i = 1:length(v)
M(v(i,1),v(i,2)) = 1;
M(v(i,2),v(i,1)) = 1;
end
end
