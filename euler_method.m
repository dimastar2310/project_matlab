clc 
%%shitat oiler numeri shelanu analaiti
%%y'= k(y-5)
t0 = 0;
y0 = 60;
tEnd = 5;
h= 0.1;
N = (tEnd-t0)/h;
%% Neathel pitronot
%%T = [t0:h:tEnd]'; %vektor amuda le hova
Y = zeros(N+1,1); %%vektor pitaron
Y(1) = y0;%% be matlab mathilim mi 1

%%niftor beshitat Euler pitaron numeri
%%k le yadua zarih lehashev anu zrihim spezifi
%%haser k nimza
%%sym y(x)
syms k
dsolve('Dy==k*(y-5)') %%pitaron klali
dsolve('Dy = k*(y-5)','y(0)=60') %%prati

eqn = exp((3/2)*k) == 1/11; 
kk = solve(eqn,k) %%k shelanu

syms t w
eqn = (exp(kk*t)) == 1/55; %%kaavor 2.5 dakot ihie 6 kamash
 %%t* kohav
t1 = solve(eqn,t)  

eqn = exp(kk*w) == -4/55;

t2 = solve(eqn ,w)
%%af paam le magia le mehirut 1 
%%mekablim mispar merukav

for i = 1:N
    %%lefi hagdara F(X,Y) = k(y-5) , (y(i+1)-y(i))/h
    %%fi = -2*T(i)*Y(i); be dugma
    fi = kk*(Y(i)-5);
    %%y(i+1) = yi + h(F(t(i),y(i))
    Y(i+1) = Y(i) + h*fi;
end
    %%graph shgiot
   %% plot(T,Y),shg;
    t= 0:0.1:5;
   
    Ytrue = (5+55*exp(kk*t))'; %%pitaron shelanu
    ERR = abs(Ytrue - Y); %%hefresh legraph numeri le shelanu
    m = max(abs(Ytrue - Y));
    %%legend('numerical solution','analytical solution')
    fprintf('maximum is = %d\n ',m);
    disp('red is analitic and greeen is numeric')
    subplot(2,2,1) ,plot(t,Ytrue,'r',t,Y,'g'),subplot(2,2,2),plot(t,ERR,'g');
  