function draw(x,M,N,F0)
    figure;
    subplot(311);
    plot(x);
    title('Tin hieu dau vao','LineWidth',1);
    xlabel('Time (s)');
    ylabel('Amplitude ');

    subplot(312);
    [a,Ex] = Energy(x,M,N)
    plot(Ex,'r');
    title('Duong bieu dien tan so co ban');
    xlabel('Time (s)');
    ylabel('F0(Hz) ');

    subplot(313);
    t = 1:N:N*M;
    stem(t,F0,'.', 'r','linestyle','none');
    title('Duong bieu dien tan so co ban');
    xlabel('Time (s)');
    ylabel('F0(Hz) ');