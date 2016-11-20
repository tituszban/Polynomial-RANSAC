function [best_param1, best_param2] = ransac(file, n_o_points, iter, threshDist)

load(file)

data = data';

figure;plot(data(1,:),data(2,:),'*');hold on;

n = size(data, 2);

best_in_num = 0;

best_param1 = 0;
best_param2 = 0;
best_sample = [];

for i = 1:iter
  idx = randperm(n, n_o_points);
  sample = data(:,idx);
  
  line_vec = sample(:,2) - sample(:,1);
  dir_vec = line_vec / norm(line_vec);
  norm_vec = [-dir_vec(2), dir_vec(1)];
  param1 = (sample(2,2)-sample(2,1))/(sample(1,2)-sample(1,1));
  param2 = sample(2,1)-param1*sample(1,1);
  %A = param1;
  %B = 1;
  %C = param2;
  %distance = ones(n, 1);
  distance = norm_vec*(data - repmat(sample(:,1),1,n));
  %for i=1:n
  %  distance(i) = abs(data(1,i)*A + data(2,i)*B + C) / (sqrt(A^2+B^2));
  %end

  inlier_idx = find(abs(distance) <= threshDist);
  inlier_n = length(inlier_idx);
  
  if inlier_n > best_in_num
    best_in_num = inlier_n;
    best_param1 = param1;
    best_param2 = param2;
    best_sample = sample;
  end
end

best_in_num

xAxis = min(data')(1):max(data')(1);
yAxis = best_param1*xAxis + best_param2;
plot(xAxis, yAxis, '-r', 'LineWidth', 2);