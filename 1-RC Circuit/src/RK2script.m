

% Test file

% Define an array of ODEs to test (these should be function handles)

% For each ODE

% Hold on - make sure to set the graphs to differnt colours
%   For each set of input parameters
%       Run the ODE solver ie plot the graphs

% Todo: Add error calculation for the different inputs (perhaps store /
% output to a table


% Just a quick test to check that the solver is working

%%%%%%%%%%%TEST 1: Y = 2.5 %%%%%%%%%%%%%%%%%%

ODE = @(x, y) (2.5-y)*10000;
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test 1: Step function');

%%%%%%%%%%%TEST 2: Y = Impulse and decay signal 1 %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((2.5)*exp(-x^2/100)-y)*10000;
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 2.5);
figure;
plot(out_x, out_y);
title('Test2: impulse and decay signal 1');

%%%%%%%%%%%TEST 3: Y = Impulse and decay signal 2 %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((2.5)*(exp(-x/100)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 2.5);
figure;
plot(out_x, out_y);
title('Test2: impulse and decay signal 2');

%%%%%%%%%%%TEST 4: Y = Sine, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10^4)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sine, period 100us');

%%%%%%%%%%%TEST 5: Y = Sine, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10^5)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sine, period 10us');

%%%%%%%%%%%TEST 6: Y = Sine, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10^4)/5*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sine, period 500us');

%%%%%%%%%%%TEST 7: Y = Sine, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10^3)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sine, period 1000us');

%%%%%%%%%%%TEST 8: Y = Square, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10^4)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Square, period 100us');

%%%%%%%%%%%TEST 9: Y = Square, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10^5)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Square, period 10us');

%%%%%%%%%%%TEST 10: Y = Square, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10^4)/5*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Square, period 500us');

%%%%%%%%%%%TEST 11: Y = Square, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10^3)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Square, period 1000us');

%%%%%%%%%%%TEST 12: Y = Sawtooth, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10^4)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sawtooth, period 100us');

%%%%%%%%%%%TEST 13: Y = Sawtooth, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10^5)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sawtooth, period 10us');

%%%%%%%%%%%TEST 14: Y = Sawtooth, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10^4)/5*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sawtooth, period 500us');

%%%%%%%%%%%TEST 15: Y = Sawtooth, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10^3)*x)-y)*10000);
[out_x, out_y] = RK2N(ODE, 0.00003, 0.005, 0, 0);
figure;
plot(out_x, out_y);
title('Test2: Sawtooth, period 1000us');
