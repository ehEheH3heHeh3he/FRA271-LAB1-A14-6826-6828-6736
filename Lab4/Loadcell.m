% 98 ohm

calibrate_Voltage = [
    0.03, 0.11, 0.21, 0.32, 0.42, 0.54, 0.70, ...
    0.81, 0.94, 1.03, 1.15, 1.27, 1.39, 1.48, ...
    1.60, 1.74, 1.86, 2.01, 2.13, 2.24, 2.35 ];

weight = [
    0    , 0.506, 0.937, 1.443, 1.866, 2.373, 3.059, ...
    3.565, 4.062, 4.490, 4.996, 5.480, 5.986, 6.411, ...
    6.917, 7.468, 7.974, 8.660, 9.166, 9.599, 10.105 ];

weight_calculated = [
    0.022, 0.512, 0.910, 1.405, 1.809, 2.284, 2.918, ...
    3.391, 3.854, 4.230, 4.701, 5.172, 5.634, 6.004, ...
    6.552, 7.191, 7.644, 8.215, 8.747, 9.109, 9.662 ];

[pLinear,SLinear] = polyfit(calibrate_Voltage,weight,1);

yLinear = polyval(pLinear,calibrate_Voltage);

% Regression plot
% plot(calibrate_Voltage, weight, 'o', Voltage, yLinear, '-');
% grid on;
% grid minor;

% Accuracy test
plot(weight,weight_calculated,'',weight,weight);

fprintf('Weight = %.6f * Voltage + %.6f\n', pLinear(1), pLinear(2));