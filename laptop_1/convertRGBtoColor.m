function marbleType = convertRGBtoColor(ev3, r, g, b )
if (220 < r) && (r < 290) && (130 < b) && (b < 160) && (275 < g) && (g < 350)
    clearLCD(ev3);
    writeLCD(ev3,'Large White');
    marbleType = 'Large White';
elseif (70 < r) && (r < 119) && (60 < b) && (b < 100) && (95 < g) && (g < 155)
    clearLCD(ev3);
    writeLCD(ev3,'Small White');
    marbleType = 'Small White';
elseif (56 < r) && (r < 80) && (48 < b) && (b < 70) && (70 < g) && (g < 105)
    clearLCD(ev3);
    writeLCD(ev3,'      HDPE');
    marbleType = '      HDPE';
elseif (78 < r) && (r < 130) && (4 < b) && (b < 12) && (14 < g) && (g < 30)
    clearLCD(ev3);
    writeLCD(ev3,'Large Red');
    marbleType = 'Large Red';
elseif (46 < r) && (r < 75) && (5 < b) && (b < 15) && (15 < g) && (g < 35)
    clearLCD(ev3);
    writeLCD(ev3,'Small Red');
    marbleType = 'Small Red';
elseif (20 < r) && (r < 40) && (50 < b) && (b < 72) && (38 < g) && (g < 65)
    clearLCD(ev3);
    writeLCD(ev3,'Large Blue');
    marbleType = 'Large Blue';
elseif (17 < r) && (r < 35) && (15 < b) && (b < 51) && (23 < g) && (g < 51)
    clearLCD(ev3);
    writeLCD(ev3,'Small Blue');
    marbleType = 'Small Blue';
elseif (42 < r) && (r < 70) && (18 < b) && (b < 40) && (40 < g) && (g < 75)
    clearLCD(ev3);
    writeLCD(ev3,'      Steel');
    marbleType = '      Steel';
else
    clearLCD(ev3);
    writeLCD(ev3,'      Trash');
    marbleType = '      Trash';
end

end

