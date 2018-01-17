function [ G ] = DelColumn( F, lamda, beta )
%DELCOLUMN Summary of this function goes here
%Input: 
    % F     : Data matrix,
    % lamda : The ridge regularizer, 
    % beta  : The number of columns to remove.
%Output:
    % G : The submatrix, which contains the most informative instances (G = F - beta(columns))
   
    G = F;
    N = inv(G*G' + lamda*eye(3));
    for  j=1 :beta
        
       [n,m] = size(G);
       for i=1 :m
           if i == 1
               valeur = (G(:,i)' * N*N * G(:,i))/(1 - G(:,i)' * N * G(:,i));
               k = 1;
           else 
               newVal = (G(:,i)' * N*N * G(:,i))/(1 - G(:,i)' * N * G(:,i));
               if valeur > newVal
                   valeur = newVal;
                   k = i;
               end
           end
       end
        G(:,k) = [];% 27: G = remove the k-th colomn of G
        N = N + ( N * G(:,k) * G(:,k)' * N )/(1 - G(:,k)' * N * G(:,k));

    end

end

