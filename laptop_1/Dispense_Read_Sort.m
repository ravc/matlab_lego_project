% This is the main dispenser, color reader, and sorting arm code

% set up hardware
% ev3 = legoev3('usb');
% dispenserMotor = motor(ev3, 'B');
% armMotor = motor(ev3, 'C');
% pacmanMotor = motor(ev3, 'A');
% color = colorSensor(ev3);
% servo = motor(ev3, 'D');
% touch = touchSensor(ev3);

% % delete data from last time
% system('git rm data.txt')
% system('git commit -m "remove data.txt"')
% system('git push')

% initiate value for amount of marbles
% [SW, LW, SR, LR, SB, LB, Steel, HDPE]
numMarbles = [0,0,0,0,0,0,0,0];

% start dispenser indefinitely
speed = 20;
dispenserMotor.Speed = 0;
servo.Speed = 70;
start(dispenserMotor);
lastTime = datetime('now');

% main loop
while true
    if (~reader_is_empty(color))
        disp(readColor(color))
        pause(.2)
        % keep track of time last marble was read
        lastTime = datetime('now');
        % if color sensor reads a marble
        [marbleType, marbleColor] = identify_marble(ev3, color);
        % increment the marbleCount array if not trash
        if (strcmp(marbleColor, 'T') == 0)
            numMarbles = increment_counts(numMarbles, marbleType);
        end
        
        % move the sorting arm and dispense
        move_sort_motor(armMotor, pacmanMotor, marbleColor);
    elseif (readTouch(touch) == 1)
        if (dispenserMotor.Speed > 0)
            dispenserMotor.Speed = 0;
            stop(servo);
        else 
            dispenserMotor.Speed = speed;
            start(servo);
            lastTime = datetime('now');
        end
        pause(0.2);
    elseif ((datetime('now') - seconds(15)) > lastTime)
        % if it doesn't read a color for 20 seconds
        if (dispenserMotor.Speed > 0)
            break;
        end
    end
    pause(.1)
end

% stop motors
stop(dispenserMotor);
stop(pacmanMotor);
stop(armMotor);
stop(servo);

% upload marble counts to github
upload_marble_counts(numMarbles);