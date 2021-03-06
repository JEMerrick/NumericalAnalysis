close all
% the numerical solution is compared to the mathamtically computed exact solution
% the error is then plotted for each method.

% THE EXACT SOLUTION OF THE ODE IS GIVEN BY:

% y = 5(2pi(2pi(e^(-10000x))+sin(20000pix))+cos(20000pix))/(1+4pi^2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. CREATING THE EXACT EQUATION INTO THE MATRIX
% this exact value ranges between x = 0 and 7x10^-4 seconds
% and has 1000 steps. This mean that each step is 0.7us.
exact_x = zeros(1,1000);
exact_y = zeros(1,1000);
for i = 1:10000
    exact_x(i)= 0.00000007*i;
    exact_y(i) = (5*(2*pi*(2*pi*exp(-10000*exact_x(i))+sin(20000*pi*exact_x(i)))+cos(20000*pi*exact_x(i))))/(1+(4*pi*pi));
end

Solution = @(x) (5*(2*pi*(2*pi*exp(-10000*x)+sin(20000*pi*x))+cos(20000*pi*x)))/(1+(4*pi*pi));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%2. Analytical Solving
ODE =@(x,y) ((5*cos(2*pi*(10^4)*x)-y)*10000);

%%%%%% SETTING UP THE LEGEND %%%%%%
Aa = "Midpoint Method";
Bb = "Heun Method";
Cc = "Our Custom Quarter Method";
Ee = "Exact Solution";
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% SETTING THE STEP SIZES %%%%%%
steps = [2, 4, 5, 8, 10, 16, 20, 25, 40, 50, 80, 100, 125, 200, 250, 400, 500, 625, 1000, 1250, 2000, 2500, 5000];
stepsize = 10000./steps.*0.00000007;
%%%%%% DO THE LOOP THROUGH ALL FACTORS OF 10000 %%%%%%

A_x=zeros(1,23);
A_yRMS=zeros(1,23);
A_y=zeros(1,23);
B_x=zeros(1,23);
B_yRMS=zeros(1,23);
B_y=zeros(1,23);
C_x=zeros(1,23);
C_yRMS=zeros(1,23);
C_y=zeros(1,23);

for i = 1:23
    [out_x1, out_y1] = RK2(ODE, stepsize(i), 0.0007, 0, 5, 0);
    [out_x2, out_y2] = RK2(ODE, stepsize(i), 0.0007, 0, 5, 0.5);
    [out_x3, out_y3] = RK2(ODE, stepsize(i), 0.0007, 0, 5, 0.25);
    figure; hold on;
    title(strcat("Comparison of Graphs - ", num2str(steps(i))," Steps"));
    A = plot(out_x1, out_y1);
    B = plot(out_x2, out_y2);
    C = plot(out_x3, out_y3);
    E = plot(exact_x, exact_y);
    legend([A; B; C; E], [Aa; Bb; Cc; Ee]);
    ylabel("V_{out} / V"); xlabel("time / s");
    hold off;
    A_error_y = zeros(1, steps(i));
    B_error_y = zeros(1, steps(i));
    C_error_y = zeros(1, steps(i));
    for j = 1:steps(i)
        A_error_y(j) =  abs(exact_y((10000/steps(i))*j) - out_y1(j));
        B_error_y(j) =  abs(exact_y((10000/steps(i))*j)- out_y2(j));
        C_error_y(j) =  abs(exact_y((10000/steps(i))*j) - out_y3(j));
    end

    figure; 
    hold on;
    
    title(strcat("Error between numerical and analytical graphs - ", num2str(steps(i)), " Steps"));
    
    ylabel("V_o_u_t / V");
    xlabel("time / s");
    A = plot(out_x1, A_error_y);
    B = plot(out_x2, B_error_y);
    C = plot(out_x3, C_error_y);
    legend([A; B; C], [Aa; Bb; Cc]);
    hold off;
    A_x(i) = log10(stepsize(i));
    A_yRMS(i) = log10(abs(rms(A_error_y)));
    A_y(i) = log10(mean(A_error_y));
    B_x(i) = log10(stepsize(i));
    B_yRMS(i) = log10(abs(rms(B_error_y)));
    B_y(i) = log10(mean(B_error_y));
    C_x(i) = log10(stepsize(i));
    C_yRMS(i) = log10(abs(rms(C_error_y)));
    C_y(i) = log10(mean(C_error_y));
    clear A_error_y;
    clear B_error_y;
    clear C_error_y;
    
end

figure; hold on;
title("log(average error) against log(step size)");
ylabel("log(average error)");
xlabel("log(step size)");
A = plot(A_x, A_y);
B = plot(B_x, B_y);
C = plot(C_x, C_y);
legend([A; B; C], [Aa; Bb; Cc]);
hold off;

figure; hold on;
title("log(rms(error)) against log(step size)");
ylabel("log(rms(error))");
xlabel("log(step size)");
A = plot(A_x, A_yRMS);
B = plot(B_x, B_yRMS);
C = plot(C_x, C_yRMS);
legend([A; B; C], [Aa; Bb; Cc]);
hold off;


