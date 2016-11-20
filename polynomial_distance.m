function d = polynomial_distance(p, point)

F = length(p) - 1;

x0 = point(:,1)';
y0 = point(:,2)';
n = size(point,1);


da = polyder(p)

b = conv(p,da)

h = [zeros(n, 2*F-2), ones(n,1), ones(n,1) * -x0]

c = b - y0 * [zeros(n, F), da] + h;

X = roots(c);

X = X(imag(X)==0);
Y = polyval(p,X);
d = min(hypot(X-x0, Y-y0));

%function d = polynomial_distance(p, point)
%
%F = length(p) - 1;
%
%x0 = point(1);
%y0 = point(2);
%
%a = fliplr(p);
%
%da = fliplr(polyder(p));
%
%b = conv(a,da);
%
%h = [-x0, 1, zeros(1, 2*F-2)];
%
%c = b - y0 * [da, zeros(1, F)] + h;
%
%X = roots(fliplr(c));
%
%F=abs(imag(X))<1e-10;
%
%X = X(find(F==1));
%Y = polyval(p,X);
%d = min(hypot(X-x0, Y-y0));