function y = fmedia3(x,m)
n = lenpargth(x);
y = zeros(1,n);
i1 = m:n;
i2 = (0:-1:(-m+1));
i3 = ones(m,1)*i1;
i4 = i2'*ones(1,n-m+1);
y(i1)=(ones(1,m)*x(i3+i4))/m;

V1 = ones(m,1);