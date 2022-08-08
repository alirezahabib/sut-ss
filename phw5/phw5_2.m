%{
    Alireza Habibzadeh
    Student No.99109393
    Signals & Systems
    Fall 2021 - Dr. Sameti
%}

% Part 2: Z-Transform

syms z n
assume(n, 'integer')


%% 1.
x1 = [3 2 1 -2 -3];
x2 = (0.8)^n*heaviside(n-2);
x3 = 2^n*cos(0.4*pi*n)*heaviside(n);

subplot(3,1,1)
fplot(x1)
title('x1')
xlabel('n')

subplot(3,1,2)
fplot(x2)
title('x2')
xlabel('n')

subplot(3,1,3)
fplot(x3)
title('x3')
xlabel('n')

X1 = 3*z^2 + 2*z + 1 + (-2)*z^-1 + (-3)*z^-2;
X2 = ztrans(x2);
X3 = ztrans(x3);

fprintf('X1 = ')
disp(X1)
fprintf('X2 = ')
disp(X2)
fprintf('X3 = ')
disp(X3)

figure
pzplot(X1)
figure
pzplot(X2)
figure
pzplot(X3)

%% 2.
H1 = filt([1 -1], [1 -1 0.5]);
figure
pzplot(H1)
H1

H2 = filt([0 1], [2 -sqrt(3) 0.5]);
figure
pzplot(H2)
H2

fprintf('ROC is from the outer pole to infinity\n')
fprintf('Both are unstable since they have poles in the right side\n')

disp(residuez([1 -1], [1 -1 0.5]))
disp(residuez([0 1], [2 -sqrt(3) 0.5]))

fprintf('h1 = -((-1)^n*2^(1 - n)*(-1 - i)^(n - 1)*i)/2 + ((-1)^n*2^(1 - n)*(i - 1)^(n - 1)*i)/2\n')
fprintf('h2 = (2*(-1)^n*3^(1/2)*cos((5*pi*n)/6))/(3*2^n) + ((-1)^n*3^(1/2)*4^(1 - n)*(-3^(1/2) - i)^(n - 1)*i)/3 - ((-1)^n*3^(1/2)*4^(1 - n)*(-3^(1/2) + i)^(n - 1)*i)/3\n')
 

F1 = (1-z^-1)/(1-z^-1+0.5*z^-2);
F2 = (z^-1)/(2-sqrt(3)*z^-1+0.5*z^-2);

fprintf('h1 = ')
disp(iztrans(F1))
fprintf('h2 = ')
disp(iztrans(F2))
