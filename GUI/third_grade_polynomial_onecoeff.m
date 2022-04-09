function [p] = third_grade_polynomial_onecoeff(ti, tc, coefficient)
  t = tc - ti;
  p = coefficient(1) + coefficient(2) * t + coefficient(3) * (t^2) + coefficient(4) * (t^3);
end
