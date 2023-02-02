function [tileTally, tileInterface] = ...
    zeroCheck(row, col, tileTally, tileInterface)
% Checks if a tile is zero, then reveals all tiles around it.
% Format: zeroCheck(row, column, tileTally, tileInterface)
% Outputs [tileTally, tileInterface]

% declare global vars
global minefield;
global minefieldRevealed;
% get minefield size
[nRows, nCols] = size(minefield);

% check if zero 
if (minefieldRevealed(row, col) == 0)
    % iterate through surrounding tiles
    for i = -1:1:1
        for j = -1:1:1
            % check tileInterface(row+i, col+i) exists
            if (row+i > 0 && row+i <= nRows && col+j > 0 && col+j <= nCols)
                % check if unrevealed
                if (tileInterface(row+i, col+j) == 0)
                    [tileTally, tileInterface] = ...
                        revealTile(row+i, col+j, tileTally, tileInterface);
                end
            end
        end
    end
end
end