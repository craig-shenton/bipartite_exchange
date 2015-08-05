
function [ G ] = optimal_trades( G, p )

% optimal_trades - A

% INPUT: 
% G - adgacency matrix
% p - prices

% trades in G are optimal if g_ij = max(u_ij / p_j)

% select A, a subset of the graph G, where edges are optimal trades

A = G/p; % find perfomance ratio for each edge in G

alpha = max(A); % find otimal perfomance ratio for each seller (j) 

% alpha <------ test if row/col all zeros !!!

% set a_ij = 1, if edge is an optimal trade
 for i = 1:length(A)
    
  A(i,:) = A(i,:) == alpha(i);

 end

end