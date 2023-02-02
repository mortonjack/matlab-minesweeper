function [nRows, nCols, nMines] = selectDifficulty(difficulty)
% Select a difficulty. Valid inputs are integers 0-4.
% selectDifficulty(0) will let you choose the difficulty.
% Outputs [rows, columns, mines]

if (difficulty == 0)
    % Allow user to select difficulty
    DIFFICULTY_VEC = ["easy", "medium", "hard", "extreme", "custom"];
    DIFFICULTY_MESSAGE = sprintf("Select your difficulty\nEasy - 1\n" ... 
    + "Medium - 2\nHard - 3\nExtreme - 4\nCustom - 5\nEnter: ");
    % Recieve user input
    while (difficulty == 0)
        difficulty = input(DIFFICULTY_MESSAGE);
        if (difficulty ~= 1 && difficulty ~= 2 && difficulty ~= 3 && ...
        difficulty ~= 4 && difficulty ~= 5)
            difficulty = 0;
            fprintf("Invalid input. Please try again.\n");
        end
    end
    % Confirmation message
    fprintf("\nYou have selected the %s difficulty.\n", ... 
    DIFFICULTY_VEC(difficulty));
end

% Index correlates to difficulty variable
% Each row stores data in the form [height, width, amount of mines]
DIFFICULTY_SIZE = [ 8,  8, 10;  % easy- 8x8, 10 mines
                   10, 10, 14;  % medium- 10x10, 14 mines
                   12, 12, 20;  % hard- 12x12, 20 mines
                   16, 16, 40]; % extreme- 16x16, 40 mines

% Creating outputs for numbers of rows, columns, and mines
if (difficulty ~= 5)
    nRows = DIFFICULTY_SIZE(difficulty, 1);
    nCols = DIFFICULTY_SIZE(difficulty, 2);
    nMines = DIFFICULTY_SIZE(difficulty, 3);
else % custom difficulty
    nRows = round(input("Enter amount of rows: "));
    nCols = round(input("Enter amount of columns: "));
    nMines = round(input("Enter amount of mines: "));
    % Check for valid input
    if (nRows < 1)
        nRows = 1;
    end
    if (nCols < 1)
        nCols = 1;
    end
    if (nMines < 1)
        nMines = 1;
    elseif (nMines >= nRows*nCols)
        nMines= nRows*nCols - 1;
    end
end
end