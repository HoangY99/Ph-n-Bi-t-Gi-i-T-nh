%% Ham tim F0
function [F0] = find_F0(M,N,x,Fs,w);
    for t = 1 : M
        r = corr_of_frames(N,x,w,t);
        %Tim diem cuc dai va tinh tan so F0 
        %am vo thanh: F0 = 0 - am huu thanh: F0 thuoc (75,350)
         if (r(1) < 0.03) 
            F = 0;
         else
            F = 0;
            max_peak = 0;
            index = 0;
            for i = 2 : length(r) - 1
                if (r(i) > r(i-1) && r(i) > r(i+1) && r(i) >= max_peak)
                    max_peak = r(i);
                    index = i;
                end
            end
            if ( max_peak >= r(1)*0.3) %nguong: 30% diem cuc dai
                F = Fs/index;
                if (F <= 75 || F >= 350)
                    F = 0;
                end
            end
        end
        F0(t) = F;
    end
end
 