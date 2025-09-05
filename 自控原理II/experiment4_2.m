% 定义频率、角频率、幅频特性和相频特性
frequencies = [0.16, 0.32, 0.64, 1.11, 1.59, 2.39, 3.18, 4.78, 6.37, 11.1, 15.9];
omega = [1.0, 2.0, 4.0, 7.0, 10.0, 15.0, 20.0, 30.0, 40.0, 70.0, 100.0];
magnitude_dB = [-0.0575, -0.1797, -0.7785, -2.269, -4.086, -7.262, -10.267, -16.086, -20.696, -32.041, -40.445];
phase_degrees = [-11.007, -18.961, -37.071, -61.418, -81.399, -106.69, -127.17, -155.39, -174.95, -204.4, -223.78];

% 绘制实际幅度频率特性曲线
figure;
semilogx(frequencies, magnitude_dB, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('实际幅度频率特性曲线');
xlabel('频率 (Hz)');
ylabel('幅频特性 (dB)');

% 绘制相位频率特性曲线
figure;
semilogx(frequencies, phase_degrees, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('相位频率特性曲线');
xlabel('频率 (Hz)');
ylabel('相频特性 (度)');

% 转换成折线式Bode图
figure;
semilogx(omega, magnitude_dB, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
for i = 1:length(omega)-1
    % 计算每段直线的斜率
    slope = (magnitude_dB(i+1) - magnitude_dB(i)) / (omega(i+1) - omega(i));
    % 绘制直线段
    x = [omega(i), omega(i+1)];
    y = magnitude_dB(i) + slope * (x - omega(i));
    plot(x, y, 'b-');
end
grid on;
title('折线式Bode图');
xlabel('\omega (rad/s)');
ylabel('幅频特性 (dB)');

% 绘制Nyquist图
figure;
plot(exp(1i * phase_degrees * pi / 180), magnitude_dB, 'go-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('Nyquist图');
xlabel('Re');
ylabel('Im');

% 注意：计算传递函数需要手动进行，通常涉及确定系统的零点和极点。