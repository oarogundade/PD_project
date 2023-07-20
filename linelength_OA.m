function g=linelength_OA (y_val, fs)

for i=1:size(y_val,2)-1
    x1=[i/fs, y_val(i)];
    x2=[(i+1)/fs, y_val(i+1)];
    c(i)=linelength_2(x1,x2);
 end
 g = sum(c);
end

function c= linelength_2(x1, x2)
a= x1(1)-x2(1);
b= x1(2)-x2(2);
c=sqrt(a^2+b^2);
end


%LINE LENGTH
% for i=1:size(y_val,1)-1
%     x1=[i/120, y_val(i)];
%     x2=[(i+1)/120, y_val(i+1)];
%     linelength_OA(x1,x2)
%     c(i)=linelength_OA(x1,x2);
% end
% g = sum(c);
