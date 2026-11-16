function [Energy, Magnetisation,SpinMatrix] = FindE_Mag_slow(SpinMatrix,J,iteration,dimension,T)
% FindE_Mag: Slow version to find the changing of energy and
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
        [new_e,new_mag] = Cal(newspin,J);
        e_diff = new_e - e;
        if e_diff > 0
            proba = exp(-e_diff / T);
            my_proba = rand;
            if my_proba <= proba
                SpinMatrix = newspin;
                e = new_e;
                mag = new_mag;
                Energy(order+1) = new_e;
                Magnetisation(order+1) = new_mag;
            else
                Energy(order+1) = e;
                Magnetisation(order+1) = mag;
            end
        else
            e = new_e;
            mag = new_mag;
            SpinMatrix = newspin;
            Energy(order+1) = new_e;
            Magnetisation(order+1) = new_mag;
        end 
    end
end 