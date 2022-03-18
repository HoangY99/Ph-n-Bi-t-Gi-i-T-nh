%% Loc trung vi

function y = MedSmoothing(x,N) %y tin hieu sau khi loc, x la tin hieu truoc khi loc, N la bac can loc
    
    y = x; %khoi tao gia tri tin hieu y
    temp = 1:N; % tao truc thoi gian tin hieu cua so co chieu dai N
    for k = 1:length(x) % k chay tu 1 den chieu dai cua tin hieu x
        for i = 1:N %i chay tu 1 den N
            if(k < ceil(N/2))
                %xet gia tri tin hieu cua so temp ben trai tin hieu x
                if(i < ceil(N/2)-k+1) % i < phan tu giua cua temp
                temp(i) = 0;
                else
                temp(i) = x(k+i-ceil(N/2)); % i > phan tu giua cua temp
                end
            else
                %xet gia tri tin hieu cua so ben phai tin hieu temp
                if(k > length(x) - ceil(N/2) + 1)
                    %i < phan tu giua cua temp
                    if(i < length(x) + ceil(N/2) - k + 1)
                        temp(i) = x(k-ceil(N/2) + i);
                    else
                        temp(i) = 0; %i > phan tu giua cua temp
                    end
                else
                    %xet tin hieu temp chay o giua x.
                    temp(i) = x(k-ceil(N/2)+i);
                end
            end
        end
        %ham median giup tim phan tu trung vi cua day
        y(k) = median(temp);
    end
end
