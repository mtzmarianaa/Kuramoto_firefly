%Modelo de Kuramoto:

%Utilizamos en esta simulacion:
%Funcion Kuramoto dif
%Funcion RK233VK

n=60; %Elija el numero de osciladores a modelar
t=25; %Elija el tiempo a Observar
k=10;    %Elija el Parámetro de acoplamiento
mu=0;   %Elija la media de las frecuencias naturales
dev=2;  %Elija la desviacion standard de las frecuencias naturales

theta0=linspace(0,2*pi,n+1)';
theta0=theta0(1:n,1);
omegas=normrnd(mu,dev,[n,1]);
f=@kuramotoDif;
V=RK23VKi(f,t,0,theta0,0.000001,0.1,omegas,k);
R=V(n+1,:);
V(n+1,:)=V(n+2,:);
V(n+2,:)=R;
for i=1:200
    c=linspace(0,2*pi,200)
    X(i)=cos(c(i));
    Y(i)=sin(c(i));
end
%plot(X,Y)
m=size(V);
m=m(2);
%hold on
%plot(V(1:n,1),'o')
zeta=1
f = figure(1);
ax = axes('Parent',f,'position',[0.20 .20  0.60 0.70]);
h = plot(V(1:n+1,zeta),'o');
X1=real(V);
Y1=imag(V);
hold on
plot(X,Y)
hold off
%setoptions(h,'XLim',[0,10],'YLim',[0,2]);
b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
              'value',zeta, 'min',1, 'max',m);
bgcolor = f.Color;
bl1 = uicontrol('Parent',f,'Style','text','Position',[50,54,23,23],...
                'String','0','BackgroundColor',bgcolor);
bl2 = uicontrol('Parent',f,'Style','text','Position',[500,54,23,23],...
                'String',m,'BackgroundColor',bgcolor);
bl3 = uicontrol('Parent',f,'Style','text','Position',[240,25,100,23],...
                'String','Paso','BackgroundColor',bgcolor);
%function slider_Callback(hObject, event, handles)
%    data = guidata(handles.GUI); 
%    data.h.XData = newXData;         %your new x coordinates (if needed)
%    data.h.YData = newYData;         %your new y coodinates
%end

set(b,'Callback',@(hObject,eventdata) plot(X1(1:n,floor(b.Value)),Y1(1:n,floor(b.Value)),'o',[0;X1(n+1,floor(b.Value))],[0;Y1(n+1,floor(b.Value))],'-',X,Y,'-'))
%set(b,'Callback',@(hObject,eventdata) plot(X,Y))

figure(2)
plot(V(n+2,:),abs(V(n+1,:)))