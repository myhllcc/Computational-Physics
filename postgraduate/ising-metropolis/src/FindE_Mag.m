function [Energy, Magnetisation,SpinMatrix] = FindE_Mag(SpinMatrix,J,iteration,dimension,T)
% FindE_Mag: Fast version to find the changing of energy and
% magnetisation. 
%   The input are initial spin matrix, desired iteration times, dimension of
%   the spin matrix. The output are two arrays recording the changing of
%   energy and magnetisation during the iteration. The other output is the
%   final spin matrix
    [e, mag] = Cal(SpinMatrix, J);
    Energy(1) = e;
    Magnetisation(1) =mag;
    for order = 1:iteration
        random_i = randi(dimension(1));
        random_j = randi(dimension(1));
        newspin = SpinMatrix;
        newspin(random_i, random_j).value = SpinMatrix(random_i, random_j).value * -1;
        neighbour_energy = CalEneighbour(newspin(random_i,random_j),newspin,J);
        if neighbour_energy > 0
            proba = exp(-neighbour_energy * 2  / T);
            my_proba = rand;
            if my_proba <= proba
                SpinMatrix = newspin;
                e = e + neighbour_energy;
                mag = mag + 2 * SpinMatrix(random_i,random_j).value;
            end
        else
            SpinMatrix = newspin;
            e = e + neighbour_energy;
            mag = mag + 2 * SpinMatrix(random_i,random_j).value;
        end
        Energy(order+1) = e;
        Magnetisation(order+1) = mag;
    end
end