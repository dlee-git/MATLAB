clear all;
clc;

m = input('Enter a positive integer bigger than 1: ');
while m < 2 || mod(m,1)
    fprintf('Please enter a positive integer value bigger than 1\n');
    m = input('Enter a positive integer bigger than 1: ');
end


t1 = sqrt(m);
t2 = sqrt(m-sqrt(m));
t_odd_old = t1;
t_even_old = t2;
difference = t2 - t1;
t_value = 2;

fprintf('\n\nm = %d\nt1 = %.12f\nt2 = %.12f\n', m, t1, t2)



while abs(difference) >= 10^-12
    
    t_value = t_value + 1;
    t_odd_new = sqrt(m-sqrt(m+t_odd_old));
    fprintf('t%d = %.12f\n', t_value, t_odd_new);
    t_odd_old=t_odd_new;
    
    difference = t_odd_old - t_even_old;

    t_value = t_value + 1;
    t_even_new = sqrt(m-sqrt(m+t_even_old));
    fprintf('t%d = %.12f\n', t_value, t_even_new);
    t_even_old=t_even_new;
    
    difference = t_odd_old - t_even_old;
end
