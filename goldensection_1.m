f =@(x)x^4-14*x^3+60*x^2-70*x;         %function

a = 0;                   
b = 4;      
N= 50;                    %max iteration
eps = 0.00001             %epsilon

figure,fplot(f,[a-1,b+1])
ylabel ('f(x)')
xlabel ('x')
hold on


rho=double((sqrt(5)-1)/2); % golden proportion coefficient, around 0.618
x1=a+(1-rho)*(b-a);        % computing x values
x2=a+rho*(b-a);
f_x1=f(x1);                % computing values in x points
f_x2=f(x2);
fprintf('---------------------------------------------------\n');
fprintf('x1     \t   x2       \t  f(x1)   \t f(x2) \t   b-a\n');
fprintf('%.4e %.4e %.4e %.4e %.4e \n',x1,x2,f_x1,f_x2,b-a);

for i=1:N-2
    if(f_x1<f_x2)          % for finding max point : if(f_x1>f_x2) 
        b=x2;
        x2=x1;
        x1=a+(1-rho)*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x1,f_x1,'rx');
        hold on;
    else
        a=x1;
        x1=x2;
        x2=a+rho*(b-a);
     
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x2,f_x2,'gx');
        hold on;
    end
    fprintf('%.4e %.4e %.4e %.4e %.4e \n',x1,x2,f_x1,f_x2,b-a);
    if (abs(b-a)<=eps)
        fprintf('succeeded after %d steps\n',i);
        return;
    end
end