%% 1.0 Bipartite Exchange Model

% consider a market consiting of (n) sellers and (m) buyers

% We represent this market as G(U,V) = n x m bipartite graph, where U={1,2,..j}
% sellers and V={a,b,..i} buyers

% the adjacency matrix for G denotes where free trade is allowed (i.e., where
% g_ij = 1, free trade is permitted, g_ij = 0 otherwise)

% input = adjacency matrix for G

G = [0 0 1 1 0 0;
     0 0 1 1 0 0;
     1 1 0 0 0 0;
     1 1 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 0;];
 
test_1 = issymmetric(G); % test to see if G is symmetric

if test_1 == 0
   error('Error. Graph must be symmetric.')
end
 
[rows,cols]=size(G);
 
n = rows/2; % number of (n) sellers

m = n; % must have equal number of buyers and sellers

% prices (p) are first set to (1/n) 

p = 1/n; % <---- note: make this a vector 

% utility (u) is set to 1 for each (n) seller

u(1:n) = 1;

% endownment of wheat (w) is set to 1 for each (n) seller

w(1:n) = 1;

% endownment of cash (e) is set to 1 for each (m) buyer

e(1:m) = 1;

%% 2.0 Optimal Trades

A = optimal_trades(G,p);

%% 3.0 Max-Flow

% add source and sink nodes to graph A, such that F =

%%%%%%%%%%%%% 
% [A        %
%    s      %
%      t];  %
%%%%%%%%%%%%%

% where s = source node, t = sink node

% source: (http://www.mathworks.com/matlabcentral/fileexchange/46227-seam-carvin
% g-with-dijkstra-and-dynamic-programming/content/AddSrcAndSink2Graph.m)

start_nodes = 1:n; % first col of sellers
end_nodes   = n+1:n+m; % last col of buyers

[ii,jj,s] = find(A); % disect current graph
[mG,nG] = size(A); % find hight and width of A

%adding source node
ii_src = (n+m+1)*ones(m, 1); % s -> first col
jj_src = start_nodes';
s_src  = ones(m,1); %equal oppurtunity for entire row

%adding sink node
ii_trg = end_nodes';
jj_trg = (n+m+2)*ones(m, 1); % last col -> t
s_trg  = ones(m,1); %equal oppurtunity for entire row

%resemble Graph with source and sink
F = sparse([ii;ii_src;ii_trg], ...
    [jj;jj_src;jj_trg], [s;s_src;s_trg], mG+2, nG+2);

F = full(F); % creates the flow graph F

% 3.1 add weights to source (p_j) and sink (e_i) nodes

%% 4.0 Primal-Dual Algorithm

% 4.1 calc min-cut

% 4.2 freeze any tight set

% 4.3 increase prices in active subgraph 


