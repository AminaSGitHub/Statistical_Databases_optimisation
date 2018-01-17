function [ F ] = DelRow( E, lamda, alpha )
%DELROW Summary of this function goes here
%Input: 
    % E     : Data matrix,
    % lamda : The ridge regularizer, 
    % alpha : The number of rows to remove.
%Output:
    % F : The submatrix, which contains the most informative features (F = E - alpha(Rows))
   
    F = E;
    M = inv(F' * F + lamda * eye(3));
    for  j=1 :alpha
       [n,m] = size(F);
       for i=1 :n
           if i == 1
               valeur = (F(i,:) * M*M * F(i,:)')/(1 - F(i,:) * M * F(i,:)');
               l = 1;
           else 
               newVal = (F(i,:) * M*M * F(i,:)')/(1 - F(i,:) * M * F(i,:)');
               if valeur > newVal
                   valeur = newVal;
                   l = i;
               end
           end
       end
       F(l,:) = [];% 17: F = remove the l-th row of F
       M = M + ( M * F(l,:)' * F(l,:) * M )/(1 - F(l,:) * M * F(l,:)');
    end

end

