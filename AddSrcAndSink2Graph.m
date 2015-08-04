function [ A ] = AddSrcAndSink2Graph( A, n, m )

% source: (http://www.mathworks.com/matlabcentral/fileexchange/46227-seam-carvin
% g-with-dijkstra-and-dynamic-programming/content/AddSrcAndSink2Graph.m)

StartNodes = 1:n:n*m; % Top rows
EndNodes   = n:n:n*m; % Bottom row

%%%%%%%%%%%% 
% [A    
%    s 
%      t];
%%%%%%%%%%%%

[ii,jj,s] = find(A); % disect current graph
[mG,nG] = size(A);

%adding source
ii_src = (n*m+1)*ones(m, 1); %s -> top row
jj_src = StartNodes';
s_src  = ones(m,1); %equal oppurtunity for entire row
%adding sink
ii_trg = EndNodes';
jj_trg = (n*m+2)*ones(m, 1); %bottom row -> t
s_trg  = ones(m,1); %equal oppurtunity for entire row

%resemble Graph with source and sink
A = sparse([ii;ii_src;ii_trg], ...
    [jj;jj_src;jj_trg], [s;s_src;s_trg], mG+2, nG+2);

end