function [N] = my_unique(M)
%UNTITLED returns matrix with no duplicate rows
%   Detailed explanation goes here

    N = M(:,:);
    [num_rows, num_cols] = size(M);
    
    for i = 1:num_rows
        for j = 1:num_rows
            cur = M(i,:);
            next = M(j,:);
            if(i ~= j)
                if isequal(cur, next)
                    N(j,:) = [];
                end
            end
            
        end

    end
end
