%{
    Alireza Habibzadeh
    Student No.99109393
    Signals & Systems
    Fall 2021 - Dr. Sameti
%}

% Part 2: Z-Transform

syms x y t s
assume(t, 'positive')

%% 1.
f1 = t*heaviside(t - 1);
f2 = sin(t)*exp(-4*t)*heaviside(t);
f3 = 2*t*cos(3*t)*heaviside(t);

disp('1.')
fprintf('F1 = ')
disp(laplace(f1))
fprintf('F2 = ')
disp(laplace(f2))
fprintf('F3 = ')
disp(laplace(f3))


%% 2.
F1 = exp(-3*s)/(s*(s + 1));
F2 = 4/(s*(s^2 + 4));
F3 = 1/(s^2 + 3*s + 1);

disp('2.')
fprintf('f1 = ')
disp(ilaplace(F1))
fprintf('f2 = ')
disp(ilaplace(F2))
fprintf('f1 = ')
disp(ilaplace(F3))

%% 3.
G = 8/(s^2 + s + 4);
g(t) = ilaplace(G);

G_unit = G/s;
g_unit(t) = ilaplace(G_unit);

disp('3.')
fprintf('Dirac response = ')
disp(g)
fprintf('Unit step response = ')
disp(g_unit)

subplot(2,1,1)
fplot(g)
title('Dirac response')
xlabel('t')

subplot(2,1,2)
fplot(g_unit)
title('Unit step response')
xlabel('t')

figure
H = tf([0 8],[1 1 4]);
bode(H)

%% 4.
G1 = (2*s + 1)/(s^2 + 4*s + 7)/s;
G2 = (2*s + 1)/(s^2 + 6*s + 7)/s;

g1 = ilaplace(G1);
g2 = ilaplace(G2);

figure
a = 4;
subplot(2,1,1)
fplot(g1)
title('a = 4')

subplot(2,1,2)
fplot(g2)
title('a = 6')

disp('limit g(a=4)(t), t -> +inf =')
disp(limit(g1, t, sym(inf)))
disp('limit g(a=6)(t), t -> +inf =')
disp(limit(g2, t, sym(inf)))

t1 = vpasolve(diff(g1,t));
t2 = vpasolve(diff(g2,t));

disp('g1 maximum value =')
disp(double(subs(g1, t, t1)))
disp('g2 maximum value =')
disp(double(subs(g2, t, t2)))

disp('t1 where g1 is maximum = ')
disp(double(t1))
disp('t2 where g1 is maximum = ')
disp(double(t2))


