function data_generator(file, st, en, min, inlier_count, outlier_count)

angle_min = pi / 6;
angle_max = pi / 3;

angle = rand() * (angle_max - angle_min) + angle_min;
m = tan(angle)

min_y = min;
max_y = m * en + min;

x = rand(inlier_count, 1) * (en - st) + st;

y = m * x + min + (rand(size(x)) - 0.5) * (max_y - min_y) * 0.05;

x2 = rand(outlier_count, 1) * (en - st) + st;
y2 = rand(outlier_count, 1) * (max_y - min_y) + min_y;

X = [x;x2];
Y = [y;y2];

figure;plot(X, Y,'*');hold on;

data = [X, Y];
save(file, 'data')