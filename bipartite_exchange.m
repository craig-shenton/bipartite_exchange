%% 1.0 Bipartite Exchange Model

% consider a market consiting of (n) sellers and (m) buyers

n = 2; % number of sellers

m = n; % must have equal number of buyers and sellers

% We represent this market as G(U,V) = n x m bipartite graph, where U={1,2,..j}
% sellers and V={a,b,..i} buyers

% the adjacency matrix for G denotes where free trade is allowed (i.e., where
% g_ij = 1, free trade is permitted, g_ij = 0 otherwise)

G = [0 0 1 1;
     0 0 1 1;
     1 1 0 0;
     1 1 0 0];

% prices (p) are first set to (1/n) 

p = 1/n; % <---- note: make this a vector 

% utility (u) is set to 1 for each (n) seller

u(1:n) = 1;

% endownment of wheat (w) is set to 1 for each (n) seller

w(1:n) = 1;

% endownment of cash (e) is set to 1 for each (m) buyer

e(1:m) = 1;

%% 1.1 Optimal Trades

% trades in G are optimal if g_ij = max(u_ij / p_j)

% select A, a subset of the graph G, where edges are optimal trades

A = G/p; % find perfomance ratio for each edge in G

alpha = max(A); % find otimal perfomance ratio for each seller (j)

% set a_ij = 1, if edge is an optimal trade
for i = 1:length(A)
    
    A(i,:) = A(i,:) == alpha(i);

end

%% 1.2 Max-Flow

% add source and sink nodes to graph A

F = AddSrcAndSink2Graph(A,n,m); % see [AddSrcAndSink2Graph.m] function

F = full(F); % creates the flow graph F

% F =

%%%%%%%%%%%%% 
% [A        %
%    s      %
%      t];  %
%%%%%%%%%%%%%

% where s = source node, t = sink node

% bug: AddSrcAndSink2Graph.m connecting source node to 1,3 and sink node
% to 2,4. Need source to 1,2 and sink to 3,3.

% 1.2.1 add weights to source (p_j) and sink (e_i) nodes

% 1.2.2 calc min-cut


