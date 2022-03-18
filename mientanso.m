%% Tinh FO bang FFT

function [yyy_F0] = mientanso(sig,fs)
   % H�m ???c s? d?ng ?? t�m t?n s? c? b?n c?a t�n hi?u trong ph?
   % sig l� t�n hi?u ??u v�o
   % fs l� t?n s? l?y m?u
   % ??u ra l� yyy_ F0, l� m?ng ch?a F0 ???c t�nh to�n trong m?i window
   N = 1024; %N-point fft
   frame_len = round(0.03*fs); %Length of frame (30ms)
   half = round(frame_len/2); %For overlapping frame
   h = hamming(frame_len); %Hamming window function
   i=1; %Index of element in yyy_F0
   for k = 1 : length(sig)/half -1 %Vong lap cac frame
        range = (k-1)*half + 1:(frame_len + (k-1)*half); %ch? s? index in window
        frame = h.*sig(range); %gi� tr? m?i ph?n t? in window
        %use FFT function (in Matlab) ph�n t�ch ph? c?a khung
        P2 = abs(fft(frame,N)); %The two-sided spectrum P2
        P1 = P2(1:length(P2)/2+1); %The single-sided spectrum P1
        P1(2:end-1) = 2*P1(2:end-1);
        freq=linspace(0,fs/2,length(P1)); %Spectrum of signal
        if findpeaks(frame,'NPeaks',1,'SortStr','descend') > 0.03 %Lo?i b? nhi?u b?ng c�ch gi?i h?n bi�n ?? t�n hi?u trong khung
            [y_value,y_peak] = findpeaks(P1,freq,'MinPeakHeight',2);%Find peaks (gi?i h?n t?i thi?u ?? lo?i b? nhi?u) 
            z_a = y_peak(3) - y_peak(2); % T�m 2 F0 b?ng c�ch s? d?ng 3 c?c ??i ??u ti�n trong ph?
            z_b = y_peak(2) - y_peak(1);
            if z_a<400 && z_a>80 %Since 80Hz<F0<400Hz, k?t qu? c?a s? b? t? ch?i n?u ? b�n ngo�i (80Hz,400Hz)
                if z_b<400 && z_b>80
                    yyy_F0(i) = (z_a+z_b)/2;% K?t qu? cu?i c�ng l� 2 gi� tr? c?a F0
                    i=i+1; %??a k?t qu? v�o yyy_F0 v� t?ng ch? s?.
                end
            end
        end
   end
end
