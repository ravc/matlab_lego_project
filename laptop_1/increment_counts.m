function [ marbleCounts ] = increment_counts( marbleCounts, marbleType )
% marbleCounts = [SW, LW, SR, LR, SB, LB, Steel, HDPE]
switch(marbleType)
    case 'Small White'
        marbleCounts(1) = marbleCounts(1) + 1;
    case 'Large White'
        marbleCounts(2) = marbleCounts(2) + 1;
    case 'Small Red'
        marbleCounts(3) = marbleCounts(3) + 1;
    case 'Large Red'
        marbleCounts(4) = marbleCounts(4) + 1;
    case 'Small Blue'
        marbleCounts(5) = marbleCounts(5) + 1;
    case 'Large Blue'
        marbleCounts(6) = marbleCounts(6) + 1;
    case '      Steel'
        marbleCounts(7) = marbleCounts(7) + 1;
    case '      HDPE'
        marbleCounts(8) = marbleCounts(8) + 1;
end

