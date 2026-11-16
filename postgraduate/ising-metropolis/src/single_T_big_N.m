%{
This use the quick version to show the behaviour spin configuration when 
the lattice dimension is big and temperature is low. The dimension is
chosed to be 50 * 50. The totle iteration time is 100000. 6 Figures are
ploted to show the spin configurations. 
%}
clear
dimension = [50,50];
spin = GenerateMatrix(dimension);
f1 = figure;
tiledlayout(2,3)
J = -2;
T = 1;
iteration = 100000;
nexttile
PlotFigure(spin)
title('0')
spin = GenerateMatrix(dimension);
[energy, magnetisation,spin] = FindE_Mag(spin,J,iteration / 5,dimension,T);
nexttile
PlotFigure(spin)
title('20000')
[energy, magnetisation,spin] = FindE_Mag(spin,J,iteration / 5,dimension,T);
nexttile
PlotFigure(spin)
title('40000')
[energy, magnetisation,spin] = FindE_Mag(spin,J,iteration / 5,dimension,T);
nexttile
PlotFigure(spin)
title('6000')
[energy, magnetisation,spin] = FindE_Mag(spin,J,iteration / 5,dimension,T);
nexttile
PlotFigure(spin)
title('80000')
[energy, magnetisation,spin] = FindE_Mag(spin,J,iteration / 5,dimension,T);
nexttile
PlotFigure(spin)
title('100000')
f2 = figure;
plot(energy)





