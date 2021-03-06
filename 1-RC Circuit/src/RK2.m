function [x_values, y_values] = RK2(ODE, step_size, final_val, xi, yi, RKMETHOD)
    % ODE solver
    % @param ODE The ODE to be solved in the form y' = f(x, y)
    % @param step_size aka h The distance on the x-axis between two
    % consecutive steps
    % @param final_val The x-value up to which the ODE is evaluated
    % @param xi The initial x-value
    % @param yi The initial y-value
    
    % Calculate the number of steps
    N = round((final_val - xi) / step_size);
    % Initialise output arrays
    x_values = zeros(1, N);
    y_values = zeros(1, N);
    x_values(1) = xi;
    y_values(1) = yi;

    %%%%%%%% EDIT VALUE OF A FOR DIFFERENT METHODS %%%%%%%
    % For Dynamic user input:
    
    a = RKMETHOD;
    % For heun
    % a = 0.5;
    % For Midpoint
    % a = 0;
    % For Ralston
    %a = 1/3;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    b = 1-a;
    p = 1/(2*b);
    q = p;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Using the formula y_(i+1) = y(i) + h*g(x_i, y_i, h)
    % Where g = a*k_1 + b*k_2
    % And k_1 = f(x_i, y_i)
    % And k_2 = f(x_i + p*h, y_i + q*k_1*h)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Run for N - 1 iterations
    for i = 1 : N - 1
       K_one = ODE(x_values(i), y_values(i));
       x_values(i+1) = x_values(i) + step_size;
       
       K_two = ODE(x_values(i)+(p*step_size), y_values(i)+q*K_one*step_size);
       y_values(i+1) = y_values(i)+step_size*(a*K_one+b*K_two);
       
    end
    % Return the output arrays
end

