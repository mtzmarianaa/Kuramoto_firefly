function [A]=kuramotoDif(t,x,w,k)
n=size(x);
n=n(1);
for i=1:n
    sum=0;
    for j=1:n
        sum=sum+sin(x(j)-x(i));
    end
    A(i)=w(i)+k/n*sum;
end
A=A';
end
        