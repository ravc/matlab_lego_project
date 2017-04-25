function  move_track_motor(trackMotor, fingerMotor, distance)
resetRotation(trackMotor);
if (distance > 0)
    trackMotor.Speed = 20;
else
    trackMotor.Speed = -20;
end
start(trackMotor)
while (abs(readRotation(trackMotor)) < abs(distance))
    
end
stop(trackMotor,1);
pause(.5)
% while (readDistance(ultra) < 0.08) 
%     
% end
% while (readDistance(ultra) > 0.84)
%     
% end
stop(trackMotor)
resetRotation(fingerMotor)
fingerMotor.Speed = -60;
start(fingerMotor)
while (abs(readRotation(fingerMotor)) < 30)
    
end
stop(fingerMotor,1)
fingerMotor.Speed = 10;
start(fingerMotor)
while (abs(readRotation(fingerMotor)) > 0)
    
end
stop(fingerMotor,1)
end

