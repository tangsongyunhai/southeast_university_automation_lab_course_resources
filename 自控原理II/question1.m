K=1;
denominator=conv([1,2],[1,2,5]);
system=tf (K, denominator)
figure;
rlocus (system)
figure;
nyquist (system)
K=-1;
system=tf(K,denominator);
figure;
rlocus (system)
figure;
nyquist (system)