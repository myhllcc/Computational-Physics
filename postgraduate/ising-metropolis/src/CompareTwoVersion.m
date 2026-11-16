%{
This is used to compare the slow version and fast fersion of simulating the
change in spin matrix. The slow vertion takes about 160 times of time than
fast vertion.
%}
clear
J = -2;
T = 0.1;
dimension = [30,30];
spin = GenerateMatrix(dimension);
f1 = figure('Name','Spin_original')
PlotFigure(spin);
spin1 = spin;
spin2 = spin;
iteration = 500;
timeslow = 0;
timefast = 0;

tic
[energy, magnetisation, spin1] = FindE_Mag_slow(spin1,J,iteration,dimension,T);
timeslow = toc
f2 = figure('Name','SLOW_ENERGY');
plot(energy);
xlabel('iteration')
ylabel('energy')
f3 = figure('Name','Spin_slow');
PlotFigure(spin1)

tic
[energy, magnetisation, spin2] = FindE_Mag(spin2, J, iteration, dimension, T);
timefast = toc
f4 = figure('Name','FAST_ENERGY');
plot(energy);
xlabel('iteration')
ylabel('energy')
f5 = figure('Name','Spin_fast');
PlotFigure(spin2)
fprintf('ratio of time_slow with time_fast is %f',timeslow / timefast)
