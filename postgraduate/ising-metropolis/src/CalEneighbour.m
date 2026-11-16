function Energy = CalEneighbour(Spin,SpinMatrix,J)
% CalEneighbour: Calculate energy of a site. 
%   This is used in the fast version when calculate the energy.  
Energy = 0;
    if size(Spin.neighbour,2) > 1
        for n = 2:size(Spin.neighbour,2)
            ni = Spin.neighbour(1,n);
            nj = Spin.neighbour(2,n);
            Energy = Energy + Spin.value * SpinMatrix(ni,nj).value;
        end 
    end
    Energy = J * Energy;
end 