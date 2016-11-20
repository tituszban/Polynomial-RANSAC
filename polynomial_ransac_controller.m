function best_p = polynomial_ransac_controller(file, orders, inlier_ratio, max_iter, threshDist)

warning('off', 'Octave:nearly-singular-matrix')
warning('off', 'Octave:singular-matrix')

load(file)

figure(2);
plot(data(:,1),data(:,2),'b.');
hold on;

n = 0;
best_p = [];

xAxis = min(data(:,1)):0.01:max(data(:,1));
range = max(data(:,2)) - min(data(:,2));
plot_max = max(data(:,2));% + range * 0.4;
plot_min = min(data(:,1));% - range * 0.4;

ylim([plot_min plot_max]);

tic
for o=orders
    iter = min(max_iter, log(0.001)/log(1 - inlier_ratio^(o+1)));
    [p, m] = polynomial_ransac(data, o, iter, threshDist);
    if m > n
        n = m;
        best_p = p;
    end
    
    yAxis = polyval(p, xAxis);
    %   yAxis = min(plot_max, yAxis);
    %   yAxis = max(plot_min, yAxis);
    
    plot(xAxis, yAxis, 'r');
end
toc

hold off;

d2 = polynomial_distance2(best_p, data);
idx = d2 <= threshDist*threshDist;
yAxis = polyval(best_p, xAxis);

figure(3);
ylim([plot_min plot_max])
hold on
plot(data(idx,1),data(idx,2),'b.')
plot(data(~idx,1),data(~idx,2),'r*')
plot(xAxis, yAxis, '-g', 'LineWidth', 2);
hold off;

warning('on', 'Octave:nearly-singular-matrix')
warning('on', 'Octave:singular-matrix')
end