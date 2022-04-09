function [p] = third_grade_polynomial_threecoeff(ti, tc, coeff_x, coeff_y, coeff_z)
  t = tc - ti;
  p(1) = coeff_x(1) + coeff_x(2) * t + coeff_x(3) * (t^2) + coeff_x(4) * (t^3);
  p(2) = coeff_y(1) + coeff_y(2) * t + coeff_y(3) * (t^2) + coeff_y(4) * (t^3);
  p(3) = coeff_z(1) + coeff_z(2) * t + coeff_z(3) * (t^2) + coeff_z(4) * (t^3);
end

