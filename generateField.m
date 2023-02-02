function generateField(nRows, nColumns, nMines)
% Generates and outputs minefield vector, storing locations of mines
% Format: generateField(nRows, nColumns, nMines)

% Declare global vars
global minefield;

% Ensure mines don't outnumber the number of tiles
if nMines < (nRows * nColumns)
    minePlaced = false;
    minefield = zeros(nRows, nColumns); % Stores locations of the mines
    for i = 1:1:nMines % Fill in mines
        while (minePlaced == false)
            % Choose random position to place mine
            randRow = randi(nRows);
            randColumn = randi(nColumns);
            % Check if randomly chosen position doesn't already have a mine
            if minefield(randRow, randColumn) == 0
                minePlaced = true;
                minefield(randRow, randColumn) = 1;
            end
        end
        minePlaced = false;
    end
else % When mines equal or outnumber tiles
    minefield = ones(nRows, nColumns);
    % Remove mine from a single tile
    minefield(randi(nRows), randi(nColumns)) = 0;
end
end