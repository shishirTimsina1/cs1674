function [B] = normalize_rows(A)
%UNTITLED normalize rows
%   Detailed explanation goes here

B = A./sum(A,2);

end

