function Mohr()
%MOHR Summary of this function goes here
%   Detailed explanation goes here
    
    sigma_x = input(sprintf("\tEnter σₓ: "));
    sigma_y = input(sprintf("\tEnter σᵧ: "));
    tau_xy = input(sprintf("\tEnter τₓᵧ: "));
    
    th = 0:pi/50:2*pi;
    
    v = [sigma_x, -tau_xy];
    h = [sigma_y, tau_xy];
    c = [(sigma_x + sigma_y) / 2, 0];
    R = sqrt((tau_xy ^ 2) + ((sigma_x - sigma_y)/ 2)^2);
    
    hold on
    axis square
    grid on
    %Display V point
    text(v(1) * 1.1, v(2) * 1.1, "V");
    plot(v(1), v(2), "r*");
    
    %Display H point
    text(h(1) * 1.1, h(2) * 1.1, "H");
    plot(h(1), h(2), "r*");
    
    %Display center point
    text(c(1), c(2), "C");
    plot([v(1) h(1)], [v(2) h(2)]);
    
    %Draw axes
    plot([c(1) c(1)], [R  -R], ":");
    
    %Draw circle
    plot(R * cos(th) + c(1), R * sin(th) + c(2), "k");
    
    hold off
    
end

