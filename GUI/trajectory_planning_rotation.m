function[theta_vector, re, theta_plot] = trajectory_planning_rotation(B, t, step)
    theta_vector = zeros(1);
    theta_plot = [];
    re = zeros(1,3);
    j = 2;
    for i=4:3:size(B,1)
        previous_matrix = B(i-3:i-1, :);
        current_matrix = B(i:i+2, :);
        %THETA -> ANGOLO DI ROTAZIONE
        theta_previous = acos((previous_matrix(1,1)+previous_matrix(2,2)+previous_matrix(3,3)-1) / 2);
        theta_current = acos((current_matrix(1,1)+current_matrix(2,2)+current_matrix(3,3)-1) / 2);
        coeff_theta = polynomialCoefficients(theta_previous, theta_current, 0, 0, t(j-1), t(j));
        
        %RE -> ASSE DI ROTAZIONE
        r_previous = (1/(2*sin(theta_previous))) * ([previous_matrix(3,2)-previous_matrix(2,3), ...
            previous_matrix(1,3)-previous_matrix(3,1), previous_matrix(2,1)-previous_matrix(1,2)]);
        r_current = (1/(2*sin(theta_current))) * ([current_matrix(3,2)-current_matrix(2,3), ...
            current_matrix(1,3)-current_matrix(3,1), current_matrix(2,1)-current_matrix(1,2)]);
        coeff_re_x = polynomialCoefficients(r_previous(1), r_current(1), 0, 0, t(j-1), t(j));
        coeff_re_y = polynomialCoefficients(r_previous(2), r_current(2), 0, 0, t(j-1), t(j));
        coeff_re_z = polynomialCoefficients(r_previous(3), r_current(3), 0, 0, t(j-1), t(j));
        
        %Variabili per il plot
        if (i == 4)
            theta_plot = [theta_previous];
        end
        theta_plot = [theta_plot;theta_current];
        
        %Cancelliamo il primo elemento così da non avere lo stesso punto
        %due volte
        theta_vector(end,:) = [];
        re(end,:) = [];
        for k=t(j-1):step:t(j)
            theta = third_grade_polynomial_onecoeff(t(j-1), k, coeff_theta);
            theta_vector = [theta_vector; theta];
        end
        for k=t(j-1):step:t(j)
            r = third_grade_polynomial_threecoeff(t(j-1), k, coeff_re_x, coeff_re_y, coeff_re_z);
            re = [re; r];
        end
        j = j+1;
    end
end
