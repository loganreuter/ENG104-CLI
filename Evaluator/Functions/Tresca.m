function Tresca()
%TRESCA Summary of this function goes here
%   Detailed explanation goes here
    sigma_fail = input(sprintf("\tEnter σf: "));
    
    sigma_one = input(sprintf("\tEnter σ₁: "));
    sigma_two = input(sprintf("\tEnter σ₂: "));
    sigma_three = 0;
    
    tau_max = input(sprintf("\tEnter τₘₐₓ: "));
    
    if(~isempty(sigma_one))
       res = max(abs(sigma_one - sigma_two), abs(sigma_two - sigma_three), abs(sigma_three - sigma_one));
       if(res <= sigma_fail)
          disp("Passed") 
       else
           disp("Failed")
       end
    end
    
    if(~isempty(tau_max))
       if(tau_max <= (sigma_fail / 2))
          disp("Passed") 
       else
          disp("Failed")
       end
    end
end

