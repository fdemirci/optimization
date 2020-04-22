f =@(x)exp(x)-2*sin(x); % function

eps = 1e-4
a=-2; %limits
b=1;

fplot(f,[a,b])     % plot of function
hold on

k = (b-a)/eps; %The smallest Fibonacci number satisfying

for i=0:1:100
    
    if myfibonacci(i)>k
        n=i;     
        n
        break
    end
end


t=0;

while (n>0)

c = a + (1-myfibonacci(n-1)/myfibonacci(n))*(b-a);
d = a + myfibonacci(n-1)/myfibonacci(n)*(b-a);


if (f(d)< f(c)) %change for min. point if (f(d)>=f(c))
    
   a = a;
   b = d;
   d = c;
   
else
    
   a = c;
   b = b;
   c = d;
   
end

plot(c,f(c),'gx')
hold on

plot(d,f(d),'rx')
hold on



n=n-1;

fprintf('--------------------------------------------------------------\n')
fprintf('a           b              n    f(c)          f(d)\n')
fprintf('%.4e  %.4e     %d    %.4e   %.4e \n',a,b,n,f(c),f(d))

end

%% find fibonacci number
function t=myfibonacci(k) 

x(1)=0;
x(2)=1;

    if(k==0)
    t = x(1)
    elseif (k==1)
    t = x(2)
    elseif (k>=2)
        for i=2:1:k
        x(i+1) = x(i)+x(i-1);
        t = x(i+1)
        end
    end
end
