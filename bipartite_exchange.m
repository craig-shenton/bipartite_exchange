
% B = n buyers
% S = m sellers

% B_{i} has 1 cash
% S_{j} has 1 wheat

% A = bipartite adjacency matrix
% a_{ij} = 1 if B_{i} can trade with S_{j}

% u^b = (u^{b}_{1}, u^{b}_{2},...,u^{b}_{n}) buyer utility functions
% u^s = (u^{s}_{1}, u^{s}_{2},...,u^{s}_{n}) seller utility functions

% x^s_j = seller exchange rate (price) in cash per unit wheat
% x^b_i = buyer exchange rate (price) in wheat per unit cash

% w_ij = amount of wheat from i to j (link weight)

%% graph adjacency matrix %%

% A = -------------
%     | a_11 a_12 |
%     | a_21 a_22 |
%     -------------

A = [0 1; 1 0]; 
% gives two nodes buyer i and seller j connected via edges a_{12} and a_{21}

%% endownments %%

% vectors = [i j]

wheat = [0 1]; % amount of wheat at start of turn

cash = [1 0]; % amount of cash at start of turn

utility_wheat = [1 0];

utility_cash = [0 1];

X = []; % trade matrix at end of turn

