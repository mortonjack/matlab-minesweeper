function makeMove()
% Make a move. 
% Reveal, flag, or unflag a tile, or quit the game.

% declare global vars
global gameOver;
global minefield;
global minefieldDisplay;
global mineCount;
global loadGame;

% declare tileInterface
persistent tileInterface; % Stores whether a tile is revealed/flagged/etc
if isempty(tileInterface)
    % initialise tileInterface
    tileInterface = zeros(size(minefield));
end
% declare tileTally
persistent tileTally; % Counts # of revealed tiles
if isempty(tileTally)
    % initialise tileTally
    tileTally = 0;
end

% load previous game
if loadGame == true
    load('prevGame.mat', 'tileTally', 'tileInterface');
    loadGame = false;
end

% Message for inputting user move
MOVE_MESSAGE = sprintf("\nWhat type of move will you make? (Enter a " ...
    + "letter)\nReveal tile ('r'), Flag tile ('f'), " ...
    + "Unflag tile ('u'), Exit & save ('e')\n");

% Get minefield size
[nRows, nCols] = size(minefield);

% Looping until valid input
validMoveType = false;
while (validMoveType == false)
    % User chooses move type
    moveType = input(MOVE_MESSAGE, 's');
    if (moveType == 'e') % quit game
        gameOver = true;
        fprintf("\nSaving...\n");
        % save game to prevGame.mat
        save('prevGame.mat', 'minefield', 'minefieldDisplay', ... 
            'tileInterface', 'tileTally', 'mineCount');
        fprintf("Game saved.\n\n");
        return
    end
    % User selects tile
    row = round(input("Choose row: "));
    col = round(input("Choose column: "));
    % Check tile is within minefield boundaries
    if (row < 1)
        row = 1;
    elseif (row > nRows)
        row = nRows;
    end
    if (col < 1)
        col = 1;
    elseif (col > nCols)
        col = nCols;
    end
    % Check movetype and validity of the move
    switch ([moveType, tileInterface(row, col)])
        % Successful cases
        case (['r', 0]) % reveal
            tileInterface(row, col) = 1;
            validMoveType = true;
            % Check if tile has a mine
            if (minefield(row, col) == 0) % no mine
                [tileTally, tileInterface] = ...
                    revealTile(row, col, tileTally, tileInterface);
                checkWin(tileTally);
            else % mine
                tileInterface(row, col) = 3;
                gameOver = true;
                minefieldDisplay(row, col*3 - 2) = 'X'; % display X
                fprintf("\n");
                disp(minefieldDisplay);
                fprintf("\nYou lose!\n");
                exportGame(false, tileInterface);
            end
        case (['f', 0]) % flag
            tileInterface(row, col) = 2;
            minefieldDisplay(row, col*3 - 2) = char(9873);
            validMoveType = true;
        case (['u', 2]) % unflag
            tileInterface(row, col) = 0;
            minefieldDisplay(row, col*3 - 2) = '.';
            validMoveType = true;
        % Error cases
        case ({['r', 1], ['f', 1], ['u', 1]})
            fprintf("Error: This tile is already revealed.\n");
        case ({['r', 2], ['f', 2]})
            fprintf("Error: This tile is flagged.\n")
        case (['u', 0])
            fprintf("Error: This tile isn't flagged.\n");
        otherwise
            fprintf("Invalid move type. Please try again.\n");
    end
end
end