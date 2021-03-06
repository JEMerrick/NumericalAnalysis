% Test file

% Define an array of ODEs to test (these should be function handles)

% For each ODE

% Hold on - make sure to set the graphs to differnt colours
%   For each set of input parameters
%       Run the ODE solver ie plot the graphs

% Todo: Add error calculation for the different inputs (perhaps store /
% output to a table


% Just a quick test to check that the solver is working
M1 = "Midpoint Method";
M2 = "Heun's Method";
M3 = "Our Custom Quarter Method";
M4 = "Input V_in";
%%%%%%%%%%%TEST 1: Y = 2.5 %%%%%%%%%%%%%%%%%%

ODE = @(x, y) (2.5-y)*10;
figure; hold on;
[out_x1, out_y1] = RK2(ODE, 0.01, 1.5, 0, 5, 0);
a1 = plot(out_x1, out_y1);

[out_x2, out_y2] = RK2(ODE, 0.01, 1.5, 0, 5, 0.5);
a2 = plot(out_x2, out_y2);

[out_x3, out_y3] = RK2(ODE, 0.01, 1.5, 0, 5, 0.25);
a3 = plot(out_x3, out_y3);
input_x = zeros(1, 2001);
input_y = zeros(1,2001);
for i=1:2001
    input_x(i) = 0.00075*(i-1); 
    input_y(i) = 2.5;    
end
a4 = plot(input_x, input_y);
ylim([2, 5]);

legend([a1; a2; a3; a4], [M1; M2; M3; M4]);
hold off;

title('Test 1: Step signal');
xlabel('Time/ms');
ylabel('Voltage/V');


%%%%%%%%%%%TEST 2: Y = Impulse signal %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((2.5)*exp(-(x^2/0.0001))-y)*10;
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.1, 1, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.1, 1, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.1, 1, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0005*(i-1); 
    input_y(i) = 2.5*exp(-((input_x(i))^2/0.0001));    
end
a7 = plot(input_x, input_y);
ylim([0, 5]);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 2: Impulse signal');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 3: Y = Decay signal %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((2.5)*(exp(-x/0.1)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.1, 1, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.1, 1, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.1, 1, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0005*(i-1); 
    input_y(i) = 2.5*exp(-(input_x(i)/0.1));    
end
a7 = plot(input_x, input_y);
ylim([0, 5]);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 3: Decay signal');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 4: Y = Sine, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.001, 0.5, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.001, 0.5, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.001, 0.5, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.00025*(i-1); 
    input_y(i) = 5*sin(2*pi*(10)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 4: Sine, period 100us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 5: Y = Sine, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(10^2)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.0005, 0.2, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.0005, 0.2, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.0005, 0.2, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0001*(i-1); 
    input_y(i) = 5*sin(2*pi*(10^2)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 5: Sine, period 10us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 6: Y = Sine, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*5*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.003, 0.6, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.003, 0.6, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.003, 0.6, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0003*(i-1); 
    input_y(i) = 5*sin(2*pi*5*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 6: Sine, period 500us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 7: Y = Sine, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sin(2*pi*(1)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.03, 3, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.03, 3, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.03, 3, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0015*(i-1); 
    input_y(i) = 5*sin(2*pi*(1)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 7: Sine, period 1000us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 8: Y = Square, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.001, 0.5, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.001, 0.5, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.001, 0.5, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.00025*(i-1); 
    input_y(i) = 5*square(2*pi*(10)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 8: Square, period 100us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 9: Y = Square, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(10^2)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.0002, 0.2, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.0002, 0.2, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.0002, 0.2, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0001*(i-1); 
    input_y(i) = 5*square(2*pi*(10^2)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 9: Square, period 10us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 10: Y = Square, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*5*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.003, 0.6, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.003, 0.6, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.003, 0.6, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0003*(i-1); 
    input_y(i) = 5*square(2*pi*5*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 10: Square, period 500us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 11: Y = Square, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*square(2*pi*(1)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.03, 3, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.03, 3, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.03, 3, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0015*(i-1); 
    input_y(i) = 5*square(2*pi*(1)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 11: Square, period 1000us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 12: Y = Sawtooth, period 100us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.001, 0.5, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.001, 0.5, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.001, 0.5, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.00025*(i-1); 
    input_y(i) = 5*sawtooth(2*pi*(10)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 12: Sawtooth, period 100us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 13: Y = Sawtooth, period 10us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(10^2)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.0002, 0.2, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.0002, 0.2, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.0002, 0.2, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0001*(i-1); 
    input_y(i) = 5*sawtooth(2*pi*(10^2)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 13: Sawtooth, period 10us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 14: Y = Sawtooth, period 500us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*5*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.003, 0.6, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.003, 0.6, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.003, 0.6, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0003*(i-1); 
    input_y(i) = 5*sawtooth(2*pi*5*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 14: Sawtooth, period 500us');
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 15: Y = Sawtooth, period 1000us %%%%%%%%%%%%%%%%%%
ODE = @(x,y) ((5*sawtooth(2*pi*(1)*x)-y)*10);
figure; hold on;
[out_x4, out_y4] = RK2(ODE, 0.03, 3, 0, 5, 0);
a4 = plot(out_x4, out_y4);

[out_x5, out_y5] = RK2(ODE, 0.03, 3, 0, 5, 0.5);
a5 = plot(out_x5, out_y5);

[out_x6, out_y6] = RK2(ODE, 0.03, 3, 0, 5, 0.25);
a6 = plot(out_x6, out_y6);

for i=1:2001
    input_x(i) = 0.0015*(i-1); 
    input_y(i) = 5*sawtooth(2*pi*(1)*input_x(i));    
end
a7 = plot(input_x, input_y);

legend([a4; a5; a6; a7], [M1; M2; M3; M4]);
hold off;
title('Test 15: Sawtooth, period 1000us');
xlabel('Time/ms');
ylabel('Voltage/V');
