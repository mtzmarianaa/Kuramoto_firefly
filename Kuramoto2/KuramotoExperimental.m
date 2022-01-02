% Kuramoto datos de simulación


n=30; %Elija el numero de osciladores a modelar
t=5; %Elija el tiempo a Observar
r(1)=0;
i=1;
f=@kuramotoDif;
theta0=linspace(0,2*pi,n)';
omegas=normrnd(10,4,[n,1]);
for k=linspace(0,15,40)
V=RK23VK(f,t,0,theta0,0.000001,0.3,omegas,k);
r(i)=mean(abs(V(n+2,:)));
i=i+1;
end
plot(linspace(0,15,40),r)