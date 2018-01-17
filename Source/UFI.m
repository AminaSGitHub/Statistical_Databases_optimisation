function [ Z ] = UFI( X, p , q, lamda, t )
%UFI Summary of this function goes here
%Input: 
    % X : The n * m data matrix,
    % p : The number of features to be selected, 
    % q : The number of instances to be selected,
    % lamda : The ridge regularizer, 
    % t : The number of iterationsre.
%Output:
    % Z : The submatrix, which contains the most informative features and instances
     [n,m] = size(A);
     alpha = n - p / t;
     beta  = m - q / t;
     E = X;
     for i=1 :t
        F = DelRow(E,lamda,alpha);
        G = DelColumn(F,lamda,beta);
        E = G;
     end
     Z = E;
end

