weight = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200]; % 重量(g)
voltage = [-0.7, 2.0, 4.8, 7.8, 10.7, 13.4, 16.3, 19.3, 22.2, 25.2, 28.4]; % 电压(mV)

% 绘制实验曲线
plot(weight, voltage, 'o-');
xlabel('重量 (g)');
ylabel('电压 (mV)');
title('重量与电压关系曲线');
grid on;

% 计算系统灵敏度
p = polyfit(weight, voltage, 1); % 1表示线性拟合
S = p(1); % 灵敏度为线性拟合的斜率
fprintf('系统灵敏度 S = %.3f mV/g\n', S);

% 计算非线性误差
voltage_fit = polyval(p, weight);
Delta_m = max(abs(voltage - voltage_fit));
y_FS = mean(voltage);
delta = (Delta_m / y_FS) * 100;
fprintf('非线性误差 δ = %.2f%%\n', delta);