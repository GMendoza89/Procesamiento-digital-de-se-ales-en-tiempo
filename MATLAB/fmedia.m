function y = fmedia(x,m)

n = length(x);
y = zeros(1,n);
parfor i1= m:n
   for i2 = 0:-1:(-m+1)
       y(i1) = y(i1)+x(i1+i2);
   end
   y(i1)=y(i1)/m;
end