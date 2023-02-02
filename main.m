% MINESWEEPER
% A Text-Based Console Game

clear
clc
rng('shuffle');

% Declare global vars
global gameOver;
global minefieldDisplay;
global quitGame;

% Loop program until user quits
quitGame = false;
while quitGame == false
    % Start a game
    clear makeMove;
    startGame();
    % Play game
    while (gameOver == false)
        % Display gameboard
        fprintf("\n");
        disp(minefieldDisplay);
        % Make move
        makeMove();
    end
end