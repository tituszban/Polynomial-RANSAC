function dt = weighted_random_data(data, sample, x_tresh)

n = rand(1) * sum(data(:,3));

dt = [];

idx = 1;

while n > data(idx,3)
  n = n - data(idx,3);
  idx = idx + 1; 
end
dt = data(idx,1:2);

if length(sample) > 0
  if sum( abs( sample(1,:) - dt(1) ) < x_tresh ) > 0
    dt = weighted_random_data(data, sample, x_tresh);
  end
end