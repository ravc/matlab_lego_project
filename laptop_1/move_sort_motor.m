function move_sort_motor(armMotor, pacmanMotor, marbleColor)
COLORS = ['T', 'W', 'R', 'B', 'S', 'H'];
COLOR_DISTANCES = [0, 13, 35, 52, 70, 85];
%[~, marbleColor] = identify_marble(ev3, color);
distance = COLOR_DISTANCES(COLORS == marbleColor);

% move armMotor to position
resetRotation(armMotor);
if (distance > 0)
    armMotor.Speed = 20;
else
    armMotor.Speed = -20;
end
start(armMotor)
while (abs(readRotation(armMotor)) < abs(distance))
    
end
stop(armMotor,1);
pause(.2)

% release marble
pacmanMotor.Speed = 20;
for i = 1:2
    resetRotation(pacmanMotor);
    start(pacmanMotor)
    while (abs(readRotation(pacmanMotor)) < 48)
        
    end
    stop(pacmanMotor,1);
    pause(.1)
    pacmanMotor.Speed = -20;
    pause(.1)
end


% move armMotor back to start
distance = distance * (-1);
resetRotation(armMotor);
if (distance > 0)
    armMotor.Speed = 20;
else
    armMotor.Speed = -20;
end
start(armMotor)
while (abs(readRotation(armMotor)) < abs(distance))
    
end
stop(armMotor,1);
pause(.2)


stop(armMotor);
stop(pacmanMotor);
end

