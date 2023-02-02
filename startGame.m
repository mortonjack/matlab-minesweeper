function startGame()
% Start a new game, load an existing game, or quit.

% Declare global vars
global gameOver;
global mineCount;
global quitGame;
global minefield;
global loadGame;
global minefieldDisplay;

isValidSelection = false;
while (isValidSelection == false)
    % Let user select an option
    INPUT_MSG = sprintf("What will you do? (Enter a letter)\n" + ...
    "Start new game ('s'), Load previous game ('l'), Quit game ('q')\n");
    option = input(INPUT_MSG, 's');

    switch option
        case ('s') % start new game
            loadGame = false;
            isValidSelection = true;
            gameOver = false;
            % choose difficulty
            [nRows, nCols, nMines] = selectDifficulty(0);
            mineCount = nMines;
            % vector which stores mine locations
            generateField(nRows, nCols, nMines);
            % vector which stores amount of mines adjacent to each tile
            generateFieldRevealed();
            % vectore which displays minefield to the user
            generateDisplay(minefield);
        case ('l') % load previous game
            isValidSelection = true;
            gameOver = false;
            loadGame = true;
            % load variables
            load('prevGame.mat', 'minefield', 'minefieldDisplay', ... 
                'mineCount');
            % vector which stores amount of mines adjacent to each tile
            generateFieldRevealed();
        case ('q') % quit game
            isValidSelection = true;
            gameOver = true;
            quitGame = true;
        otherwise
            fprintf("Invalid input. Please try again.\n\n");
    end
end
end