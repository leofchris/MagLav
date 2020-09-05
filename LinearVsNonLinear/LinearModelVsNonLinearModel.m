clear all;
close all;

L = 0.4125;
Rc = 10;
Rs = 1;
Km = 6.5308*10^-5;
Mb = 0.068;
G = 9.81;
x_o = 0.007;
i_o = 1.0005;
v_o = 11.0055;

for V = 24
    
    delta_V = V-v_o;
    
    sim ('MagLevLinearModel.slx')
    sim ('MagLevNonLinearModel.slx')
    figure();
    plot(X.time,X.signals.values,delta_X.time,delta_X.signals.values+x_o);
    grid on;
    ylim([-0.001 0.015]);
    xlim([0 2]);
    str = sprintf('Linear Model VS. Non-Linear Model Input voltage of %dV',V);
    title(str);
    ylabel('Position(m)');
    xlabel('Time (seconds)');
    legend('Non-Linear Model', 'Linear Model');
end

for V = 24
    
    delta_V = V-v_o;
    
    sim ('MagLevLinearModel.slx')
    sim ('MagLevNonLinearModel.slx')
    figure();
    plot(I.time,I.signals.values,delta_I.time,delta_I.signals.values+i_o);
    grid on;
    xlim([-0.01 0.25]);
    ylim([0 2.2525]);
    str = sprintf('Linear Model VS. Non-Linear Model Input voltage of %dV',V);
    title(str);
    ylabel('Current(A)');
    xlabel('Time (seconds)');
    legend('Non-Linear Model', 'Linear Model');
end