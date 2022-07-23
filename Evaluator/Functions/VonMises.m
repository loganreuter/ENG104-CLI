function VonMises()
%VONMISES Summary of this function goes here
%   Detailed explanation goes here
    sigma_fail = input(sprintf("\tEnter σf: "));
    
    sigma_one = input(sprintf("\tEnter σ₁: "));
    sigma_two = input(sprintf("\tEnter σ₂: "));
    
    res = sqrt((sigma_one * sigma_one) - (sigma_one * sigma_two) + (sigma_two * sigma_two));
    
    if(res <= sigma_fail)
       disp("Passed"); 
    else
        disp("Failed");
    end
    
    fprintf("σᵥₒₙ: %f\n\n", res);
end


