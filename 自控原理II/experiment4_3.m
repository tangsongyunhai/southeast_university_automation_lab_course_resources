% 定义频率、角频率、幅频特性和相频特性
frequencies = [0.16, 0.32, 0.64, 1.11, 1.59, 2.39, 3.18, 4.78, 6.37, 11.1, 15.9];
omega = [1.0, 2.0, 4.0, 7.0, 10.0, 15.0, 20.0, 30.0, 40.0, 70.0, 100.0];
magnitude_dB = [-0.0575, -0.1797, -0.7785, -2.269, -4.086, -7.262, -10.267, -16.086, -20.696, -32.041, -40.445];
phase_degrees = [-11.007, -18.961, -37.071, -61.418, -81.399, -106.69, -127.17, -155.39, -174.95, -204.4, -223.78];

% 转换成折线式Bode图
figure;
semilogx(omega, magnitude_dB, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
hold on;

% 绘制折线段
for i = 1:length(omega)-1
    % 计算每段直线的斜率
    slope = (magnitude_dB(i+1) - magnitude_dB(i)) / (omega(i+1) - omega(i));
    % 绘制直线段
    x = [omega(i), omega(i+1)];
    y = magnitude_dB(i) + slope * (x - omega(i));
    plot(x, y, 'b-');
end

% 选择参考点：以omega(4)为切点，幅度为magnitude_dB(4)
omega_0 = omega(6);  % 选择频率点omega(4)
magnitude_0 = magnitude_dB(6);  % 对应的幅度

% 计算参考线：斜率为-20 dB/dec
omega_ref = logspace(log10(min(omega)), log10(max(omega)), 100);  % 对数等间隔频率
magnitude_ref_20dB = magnitude_0 - 20 * log10(omega_ref / omega_0)+3.3;  % 斜率为-20 dB/dec

% 绘制斜率为-20 dB/dec的参考线
plot(omega_ref, magnitude_ref_20dB, 'r-', 'LineWidth', 2);


% 选择参考点：以omega(4)为切点，幅度为magnitude_dB(4)
omega_1 = omega(9);  % 选择频率点omega(4)
magnitude_1 = magnitude_dB(9);  % 对应的幅度

% 计算参考线：斜率为-20 dB/dec
omega_ref1 = logspace(log10(min(omega)), log10(max(omega)), 100);  % 对数等间隔频率
magnitude_ref_40dB = magnitude_1 - 40 * log10(omega_ref1 / omega_1)+3.6;  % 斜率为-20 dB/dec

% 绘制斜率为-20 dB/dec的参考线
plot(omega_ref1, magnitude_ref_40dB, 'g-', 'LineWidth', 2);


% 选择参考点：以omega(4)为切点，幅度为magnitude_dB(4)
omega_2 = omega(11);  % 选择频率点omega(4)
magnitude_2 = magnitude_dB(11);  % 对应的幅度

% 计算参考线：斜率为-20 dB/dec
omega_ref2 = logspace(log10(min(omega)), log10(max(omega)), 100);  % 对数等间隔频率
magnitude_ref_60dB = magnitude_2 - 60 * log10(omega_ref2 / omega_2)+3.3;  % 斜率为-20 dB/dec

% 绘制斜率为-20 dB/dec的参考线
plot(omega_ref2, magnitude_ref_60dB, 'b-', 'LineWidth', 2);


% 绘制0 dB的水平线
plot([min(omega), max(omega)], [0, 0], 'k-', 'LineWidth', 2);

grid on;
title('折线式Bode图');
xlabel('\omega (rad/s)');
ylabel('幅频特性 (dB)');
legend('实际数据', '-20 dB/dec切线', '0 dB水平线');

% 绘制Nyquist图
figure;
plot(exp(1i * phase_degrees * pi / 180), magnitude_dB, 'go-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('Nyquist图');
xlabel('Re');
ylabel('Im');

