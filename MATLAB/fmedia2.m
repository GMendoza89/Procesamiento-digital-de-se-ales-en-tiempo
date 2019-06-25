function y = fmedia2(x,m)
n = length(x);
y = zeros(1,n);
i2 = (0:-1:(-m+1));
V1 = ones(m,1);


for i1= m:n
    i3 = i2+i1;
   y(i1)=x(i3)*V1;
   y(i1)=y(i1)/m;
end