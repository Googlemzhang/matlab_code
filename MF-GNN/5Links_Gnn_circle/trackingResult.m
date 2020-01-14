clear;
format long;
load data\INITdata260.mat;
global d;
d = 0.05;
iota = 0.15;
Td = 20;
% inteval = 1;
inteval = 20;
number = fix(length(t)/inteval);
pos = zeros(number,2);
Error = zeros(number,2);
index = 0;

step = 0.01;
%Ŀ��켣
T = 0:step:20;
% %circle
rdx = iota*cos(2*pi*sin(0.5*pi*T/Td).^2)-iota+4.505;
rdy = iota*cos(pi/6)*sin(2*pi*sin(0.5*pi*T/Td).^2)+0.6894;
% rdz = iota*sin(pi/6)*sin(2*pi*sin(0.5*pi*T/Td).^2)+0.3859;
%rhodonea
% rdx = iota*cos(4*pi*sin(0.5*pi*T/Td).^2).*cos(2*pi*sin(0.5*pi*T/Td).^2)-iota+0.0907;
% rdy = iota*cos(pi/6)*cos(4*pi*sin(0.5*pi*T/Td).^2).*sin(2*pi*sin(0.5*pi*T/Td).^2)+0.00001;
% rdz = iota*sin(pi/6)*cos(4*pi*sin(0.5*pi*T/Td).^2).*sin(2*pi*sin(0.5*pi*T/Td).^2)+0.3859;

%ʵ�ʹ켣
for i = 1:length(t)
    if (rem(i, inteval)==0)
        q = y(i,1:5)';
        index = index + 1;
        [px, py] = position5(q);
        %ĩ��
        pos(index, 1:2) = [px(6), py(6)];
        %���
        Error(index,:) = [px(6)-rdx(i), py(6)-rdy(i)];
    end
end
figure;
plot((1e+3)*(pos(1:number,1)'), (1e+3)*(pos(1:number,2)'),'r:*');grid on;
hold on;
plot((1e+3)*rdx, (1e+3)*rdy,'b'); 
legend('Actual trajactory','Desired path','Location','best');

hold off;

xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Z (mm)');
savefig('result\circleTrack_300.fig');

%������
figure;
Te = 0:step*inteval:20;
plot((1e+3)*Te,(1e+3)*([0;Error(:,1)]'),'-');
% plot(Te,Error(:,1)','-');
hold on;
plot((1e+3)*Te,(1e+3)*([0;Error(:,2)]'),'-');
% plot(Te,Error(:,2)','--');grid on;
% plot(Te,[0;Error(:,3)]','-');
% plot(Te,Error(:,3)','-.');
legend('Ex','Ey','Location','best');
hold off;
xlabel('t (s)');
ylabel('error (mm)');
title('\gamma=260, \mu = 280');
% % savefig('result\errorCircle_50.fig');

