function y = fmedia5(x,m)
n = length(x);
y = zeros(1,n);
y(m) = x(1:m)*ones(m,1);
i1 = (m+1):n;
y(i1) = y(i1-1)-x(i1-m)+x(i1);
y = y/m;