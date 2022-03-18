%% Chuong trinh chinh
clear all;
F0chuan = 232.2;
[x,Fs] = audioread('D:\MATLAB\TinHieuKiemThu/30FTN.wav');
[x1,Fs1] = audioread('D:\MATLAB\TinHieuKiemThu/30FTN.wav');
[x2,Fs2] = audioread('D:\MATLAB\TinHieuKiemThu/44MTT.wav');
[x3,Fs3] = audioread('D:\MATLAB\TinHieuKiemThu/45MDV.wav');
% loc trung vi 
x = medfilt1(x,10);
x1 = medfilt1(x1,10);
x2= medfilt1(x2,10);
x3 = medfilt1(x3,10);

%do dai khung tin hieu (ms)
time = 20*10^-3;
%so luong mau trong 1 khung
N = time*Fs;
%so luong khung 
M = floor(length(x)/N);
%su dung cua so hamming
w = hamming_window(N);
F0_x = find_F0(M,N,x,Fs,w);
F0_x1 = find_F0(M,N,x1,Fs,w);
F0_x2 = find_F0(M,N,x2,Fs,w);
F0_x3 = find_F0(M,N,x3,Fs,w);


draw(x,M,N,F0_x); 
draw(x1,M,N,F0_x1);
draw(x2,M,N,F0_x2);
draw(x3,M,N,F0_x3);
