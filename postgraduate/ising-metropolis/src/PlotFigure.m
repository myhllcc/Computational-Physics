function PlotFigure(SpinMatrix)
%PlotFigure: plot the spin matrix.
%   Plot the matrix of spin in which up and down spins are represented by
%   different square colour block. 
    for i = 1:size(SpinMatrix,1)
        for j = 1:size(SpinMatrix,2)
            spin_value(i,j) = SpinMatrix(i,j).value;
        end
    end
    image(spin_value,'CDataMapping','scaled')
    xlabel('x')
    ylabel('y')
end 