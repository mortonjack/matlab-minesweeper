function [tileTally, tileInterface] = ...
    revealTile(row, col, tileTally, tileInterface)
% Reveal a tile
% Format: revealTile(row, column, tileTally, tileInterface)
% Outputs [tileTally, tileInterface]

global minefieldDisplay;
global minefieldRevealed;

tileInterface(row, col) = 1;
% display tile
minefieldDisplay(row, col*3 - 2) = int2str(minefieldRevealed(row, col));
tileTally = tileTally + 1;

% Uncomment for testing: 
% fprintf("\n");
% disp(minefieldDisplay);

% Check if zero
[tileTally, tileInterface] = zeroCheck(row, col, tileTally, tileInterface);

end