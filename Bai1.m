[x,Fs] = audioread('D:\MATLAB\TinHieuHuanLuyen/01MDA.wav');
[x1,Fs1] = audioread('D:\MATLAB\TinHieuHuanLuyen/30FTN.wav');
[x2,Fs2] = audioread('D:\MATLAB\TinHieuHuanLuyen/03MAB.wav');
[x3,Fs3] = audioread('D:\MATLAB\TinHieuHuanLuyen/06FTB.wav');

d=10*10^(-3);      %do dai khung (s)
N=d*Fs;                % so luong khung
M=fix(length(x)/N); % so luong mau trong 1 khung 

[a,Ex] = Energy(x,M,N);
[a1,Ex1] = Energy(x1,M,N);
[a2,Ex2] = Energy(x2,M,N);
[a3,Ex3] = Energy(x3,M,N);



draw_line(a,Ex,d);
figure;
draw_line(a1,Ex1,d);
figure;
draw_line(a2,Ex2,d);
figure;
draw_line(a3,Ex3,d);

