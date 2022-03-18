    %% Ham tinh tu tuong quan bang 
function [r] = corr_of_frames(N,x,w,t)
    index_begin = (t-1)*N; %chi so mang cua tin hieu x tai khung thu t
    r = zeros(1,N);
    for to = 1 : N 
        for j = 1 : N - to
            r(to) = r(to) + x(index_begin + j) * x(index_begin + j + to - 1)* w(j)^2;
        end
    end
end