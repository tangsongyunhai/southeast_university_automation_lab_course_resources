% 电机电压和转速数据
voltage = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
speed = [410, 650, 890, 1130, 1370, 1600, 1840, 2070, 2280, 2530];

% 创建图形窗口
figure;

% 绘制电压与转速的关系曲线
plot(voltage, speed, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'g');

% 添加标题和轴标签
title('电机电枢电压与电机转速的关系');
xlabel('电压 (V)');
ylabel('转速 (rpm)');

% 显示网格
grid on;

% 位移和电压数据
displacement = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
voltage = [0.01, 0.04, 0.15, 0.24, 0.4, 0.49, 0.56, 0.67, 0.77, 0.95, 1.07];

% 创建图形窗口
figure;

% 绘制位移与电压的关系曲线
plot(displacement, voltage, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'g');

% 线性拟合
p = polyfit(displacement, voltage, 1);
voltage_fit = polyval(p, displacement);
% 计算测量范围 1mm 时的灵敏度
sensitivity = p(1);
% 计算非线性误差
nonlinear_error = max(abs(voltage - voltage_fit)) / max(voltage) * 100;
% 显示灵敏度和非线性误差
fprintf('测量范围 1mm 时的灵敏度为: %f V/mm\n', sensitivity);
fprintf('非线性误差为: %f %%\n', nonlinear_error);

% 电机电压和转速数据
voltage = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
speed = [400, 640, 870, 1110, 1350, 1560, 1810, 2050, 2270, 2510];

% 创建图形窗口
figure;

% 绘制电压与转速的关系曲线
plot(voltage, speed, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'g');

% 添加标题和轴标签
title('电机电枢电压与电机转速的关系');
xlabel('电压 (V)');
ylabel('转速 (rpm)');

% 显示网格
grid on;