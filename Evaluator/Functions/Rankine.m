function Rankine()
%RANKINE Summary of this function goes here
%   Detailed explanation goes here
    sigma_one = input(sprintf("\tEnter σ₁: "));
    sigma_two = input(sprintf("\tEnter σ₂: "));
    sigma_failure = input(sprintf("\tEnter σf: "));
    sigma_three = 0;
    
    res = max(abs(sigma_one), abs(sigma_two), sigma_three);
    if(res < sigma_failure)
       disp("Passed") 
    else
        disp("Failed")
    end
end

