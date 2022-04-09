function [pe] = trajectory_planning_position(A, t, step)
    pe = zeros(1,3);
    for i=2:size(A,1)
        si = 0;
        sf = norm(A(i, :)-A(i-1, :));
        coeff_s = polynomialCoefficients(si, sf, 0, 0, t(i-1), t(i));
        pe(end,:) = [];
        for k=t(i-1):step:t(i)
            s = third_grade_polynomial_onecoeff(t(i-1), k, coeff_s);
            pe = [pe; A(i-1, :) + ((s/norm(A(i, :)-A(i-1, :))) * (A(i, :)-A(i-1, :)))];
        end
    end
end

