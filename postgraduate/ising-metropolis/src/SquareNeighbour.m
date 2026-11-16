function Neighbour = SquareNeighbour(i,j,dimension)
% SquareNeighbour: Finding neighbours in square lattice. 
%   The three input are the x, y postion of a given site and dimension of
%   the spin matrix. The output Neighbour is a array recording the
%   neighbours of the site. 
    Neighbour = [0;0];
    if i < dimension(1)
        Neighbour(1,end+1) = i+1;
        Neighbour(2,end) = j;
    end 
    if i > 1
        Neighbour(1,end+1) = i-1;
        Neighbour(2,end) = j;
    end 
    if j < dimension(2)
        Neighbour(1,end+1) = i;
        Neighbour(2,end) = j+1;
    end 
    if j > 1
        Neighbour(1, end+1) = i;
        Neighbour(2, end) = j-1;
    end
end