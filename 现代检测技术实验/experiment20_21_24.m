% 1. 输入数据
T = [30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130];  % 温度 (℃)
V = [29.2	,32.1,	37.0	,45.0	,52.0,	59.0	,64.0	,69.8	,75.5	,81.0	,87.5];  % 电压 (mV)

% 2. 绘制实验数据点
figure;
plot(T, V, 'ro-', 'MarkerFaceColor', 'r');  % 红色圆点表示实验数据
hold on;

% 3. 非线性拟合（可以使用多项式拟合，选择2次或3次多项式等）
p = polyfit(T, V, 1);  % 2次多项式拟合
V_fit = polyval(p, T);  % 根据拟合得到的多项式计算拟合值

% 绘制拟合曲线
plot(T, V_fit, 'b-', 'LineWidth', 2);  % 蓝色曲线表示拟合结果

% 添加图例和标签
legend('实验数据', '拟合曲线');
xlabel('温度 (℃)');
ylabel('电压 (mV)');
title('实验数据与拟合曲线');

% 4. 计算非线性误差
delta = max(abs(V - V_fit));  % 最大偏差
S = p(1);  % 线性拟合的斜率，即系统灵敏度
normalized_delta = delta / (V(end) - V(1));
fprintf('系统灵敏度 S: %f mV/°C\n', S);
fprintf('非线性误差 δ: %f\n', normalized_delta);

% 5. 绘制误差图
figure;
error = V - V_fit;  % 实验数据与拟合曲线的误差
plot(T, error, 'bo-', 'MarkerFaceColor', 'b');  % 绘制误差的图形
xlabel('温度 (℃)');
ylabel('误差 (mV)');
title('实验数据与拟合曲线的误差');
grid on;

