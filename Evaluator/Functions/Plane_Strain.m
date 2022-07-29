function Plane_Strain()
%PLANE_STRAIN Summary of this function goes here
%   Detailed explanation goes here
    youngs_modulus = input(sprintf("\tE: "));
    poissons_ratio = input(sprintf("\tν: "));
    epsilon_x = input(sprintf("\tƐₓ: "));
    epsilon_y = input(sprintf("\tƐᵧ: "));
    
    sigma_x = (youngs_modulus / ((1+poissons_ratio) * (1 - 2 * poissons_ratio))) * (((1 - poissons_ratio) * epsilon_x) + (poissons_ratio * epsilon_y));
    sigma_y = (youngs_modulus / ((1+poissons_ratio) * (1 - 2 * poissons_ratio))) * (((1 - poissons_ratio) * epsilon_y) + (poissons_ratio * epsilon_x));
    sigma_z = ((youngs_modulus * poissons_ratio) / ((1+poissons_ratio) * (1 - 2 * poissons_ratio))) * (epsilon_x + epsilon_y);

    fprintf("σₓ: %f\n", sigma_x);
    fprintf("σᵧ: %f\n", sigma_y);
    fprintf("(Note: might be wrong) σ₂: %f\n\n", sigma_z); 
end

