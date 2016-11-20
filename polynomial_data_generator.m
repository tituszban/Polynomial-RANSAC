function polynomial_data_generator(file, x_range, y_range, order, order_multiplier, inlier_count, outlier_count, noise)

exp_multipier = (ones(1, order + 1) * 1.5) .^ [1:order+1] * order_multiplier;


p = rand(1, order + 1) .* exp_multipier - exp_multipier;


x = rand(inlier_count, 1) * (x_range(2) - x_range(1)) + x_range(1);
y = polyval(p, x) + rand(inlier_count, 1) * noise - noise / 2;
max_y = max(y);
min_y = min(y);
y = (y - min_y) / (max_y - min_y) * (y_range(2) - y_range(1)) + y_range(1);


[x, y];

x2 = rand(outlier_count, 1) * (x_range(2) - x_range(1)) + x_range(1);
y2 = rand(outlier_count, 1) * (y_range(2) - y_range(1)) + y_range(1);

[x2, y2];

X = [x;x2];
Y = [y;y2];

figure(1);
plot(x, y,'b.');
hold on;
plot(x2,y2,'r.');
hold off;

data = [X, Y];
save(file, 'data')