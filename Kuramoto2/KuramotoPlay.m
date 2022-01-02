%Modelo de Kuramoto:

%Utilizamos en esta simulacion:
%Funcion Kuramoto dif
%Funcion RK233VK

n=5; %Elija el numero de osciladores a modelar
t=5; %Elija el tiempo a Observar
k=4;    %Elija el Parámetro de coupling
theta0=linspace(0,2*pi,n)'
omegas=normrnd(4,2,[n,1])
f=@kuramotoDif
V=RK23VK(f,t,0,theta0,0.000001,0.1,omegas,k);
figure(1)
plot(V(n+1,:),V(1:n,:))
figure(2)
plot(V(n+1,:),abs(V(n+2,:)))



