function [ isEmpty ] = reader_is_empty( color )
rgb = readColorRGB(color);
r = rgb(1);
g = rgb(2);
b = rgb(3);
if (15 < r) && (r < 25) && (7 < b) && (b < 13) && (20 < g) && (g < 30)
    isEmpty = true;
else
    isEmpty = false;
end
end

