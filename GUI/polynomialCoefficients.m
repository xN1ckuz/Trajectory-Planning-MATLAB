function [coeff] = polynomialCoefficients(p_i,p_f,v_i,v_f,t_i,t_f)
  coeff = zeros(1,4);
  T = t_f - t_i;
  coeff(1) = p_i;
  coeff(2) = v_i;
  a2_num = -3*(p_i-p_f)-(2*v_i+v_f)*T;
  coeff(3) = a2_num/T^2;
  a3_num = 2*(p_i-p_f)+(v_i+v_f)*T;
  coeff(4) = a3_num/T^3;
end

