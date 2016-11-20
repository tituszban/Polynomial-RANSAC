function d2 = polynomial_distance2(p, point)

F = length(p) - 1;
n = size(point,1);

x0 = point(:,1);
y0 = point(:,2);

dp = polyder(p);

b = conv(p,dp);

c = ones(n,1)*b - [zeros(n, F), y0 * dp] + [zeros(n, 2*F-2), ones(n,1), - x0];

% X = roots(c);



X = zeros(n,2*F-1);

for ii = 1:n
    A = zeros(2*F-1);
    A(1,:) = -c(ii,2:end)/c(ii,1);
    A(2:2*F:end) = 1;
    X(ii,:) = eig(A)';
end

% idx = imag(R)==0;

% d2 = (R(idx)-x0).^2 + (polyval(p, R(idx)) - y0).^2;

d2 = zeros(n,1);
for i = 1:n
    x = X(i,imag(X(i,:))==0);
    d2(i) = min((x-x0(i)).^2 + (polyval(p,x) - y0(i)).^2);
%     d2(i) = sqrt(d2);
end


% X = X(imag(X)==0);
% Y = polyval(p,X);
% d = min(hypot(X-x0, Y-y0));

end


% function d = polynomial_distance(p, point)
% 
% F = length(p) - 1;
% 
% x0 = point(1);
% y0 = point(2);
% 
% dp = polyder(p);
% 
% b = conv(p,dp);
% 
% h = [zeros(1, 2*F-2), 1, -x0];
% 
% c = b - [zeros(1, F), y0 * dp] + h;
% 
% X = roots(c);
% 
% X = X(imag(X)==0);
% Y = polyval(p,X);
% d = min(hypot(X-x0, Y-y0));
% 
% end