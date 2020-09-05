clear all;
close all;

L = 0.4125;
Rc = 10;
Rs = 1;
Km = 6.5308*10^-5;
Mb = 0.068;
G = 9.81;


for V = 23
    
    sim ('MagLevNonLinearModel.slx')
    figure();
    plot(X.time,X.signals.values);
    grid on;
    ylim([-0.01 0.02]);
    title('Non-Linear Model Mag Lev');
    ylabel('Position(m)');
    xlabel('Time (seconds)');
end

for V = 23
    
    sim ('MagLevNonLinearModel.slx')
    figure();
    plot(I.time,I.signals.values);
    grid on;
    xlim([-0.1 5]);
    title('Non-Linear Model Mag Lev');
    ylabel('Current(A)');
    xlabel('Time (seconds)');
end