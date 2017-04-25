function [ marbleStr, marbleCounts ] = code2marbles( code, marbleCounts )
    % process code
    % convert code to binary for easy identification
    materialCode = bin2dec(fliplr(code(1:3)));
    typeCode = bin2dec(fliplr(code(4:8)));
    types = getQuantities(typeCode);
    % output results
    % [SW, LW, SR, LR, SB, LB, Steel, HDPE]
    [marbleStr, marbleCounts] =  makeString(materialCode, types, marbleCounts);
    fprintf('%s\n', marbleStr)
end

function [marbleStr, marbleCounts] = makeString(material, quantities, marbleCounts)
    marbleStr = '';
    if (material <= 3)
        materialName = getMaterial(material);
        larges = quantities(1);
        smalls = quantities(2);
        % this formula gets the correct section of the array 
        marbleCounts(material*2-1:material*2) = ...
            marbleCounts(material*2-1:material*2) +[smalls, larges];
        
        marbleStr = sprintf('%d large %s\n%d small %s', ...
            larges, materialName, smalls, materialName);
    elseif (material == 4)
        % material = 'Steel/HDPE';
        steels = quantities(1);
        HDPEs = quantities(2);
        marbleCounts(7:8) = marbleCounts(7:8) + [steels, HDPEs];
        
        marbleStr = sprintf('%d steel\n%d HDPE', ...
            steels, HDPEs);
    end
    
end

function material = getMaterial(materialCode)
    switch materialCode
        % [SW, LW, SR, LR, SB, LB, Steel, HDPE]
        case 1
            material = 'white glass';
        case 2
            material = 'red glass';
        case 3
            material = 'blue glass';
        case 4
            material = 'steel/HDPE';
        otherwise
            error('Invalid material')
    end
end

function quantities = getQuantities(typeCode)
    switch typeCode
        case 1
            quantities = [0 0];
        case 2
            quantities = [1 0];
        case 3
            quantities = [2 0];
        case 4
            quantities = [3 0];
        case 5
            quantities = [0 1];
        case 6
            quantities = [1 1];
        case 7
            quantities = [2 1];
        case 8
            quantities = [3 1];
        case 9
            quantities = [0 2];
        case 10
            quantities = [1 2];
        case 11
            quantities = [2 2];
        case 12
            quantities = [3 2];
        case 13
            quantities = [0 3];
        case 14
            quantities = [1 3];
        case 15
            quantities = [2 3];
        case 16
            quantities = [3 3];
        otherwise
            error('Invalid type')
    end
end