function m = creategpmatrix(links,pagecount)
% Usage:
% links = [1,2;1,3;2,3;3,4;4,3];
% pagecount = 4;
% creategpmatrix(links,pagecount)
part1 = ones(pagecount,pagecount);
part2 = zeros(pagecount,pagecount);
linksize = size(links);
numlinks = linksize(1);
for i = [1:numlinks]
part2(links(i,2),links(i,1)) = 1;
end
for i = [1:pagecount]
if (sum(part2(:,i)) > 0)
part2(:,i) = part2(:,i)/sum(part2(:,i));
else
part2(:,i) = ones(pagecount,1)/pagecount;
end
end
m = 0.15/pagecount*part1 + 0.85*part2;
end