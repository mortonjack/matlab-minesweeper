function generateFieldRevealed()
% Generate Revealed Mine-Field
% Each tile will be numbered based on the number of mines it is adjacent
% to. 

global minefield;
global minefieldRevealed;

% Use temporary vector with two extra rows and columns so calculations can
% be performed on edges and corners. Then 'chop off' the edges when moving
% this data into the revealed mine-field vector.
[nRows, nColumns] = size(minefield);
tempReveal = zeros(nRows + 2, nColumns + 2);
% Iterate through rows and columns
for i = 2:1:nRows+1
    for j = 2:1:nColumns+1
        % If a mine is found, every surrounding element has 1 added to it
        if minefield(i-1, j-1) == 1
            % Iterate through all 8 surrounding tiles, and itself
            for k = -1:1:1
                for l = -1:1:1
                    tempReveal(i+k, j+l) = tempReveal(i+k, j+l) + 1;
                end
            end
        end
    end
end
% Create vector based off tempReveal with no border
% This vector stores how many mines are adjacent to each tile
minefieldRevealed = tempReveal(2:nRows+1, 2:nColumns+1);
end