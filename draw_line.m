function draw_line(a,Ex,d)
subplot(2,1,1);
plot(a,'b');
 title('Do thi tin hieu am thanh goc');
subplot(2,1,2);
plot(Ex,'r');
title('Phan doan tieng noi va khoang lang');
hold on;
nguong = 0.06;
id = find(Ex>=nguong);
%tim bien thoi gian giao nhau giua tieng noi va khoang lang
%Nguong co dinh là 0.2
%Neu NL khung lon hon 0.2 là tieng nói , Nho hon là khoang lang
id_speech=id(1)-1;
n=2;
for i = 2:length(id)
    if(d*id(i)-d*id(i-1) > 0.3)
        id_speech(n)=id(i-1);
        id_speech(n+1)=id(i)-1;
        n=n+2;
    end
end
id_speech(n)=id(i);

 for i = 1:length(id_speech)
    z = [id_speech(i) id_speech(i)];
    %ve do thi phan doan tieng noi va khoang lang
    t = [-4 4];
    line(z,t,'Color','blue','LineStyle','--');
 end