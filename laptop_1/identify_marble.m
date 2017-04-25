function [ marbleType, marbleColor ] = identify_marble( ev3, color )
% marbleType is whole thing e.g. 'Large Red'
% marbleColor is just the color e.g. 'Red'

rgb = readColorRGB(color);
marbleType = convertRGBtoColor(ev3, rgb(1), rgb(2), rgb(3));
marbleColor = marbleType(7);
end

