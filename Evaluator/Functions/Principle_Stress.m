function Principle_Stress()
%PRINCIPLE_STRESS Summary of this function goes here
%   Detailed explanation goes here
    sigma_x = input(sprintf("\tEnter σₓ: "));
    sigma_y = input(sprintf("\tEnter σᵧ: "));
    tau_xy = input(sprintf("\tEnter τₓᵧ: "));
    
    %Calculate Principal Plane
    denom = (sigma_x - sigma_y) / 2;
    principal_plane = 0.5 * atand(tau_xy / denom);
    
    %Calculate R
    R = sqrt((tau_xy ^ 2) + (((sigma_x - sigma_y) / 2)^2));
    
    %Calculate σ₁
    sigma_one = ((sigma_x + sigma_y) / 2) + R;
    
    %Calculate σ₂
    sigma_two = ((sigma_x + sigma_y) / 2) - R;
    
    %Calculate Shear Plane
    shear_plane = principal_plane;
    
    %Calculate τₘₐₓ
    tau_max = R;
    
    %Calculate σ_avg
    sigma_avg = (sigma_x + sigma_y) / 2;
    
    %Calculate tau_max_overall
    in_plane = (sigma_one - sigma_two) / 2;
    out_plane_max = sigma_one / 2;
    out_plane_min = sigma_two / 2;

    overall_max_tau = max([abs(in_plane), abs(out_plane_max), abs(out_plane_min)]);
    if(overall_max_tau == in_plane)
        plane_res = "In-Plane";
    else
        plane_res = "Out-Plane";
    end
    
    %Calculate σₘₐₓ
    sigma_max = sigma_one;
    sigma_min = sigma_two;
    
    if(sigma_max < 0)
        sigma_max = 0;
    elseif(sigma_min > 0)
        sigma_min = 0; 
    end
    
    %Display Results
    fprintf("σ₁: %f\n", sigma_one);
    fprintf("σ₂: %f\n", sigma_two);
    fprintf("τₘₐₓ: %f\n", tau_max);
    fprintf("Overall τₘₐₓ: %f (%s)\n", overall_max_tau, plane_res);
    fprintf("θₚ: %f ± 90\n", principal_plane);
    fprintf("θτ: %f ± 45\n", shear_plane);
    fprintf("R: %f\n", R);
    fprintf("Stress on Shear Plane: %f\n", sigma_avg);
    fprintf("Max Stress: %f\n", sigma_max);
    fprintf("Min Stress: %f\n\n", sigma_min); 
end

