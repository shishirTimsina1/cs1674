function [B] = normalize_columns(A)
%UNTITLED normalize rows
%   Detailed explanation goes here

B = A./sum(A);

end

