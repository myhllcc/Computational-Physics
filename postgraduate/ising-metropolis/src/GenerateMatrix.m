function SpinMatrix = GenerateMatrix(dimension)
% GenerateMatrix: Generate matrix.
%   The input is the required dimension of the matrix. The output is the
%   matrix of spin.
    SpinMatrix = struct('neighbour',[],'value',{});
    for i = 1:dimension(1)
        for j = 1:dimension(2)
            random_number = rand;
            if random_number >=0.5
                SpinMatrix(i,j).value = 1;
            else 
                SpinMatrix(i,j).value = -1;
            end 
            SpinMatrix(i,j).neighbour = SquareNeighbour(i,j,dimension);
        end
    end
end 