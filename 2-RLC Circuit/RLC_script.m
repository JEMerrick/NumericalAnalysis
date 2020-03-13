close all;

% Circuit parameters
R = 250;
C = 3.5 * 10^-6;
L = 0.6;
Q0 = 500 * 10^-9;
Q_dash_0 = 0;

%%%%%%%%%%%TEST 1: Step signal  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The input to the system as a function of x
input = @(x) 5;

ODE_y = @(x, y, z) z;
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 1: Step signal')

% Seconds or milliseconds????
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 2: Y = Impulse and decay signal 1 %%%%%%%%%%%%%%%%%%%%%%%%
input = @(x) 5*exp(-x^2 / 0.003);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 2: Impulse decay signal')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 3: Square wave with frequency f = 109 Hz %%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(109)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.07, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 3: Square wave, frequency 109 Hz')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 4: Square wave with frequency f = 5 Hz %%%%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(5)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 4: Square wave, frequency 5 Hz')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 5: Square wave with frequency f = 500 Hz %%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(500)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.000003, 0.07, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 5: Square wave, frequency 500 Hz')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 6: Sine wave with frequency f = 109 Hz %%%%%%%%%%%%%%%%%%
input = @(x) sin(2*pi*(109)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.07, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 6: Sine wave, frequency 109 Hz')
xlabel('Time/ms');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 7: Sine wave with frequency f = 5 Hz %%%%%%%%%%%%%%%%%%%%
input = @(x) sin(2*pi*(5)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 7: Sine wave, frequency 5 Hz')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 8: Sine wave with frequency f = 500 Hz %%%%%%%%%%%%%%%%%%
input = @(x) sin(2*pi*(500)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.07, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 8: Sine wave, frequency 500 Hz')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -- New circuit 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% critically damped
% Circuit parameters
R = 2000;
C = 300 * 10^-9;
L = 0.3;
Q0 = 500 * 10^-9;
%Q0 = 0;
%Q_dash_0 = 0;


%%%%%%%%%%%TEST 1: Step signal  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The input to the system as a function of x
input = @(x) 5;

ODE_y = @(x, y, z) z;
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.02, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 1: Step signal (CD)')

xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 2: Square wave with frequency f = 5 Hz %%%%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(5)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 4�2: Square wave, frequency 5 Hz (CD)')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 3: Square wave at resonance frequency (350.5 Hz) %%%%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(350.5)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.000003, 0.03, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 3: Square wave, resonance frequency (350.5 Hz)(OD)')
xlabel('Time/s');
ylabel('Voltage/V');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -- New circuit 2-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% overdamped
% Circuit parameters
R = 2000;
C = 3 * 10^-6;
L = 0.8;
%Q0 = 500 * 10^-9;
Q0 = 0;
Q_dash_0 = 0;

%%%%%%%%%%%TEST 1: Step signal  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The input to the system as a function of x
input = @(x) 5;

ODE_y = @(x, y, z) z;
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.05, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 1: Step signal (OD)')

xlabel('Time/s');
ylabel('Voltage/V');


%%%%%%%%%%%TEST 2: Square wave with frequency f = 5 Hz %%%%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(5)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.00003, 0.3, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 2: Square wave, frequency 5 Hz (OD)')
xlabel('Time/s');
ylabel('Voltage/V');

%%%%%%%%%%%TEST 3: Square wave at resonance frequency (102.7 Hz) %%%%%%%%%%%%%%%%%%%%
input = @(x) square(2*pi*(102.7)*x);
ODE_z = @(x, y, z) ((input(x) - R*z - (1/C)*y) / L);

[out_x, out_y, out_z] = RK4(ODE_y, ODE_z, 0.000003, 0.03, 0, Q0, Q_dash_0);

% Calculate V_out as R*z
V_out = R*out_z;

figure; hold on;
plot(out_x, V_out);
input_vals = arrayfun(input, out_x);
plot(out_x, input_vals);
title('Test 3: Square wave, resonance frequency (102.7 Hz)(OD)')
xlabel('Time/s');
ylabel('Voltage/V');

