function imageData = getImageData(tileValue)
% Returns uint8 image data for a tile
% Format: getImageData(tileValue) 
% Enter -1 for a mine, and -2 for an exploded mine

switch (tileValue)
    case (-2) % exploded mine
        r = [255 255 0 255 255;
            255 0 0 0 255;
            0 0 0 0 0; 
            255 0 0 0 255;
            255 255 0 255 255];
        g = zeros(5);
        b = zeros(5);
    case (-1) % unexploded mine
        r = [255 255 0 255 255;
            255 0 0 0 255;
            0 0 0 0 0; 
            255 0 0 0 255;
            255 255 0 255 255];
        g = r;
        b = r;
    case (0)
        r = ones(5) .* 255;
        g = r;
        b = r;
    case (1)
        r = [255 255 0 255 255;
            255 0 0 255 255;
            255 255 0 255 255;
            255 255 0 255 255;
            255 0 0 0 255];
        g = r;
        b = ones(5) .* 255;
    case (2)
        r = [255 0 0 0 255;
            255 255 255 255 0;
            255 255 255 0 255;
            255 255 0 255 255;
            255 0 0 0 0];
        g = [255 125 125 125 255;
            255 255 255 255 125;
            255 255 255 125 255;
            255 255 125 255 255;
            255 125 125 125 125];
        b = r;
    case (3)
        r = ones(5) .* 255;
        g = [255 0 0 0 255;
            255 255 255 255 0;
            255 0 0 0 255;
            255 255 255 255 0;
            255 0 0 0 255];
        b = g;
    case (4)
        r = [255 50 255 50 255;
            255 50 255 50 255;
            255 50 50 50 255;
            255 255 255 50 255;
            255 255 255 50 255];
        g = [255 0 255 0 255;
            255 0 255 0 255;
            255 0 0 0 255;
            255 255 255 0 255;
            255 255 255 0 255];
        b = [255 125 255 125 255;
            255 125 255 125 255;
            255 125 125 125 255;
            255 255 255 125 255;
            255 255 255 125 255];
    case (5)
        r = [255 100 100 100 255;
            255 100 255 255 255;
            255 100 100 100 255;
            255 255 255 100 255;
            255 100 100 100 255];
        g = [255 0 0 0 255;
            255 0 255 255 255;
            255 0 0 0 255;
            255 255 255 0 255;
            255 0 0 0 255];
        b = g;
    case (6)
        r = [255 0 0 0 255;
            255 0 255 255 255;
            255 0 0 0 255;
            255 0 255 0 255;
            255 0 0 0 255];
        g = [255 150 150 150 255;
            255 150 255 255 255;
            255 150 150 150 255;
            255 150 255 150 255;
            255 150 150 150 255];
        b = g;
    case (7)
        r = [255 70 70 70 255;
            255 255 255 70 255;
            255 255 255 70 255;
            255 255 70 255 255;
            255 255 70 255 255];
        g = r;
        b = r;
    case (8)
        r = [255 150 150 150 255;
            255 150 255 150 255;
            255 150 150 150 255;
            255 150 255 150 255;
            255 150 150 150 255];
        g = r;
        b = r;
end
% set imageData
imageData(:,:,1) = uint8(r);
imageData(:,:,2) = uint8(g);
imageData(:,:,3) = uint8(b);
end