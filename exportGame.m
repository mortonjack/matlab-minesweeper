function exportGame(didWin, tileInterface)
% Exports the final gameboard as an image
% Inputting tileInterface is only necessary if didWin = false
% Format: exportGame(didWin, tileInterface)

% declare vars
global minefieldRevealed;
global minefield;

% get size of minefield
[nRows, nCols] = size(minefield);
imageData = ones(nRows*6+1, nCols*6+1) .* 200;
imageData(:,:,2) = imageData;
imageData(:,:,3) = imageData(:,:,1);
imageData = uint8(imageData);

% iterate through minefields
for i = 1:1:nRows
    for j = 1:1:nCols
        % Set numbered tiles
        tileData = getImageData(minefieldRevealed(i, j));
        % Check for mines
        if (minefield(i, j) == 1)
            tileData = getImageData(-1);
        end
        % Check for exploded mine
        if (didWin == false && tileInterface(i, j) == 3)
            tileData = getImageData(-2);
        end
        % add tile data to image
        imageData((i-1)*6+2:(i-1)*6+6, (j-1)*6+2:(j-1)*6+6,1:3) = tileData;
    end
end

% save image
imwrite(imageData, 'minesweeper.png');

% load & display image
finalImage = imread('minesweeper.png');
imshow(finalImage);
% I could just use imageData, but this displays knowledge of loading images

end