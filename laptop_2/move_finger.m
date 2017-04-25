function move_finger(finger)
resetRotation(finger)
finger.Speed = -60;
start(finger)
while (abs(readRotation(finger)) < 45)
    
end
stop(finger,1)
finger.Speed = 10;
pause(.2)
start(finger)
while (abs(readRotation(finger)) > 0)
    
end
stop(finger,1)
pause(.2)
start(finger)
while (abs(readRotation(finger)) < 0)
    
end
stop(finger,1)