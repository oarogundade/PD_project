function[g] = correlation_OA(right_all, left_all)

%code from calculating correlation per segement file; right_all and left_al
%are previously segmented data sets

for i = 1:size(right_all,1)
    data_segment_right = right_all(i, :);
    data_segment_left = left_all(i, :);
    nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
    %getting NaNs from both data sets so that left and right sets are
    %equal in length

    %deleting out nan's from both data sets 
    b = data_segment_left(~nan_idx);
    c = data_segment_right(~nan_idx);

    %creating a NaN correation for segemnts at which one segement is empty
    %(since all NaN's have been taken out)
    if isempty(b)||isempty(c)
        g(i) = nan;
    else
        g(i) = corr(b' , c'); %calculates correlation and returns them in g
    end
end
end

