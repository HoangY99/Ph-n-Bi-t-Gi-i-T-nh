%% Energy

function [a,Ex] = Energy(sig,M,N)
    count=1;                    
    a=zeros(M,N);    
    %gan gia tri nang luong cua moi khung 
    for i=1:M
        for j=1:N
            a(i,j) = sig(count);
            count = count+1; 
        end
    end

    Ex = zeros(1,M);
    for i=1:M
        for j=1:N
            Ex(i) = Ex(i) + a(i,j)^2; %tinh tong nang luong tung khung va gan vao mang 
        end
    end
end

