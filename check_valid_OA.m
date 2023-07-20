function [valid_idx] = check_valid_OA(right_all, left_all, valid_prop)
    valid_idx = ones(size(right_all, 1),1);
    for i = 1:length(right_all)
        is_nan = isnan(right_all(i,:))|isnan(left_all(i,:));
        pop_nan_x = mean(is_nan, 2);
        if pop_nan_x < valid_prop
            valid_idx(i) = 0;
        end
    end
    end
