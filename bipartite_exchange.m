
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
%     | 0    a_12 |
%     | a_21 0    |
%     -------------
%
% gives two nodes buyer i and seller j connected via edges a_{12} and a_{21}

A = [0 1; 1 0];

n = length(A); 

%% endownments %%

% vectors = agents [i j]

wheat = [0 1]; % amount of wheat at start of turn

cash = [1 0]; % amount of cash at start of turn

utility_wheat = [1 0]; % willing to exhange wheat for n units of cash

utility_cash = [0 1]; % willing to exhange cash for n units of wheat

%% trade algorithm %%

for i=1

% i looks at nearest-neghbours in A, a_ij for all j
    
i_neghbours = A(i,:);

% find i's nearest-neghbours offer prices

i_neghbours_price = utility_wheat.*i_neghbours;

% find j that is offering the min price for wheat (min(utility_wheat)) > 0

[min_price,min_id] = min(i_neghbours_price(i_neghbours_price > 0));

% is min_price <= utility_cash(i) (i.e., is j willing to trade)
% if so, j trades min_price*cash(i) for min_price*wheat(i)

wheat_1 = []; % initialise wheat stocks after trade
cash_1 = [];  % initialise cash stocks after trade

if min_price <= utility_cash(i)
   % new wheat stocks (buyer) = old wheat stocks + amount purchased
   wheat_1(min_id) = wheat(min_id)+(min_price*wheat(i));
   % new wheat stocks (seller) = old wheat stocks - amount sold
   wheat_1(i) = wheat(i)-(min_price*cash(min_id));
   % new cash stocks (buyer) = old cash stocks - amount paid
   cash_1(min_id) = cash(min_id)-min_price*wheat(i);
   % new cash stocks (seller) = old cash stocks + amount profit
   cash_1(i) = cash(i)+(min_price*cash(min_id));
else
   wheat_1 = wheat 
   cash_1 = cash;
end

end

P = []; % price matrix at end of turn

% P = -------------
%     | 0    p_12 |
%     | p_21 0    |
%     -------------
%
% p_ij = the price at which j sold wheat to i

X = []; % trade matrix at end of turn

% X = -------------
%     | 0    x_12 |
%     | x_21 0    |
%     -------------
%
% x_ij = the amount of seller j's wheat that buyer i consumes











