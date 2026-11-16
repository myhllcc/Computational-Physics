function [Energy,Magnetisation] = Cal(SpinMatrix,J)
%Cal: Calcual the energy and magnetisation of a given spin matrix
%   Slow version to calculate the energy and magnetisation of a given spin
%   matrix as it needs to traverse all elements in the spin. 
    Energy = 0;
    Magnetisation = 0;
    for i = 1:size(SpinMatrix,1)
        for j = 1:size(SpinMatrix,2)
            Magnetisation = Magnetisation + SpinMatrix(i,j).value;
            if size(SpinMatrix(i,j).neighbour,2) > 1
                for n = 2:size(SpinMatrix(i,j).neighbour,2)
                    ni = SpinMatrix(i,j).neighbour(1,n);
                    nj = SpinMatrix(i,j).neighbour(2,n);
                    Energy = Energy + SpinMatrix(i,j).value * SpinMatrix(ni,nj).value;
                end 
            end
        end 
    end
    Energy = J * Energy / 2;
end 