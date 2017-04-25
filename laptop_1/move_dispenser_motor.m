function move_dispenser_motor( dispenserMotor, distance )
resetRotation(dispenserMotor);
if (distance > 0)
    dispenserMotor.Speed = 20;
else
    dispenserMotor.Speed = -20;
end
start(dispenserMotor)
while (abs(readRotation(dispenserMotor)) < abs(distance))
    
end
stop(dispenserMotor,1);
pause(.2)
end

