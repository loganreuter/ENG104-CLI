function Stress_Prime()
%PLANE_STRESS Summary of this function goes here
%   Detailed explanation goes here
    sigma_x = input(sprintf("\tEnter σₓ: "));
    sigma_y = input(sprintf("\tEnter σᵧ: "));
    tau_xy = input(sprintf("\tEnter τₓᵧ: "));
    theta = input(sprintf("\tEnter θ: "));
    
    sigma_x_prime = ((sigma_x + sigma_y) / 2) + (((sigma_x - sigma_y) / 2) * cosd(2 * theta)) + (tau_xy * sind(2 * theta));
    sigma_y_prime = ((sigma_x + sigma_y) / 2) - (((sigma_x - sigma_y) / 2) * cosd(2 * theta)) - (tau_xy * sind(2 * theta));
    tau_x_prime_y_prime = (tau_xy * cosd(2 * theta)) - (((sigma_x - sigma_y) / 2) * sind(2 * theta));
    
    fprintf("σₓ': %f\n", sigma_x_prime);
    fprintf("σᵧ': %f\n", sigma_y_prime);
    fprintf("τₓ'ᵧ': %f\n\n", tau_x_prime_y_prime);
end

