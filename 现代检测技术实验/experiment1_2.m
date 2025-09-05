% 定义重量和电压数据
weights = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200]; % 重量(g)
voltages = [-0.7, 2.0, 4.8, 7.8, 10.7, 13.4, 16.3, 19.3, 22.2, 25.2, 28.4]; % 电压(mv)

% 绘制实验曲线
plot(weights, voltages, 'o-');
xlabel('重量 (g)');
ylabel('电压 (mv)');
title('实验曲线');

% 计算系统灵敏度 S
delta_U = voltages(end) - voltages(1); % 输出电压变化量
delta_W = weights(end) - weights(1); % 重量变化量
S = delta_U / delta_W;
fprintf('系统灵敏度 S = %.3f mv/g\n', S);
% 计算非线性误差 δ
% 使用polyfit进行线性拟合
p = polyfit(weights, voltages, 1); % 拟合直线参数
fitted_voltages = polyval(p, weights); % 计算拟合电压值
% 计算最大偏差 Δm
max_deviation = max(abs(voltages - fitted_voltages));
% 满量程输出平均值 yFS 为满量程重量的对应电压值
yFS = voltages(end);
% 计算非线性误差 δ
delta = (max_deviation / yFS) * 100;
fprintf('非线性误差 δ = %.3f %%\n', delta);