%% Gia tri cua so hamming
%-Input: do dai khung cua so (length_w)
%-Output: gia tri ham cua so hamming
function [w]= hamming_window(N)
    w=[];
    for i=1:N
        w(i) = 0.54 - 0.46*cos(2*pi*(i-1)/(N-1));    
    end
end