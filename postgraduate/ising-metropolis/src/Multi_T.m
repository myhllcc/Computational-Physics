%{
This is used to simulate the system at different temperature. specific_heat
is calculated from the mean square energy and square mean energy. As shown
in the figure, there is a peak in the figure of specific_heat. The
temperature in this case is the curie temperature, which is about 4. This
is consistant with the theoretical prediction. 
%}
clear
dimension = [10,10];
spin_original = GenerateMatrix(dimension);
J = -2;
T = linspace(1,10,20);
iteration = 30000;
final_energy_mean = [];
final_magnetisation_mean = [];
order = 1;
for temperature = T
    clear energy_sameT magnetisation_sameT
    for i = 1:30
        clear energy magnetisation;
        spin = spin_original;
        [energy, magnetisation,spin] = FindE_Mag(spin,J,iteration,dimension,temperature);
        energy_sameT(i) = energy(end) / (dimension(1) * dimension(2));
        magnetisation_sameT(i) = magnetisation(end) / (dimension(1) * dimension(2));
    end
    final_energy_mean(order) = mean(energy_sameT);
    final_energy_square_mean(order) = mean(energy_sameT.^2);
    order = order + 1;
end
specific_heat = 1 ./ T.^2 .* (final_energy_square_mean - final_energy_mean.^2);
f1 = figure('Name','Specific heat');
scatter(T, specific_heat);
f2 = figure('Name','Averaged energy');
scatter(T,final_energy_mean);
