% 表3-1数据
V_pos = [19 79 136 200 257 318 382 443 503 571 628 700 760 825 885 941];
X_pos = [0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3];
V_neg = [76 129 204 261 322 382 446 503 570 625 680 743 798 859 925];
X_neg = [-0.2 -0.4 -0.6 -0.8 -1.0 -1.2 -1.4 -1.6 -1.8 -2.0 -2.2 -2.4 -2.6 -2.8 -3];
V_neg=fliplr(V_neg);
X_neg=fliplr(X_neg);
% 合并正负数据
V = [V_neg V_pos ];
X = [X_neg X_pos ];

% 绘制Vop-p-X曲线
figure;
plot(X, V, 'b-o');
xlabel('位移 X (mm)');
ylabel('输出电压 Vop-p (mV)');
title('Vop-p-X 曲线');
grid on;

% 计算灵敏度
% 灵敏度定义为输出电压变化量除以位移变化量
sensitivity_1mm = (322+318) / (2);
sensitivity_3mm = (941+925) / (6);

% 计算非线性误差
% 非线性误差可以通过比较实际输出与理想直线输出的差异来计算
% 这里我们使用最小二乘法拟合一条直线，并计算±1mm和±3mm时的非线性误差
p = polyfit(X_pos, V_pos, 1); % 拟合正向数据
V_ideal_pos = polyval(p, X_pos); % 计算理想输出
nonlinear_error_pos_1mm = abs(V_pos(2) - V_ideal_pos(2)); % 正向1mm误差
nonlinear_error_pos_3mm = abs(V_pos(4) - V_ideal_pos(4)); % 正向3mm误差

p = polyfit(X_neg, V_neg, 1); % 拟合负向数据
V_ideal_neg = polyval(p, X_neg); % 计算理想输出
nonlinear_error_neg_1mm = abs(V_neg(2) - V_ideal_neg(2)); % 负向1mm误差
nonlinear_error_neg_3mm = abs(V_neg(4) - V_ideal_neg(4)); % 负向3mm误差

% 输出结果
fprintf('灵敏度（1mm）: %f mV/mm\n', sensitivity_1mm);
fprintf('灵敏度（3mm）: %f mV/mm\n', sensitivity_3mm);
fprintf('非线性误差（正向1mm）: %f \n', nonlinear_error_pos_1mm/sensitivity_1mm);
fprintf('非线性误差（正向3mm）: %f \n', nonlinear_error_pos_3mm/sensitivity_3mm);
fprintf('非线性误差（负向1mm）: %f \n', nonlinear_error_neg_1mm/sensitivity_1mm);
fprintf('非线性误差（负向3mm）: %f \n', nonlinear_error_neg_3mm/sensitivity_3mm);

% 实验完毕，关闭电源
% 这部分在MATLAB代码中无法实现，需要在实际操作中执行



% 表3-7数据
X = [-0.4 0.1 0.6 1.1 1.6 2.1 2.6 3.1 3.6 4.1];
V = [0.81 0.59 0.50 0.34 0.17 0.00 -0.16 -0.34 -0.53 -0.66];

% 绘制X-V实验曲线
figure;
plot(X, V, 'b-o');
xlabel('位移 X (mm)');
ylabel('输出电压 V (V)');
title('电容传感器位移与输出电压实验曲线');
grid on;

% 计算系统灵敏度S
% 灵敏度S定义为输出电压变化量除以位移变化量
% 取两端点计算灵敏度，因为灵敏度可能会随着位移变化而变化
S = (V(end) - V(1)) / (X(end) - X(1));

% 计算非线性误差δ
% 非线性误差可以通过比较实际输出与理想直线输出的差异来计算
% 这里我们使用最小二乘法拟合一条直线，并计算非线性误差
p = polyfit(X, V, 1); % 拟合数据
V_ideal = polyval(p, X); % 计算理想输出
delta = max(abs(V - V_ideal)); % 非线性误差取最大偏差

% 输出结果
fprintf('系统灵敏度S: %f V/mm\n', S);
fprintf('非线性误差δ: %f \n', delta/(V(end) - V(1)));

% 给定数据
P = [2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0]; % 压力，单位KPa
Vo = [0.062 0.076 0.092 0.106 0.120 0.135 0.150 0.165 0.179 0.193 0.207 0.222 0.237 0.252 0.266 0.281 0.296]; % 输出电压，单位V

% 绘制实验曲线
figure;
plot(P, Vo, 'b-o');
xlabel('压力 P (KPa)');
ylabel('输出电压 Vo (V)');
title('压力与输出电压实验曲线');
grid on;

% 计算系统灵敏度S
% 灵敏度S定义为输出电压变化量除以压力变化量
% 取两端点计算灵敏度，因为灵敏度可能会随着压力变化而变化
S = (Vo(end) - Vo(1)) / (P(end) - P(1));

% 计算非线性误差δ
% 非线性误差可以通过比较实际输出与理想直线输出的差异来计算
% 这里我们使用最小二乘法拟合一条直线，并计算非线性误差
p = polyfit(P, Vo, 1); % 拟合数据
Vo_ideal = polyval(p, P); % 计算理想输出
delta = max(abs(Vo - Vo_ideal)); % 非线性误差取最大偏差

% 输出结果
fprintf('系统灵敏度S: %f V/KPa\n', S);
fprintf('非线性误差δ: %f \n', delta/(Vo(end) - Vo(1)));

% 给定数据
f = [5 7 12 15 17 20 25]; % 频率，单位Hz
Vp_p = [0.465 1.740 3.582 2.055 1.729 1.543 1.224]; % 峰-峰电压，单位V

% 绘制曲线图
figure;
plot(f, Vp_p, 'b-o');
xlabel('频率 f (Hz)');
ylabel('峰-峰电压 Vp-p (V)');
title('频率与峰-峰电压关系曲线');
grid on;


% 给定数据
f = [5 7 12 15 17 20 25]; % 频率，单位Hz
Vp_p = [0.465 1.740 3.582 2.055 1.729 1.543 1.224]; % 峰-峰电压，单位V

% 创建一个更细密的频率向量，用于绘制平滑曲线
f2 = linspace(min(f), max(f), 100); % 从最小频率到最大频率，生成100个点

% 使用插值函数生成平滑的电压数据
Vp_p2 = interp1(f, Vp_p, f2, 'spline');

% 绘制曲线图
figure;
plot(f2, Vp_p2, 'b-', 'LineWidth', 2); % 使用蓝色实线绘制曲线
hold on;
plot(f, Vp_p, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % 使用红色圆圈标记原始数据点
xlabel('频率 f (Hz)');
ylabel('峰-峰电压 Vp-p (V)');
title('频率与峰-峰电压关系曲线图');
grid on;
legend('平滑曲线', '原始数据点');
hold off;