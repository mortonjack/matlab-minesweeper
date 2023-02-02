function generateDisplay(vec)
% Generates an unrevealed gameboard to display to the user.
% Same size as the inputted vector, with two spaces between each column.
% Format: generateDisplay(vec)

% Declare global vars
global minefieldDisplay;

% get size of vector
[nRows, nColumns] = size(vec);
% initialise minefieldDisplay as a character vector
minefieldDisplay = int2str(zeros(nRows, nColumns));
% Column indices need to be calculated as 3i-2
for i = 1:1:nRows
    for j = 1:1:nColumns
        minefieldDisplay(i, 3*j-2) = '.';
    end
end
end