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

for V = 23
    
    delta_V = V-v_o;
    
    sim ('MagLevLinearModel.slx')
    figure();
    plot(delta_X.time,delta_X.signals.values+x_o);
    grid on;
    ylim([-0.01 0.02]);
    title('Linear Model Mag Lev');
    ylabel('Position(m)');
    xlabel('Time (seconds)');
end

for V = 23
    
    delta_V = V-v_o;
    
    sim ('MagLevLinearModel.slx')
    figure();
    plot(delta_I.time,delta_I.signals.values+i_o);
    grid on;
    xlim([-0.1 5]);
    title('Linear Model Mag Lev');
    ylabel('Current(A)');
    xlabel('Time (seconds)');
end