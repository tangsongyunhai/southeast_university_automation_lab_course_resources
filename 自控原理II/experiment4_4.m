% 定义频率、角频率、幅频特性和相频特性
frequencies = [0.16, 0.32, 0.64, 1.11, 1.59, 2.39, 3.18, 4.78, 6.37, 11.1, 15.9];
omega = [1.0, 2.0, 4.0, 7.0, 10.0, 15.0, 20.0, 30.0, 40.0, 70.0, 100.0];
magnitude_dB = [-0.0575, -0.1797, -0.7785, -2.269, -4.086, -7.262, -10.267, -16.086, -20.696, -32.041, -40.445];
phase_degrees = [-11.007, -18.961, -37.071, -61.418, -81.399, -106.69, -127.17, -155.39, -174.95, -204.4, -223.78];

% 将幅度从dB转换为线性幅度
magnitude_linear = 10.^(magnitude_dB / 20);

% 将相位从度转换为弧度
phase_radians = phase_degrees * pi / 180;

% 计算复频响应
complex_response = magnitude_linear .* exp(1i * phase_radians);

% 提取实部和虚部
real_part = real(complex_response);
imag_part = imag(complex_response);

% 绘制Nyquist图
figure;
plot(real_part, imag_part, 'b-o', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('Nyquist 图');
xlabel('实部');
ylabel('虚部');
axis equal;  % 确保x和y轴比例相同
