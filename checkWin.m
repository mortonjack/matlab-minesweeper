function checkWin(tileTally)
% Check if the game is won
% Format checkWin(nTilesRevealed)

global minefield;
global mineCount;
global minefieldDisplay;
global gameOver;

[nRows, nColumns] = size(minefield);

if (tileTally == nRows * nColumns - mineCount)
    fprintf("\n");
    disp(minefieldDisplay);
    fprintf("\nYou win!\n");
    exportGame(true);
    gameOver = true;
end
end