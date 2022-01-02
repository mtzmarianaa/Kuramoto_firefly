function [x]=RK23VK(f,t,t0,y0,rho,H,r,m)
p(1,1)=0;
told=t0;
w=y0;
wV=sin(y0);
k=1;
n=size(w);
n=n(1);
rephi(1,1)=mean(exp(i*w));
while told<t
    h=H;
    if t-H<=told
        h=t-told;
    end
    check=0;
    while check==0 
    
        s1=f(told,w,r,m);
        s2=f(told+h,w+h*s1,r,m);
        s3=f(told+h/2,w+h/2*(s1+s2)/2,r,m);
    
        w2= w+h/2*(s1+s2);
        w3=w+h/6*(s1+4*s3+s2);
    
        l=norm(w2-w3);
    
        if l<=rho
            check=1;
            w=w2; %w=w3
            told=told+h;
            k=k+1;
            p(1,k)=p(1,k-1)+h;
           
            wV(:,k)=sin(w);%Almacenamos la aproximacion de cada paso
            rephi(1,k)=mean(exp(i*w));
        end
        h=h/2;
    end
end
wV(n+1,:)=p;
wV(n+2,:)=rephi;
x=wV;   %En lugar de dar la aproximación en t, damos todas las aproximaciones
        %utilizadas hasta t