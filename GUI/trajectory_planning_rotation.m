function[theta_vector, re, theta_plot] = trajectory_planning_rotation(B, t, step)
    theta_vector = zeros(1);
    re = [];
    theta_plot = [];
    j = 2;
    for i=4:3:size(B,1)
        %R_i = eye(3);
        R_i = B(i-3:i-1, :);
        R_f = B(i:i+2, :);
        R_if = (R_i)'*R_f;
        theta_i = 0;
        theta_f = acos((R_if(1,1)+R_if(2,2)+R_if(3,3)-1) / 2);
        r_i = (1/(2*sin(theta_f))) * ([R_if(3,2)-R_if(2,3), ...
             R_if(1,3)-R_if(3,1), R_if(2,1)-R_if(1,2)]);
        coeff_theta = polynomialCoefficients(theta_i, theta_f, 0, 0, t(j-1), t(j));    
        %Variabili per il plot
        if (i == 4)
            theta_plot = [theta_i];
            %re = [r_i];
        end
        theta_plot = [theta_plot;theta_f];
        re = [re; r_i];
        
        %Cancelliamo il primo elemento così da non avere lo stesso punto
        %due volte
        theta_vector(end,:) = [];
        for k=t(j-1):step:t(j)
            theta = third_grade_polynomial_onecoeff(t(j-1), k, coeff_theta);
            theta_vector = [theta_vector; theta];
        end
        j = j+1;
    end
end
