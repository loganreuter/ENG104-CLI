function Plane_Stress()
%PLANE_STRESS Summary of this function goes here
%   Detailed explanation goes here
    youngs_modulus = input(sprintf("\tE: "));
    poissons_ratio = input(sprintf("\tν: "));
    epsilon_x = input(sprintf("\tƐₓ: "));
    epsilon_y = input(sprintf("\tƐᵧ: "));
    
    sigma_x = (youngs_modulus / (1 - (possions_ratio ^ 2))) * (epsilon_x + (poissons_ratio * epsilon_y));
    sigma_y = (youngs_modulus / (1 - (possions_ratio ^ 2))) * (epsilon_y + (poissons_ratio * epsilon_x));
    epsilon_z = -(poissons_ratio / youngs_modulus) * (sigma_x + sigma_y);
    
    fprintf("σₓ: %f\n", sigma_x);
    fprintf("σᵧ: %f\n", sigma_y);
    fprintf("Ɛ₂: %f\n\n", epsilon_z);   
end

