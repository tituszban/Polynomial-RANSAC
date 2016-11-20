function [best_p, best_in_num] = polynomial_ransac(data, order, iter, threshDist)

n = size(data, 1);

best_in_num = 0;
best_p = [];

data = [data, ones(n, 1)];

% d2 = zeros(n,1);

h = waitbar(0, 'Calculating order ransac: 0%%', 'name', sprintf('%1.0fth order RANSAC', order));

threshDist2 = threshDist*threshDist;

for i = 1:iter
    sample = [];
  try  
    for j = 1:order+1
      sample = [sample; weighted_random_data(data, sample, 0.1)];
    end
    
%    sample = data(randperm(n, order + 1),:);

  
    p = polyfit(sample(:,1), sample(:,2), order);
  
    %   for j = 1:n
    %     d(j) = polynomial_distance(p, data(j,:));
    %   end
    d2 = polynomial_distance2(p, data);
    
%    inlier_n = sum(d2 <= threshDist2);
%    
%    if inlier_n > best_in_num
%        best_in_num = inlier_n;
%        best_p = p;
%    end
    
     goodness = sum(exp(-sqrt(d2)*100));
     
     if goodness > best_in_num
         %exp(-sqrt(d2)*100)
         data(:,3) = data(:,3) + exp(-sqrt(d2)*100) * 5;
         best_in_num = goodness;
         best_p = p;
     end
    
    waitbar(i / iter, h, sprintf('Calculating ransac:%3.0f%%', i/iter * 100))
  catch
  end
end
delete(h)