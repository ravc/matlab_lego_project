function dispense_dosages(ev3,barcode,color,finger,trackMotor)
dosage = barcode_reader(ev3,barcode,color);
%[hdpe,steel,small blue, large blue, small red, large red, small white,large white, trash]
%[SW, LW, SR, LR, SB, LB, Steel, HDPE]
dosage = [1 1 0 1 1 2 0 0];
system('git pull https://github.com/ravc/matlab_lego_project.git');
while exist('data.txt','file') == 0
    pause(10)
    system('git pull https://github.com/ravc/matlab_lego_project.git');
end

system('git pull https://github.com/ravc/matlab_lego_project.git');
totalPellets = load('data.txt');
distances = [0, -83, -73, -83, -73, -82, -71, -90];
pelletsRequired = [dosage(8), dosage(7), dosage(5), dosage(6), dosage(3), dosage(4), dosage(1), dosage(2)];


for i=1:3
    trackMotor.Speed = 10;
    start(trackMotor)
    pause(2)
    stop(trackMotor,1)
    trackMotor.Speed = -30;
    for i=1:8
       totalPellets(i) = totalPellets(i) - dosage(i);
    end
    if sum(totalPellets < 0) > 0
       fprintf('Can not complete dosage\n');
       playTone(ev3,500,2,10);
       break
    end
    for j=1:8
        resetRotation(trackMotor)
        start(trackMotor)
        while (abs(readRotation(trackMotor)) < abs(distances(j)))
            
        end
        stop(trackMotor,1);
        pause(.2)
        for k=1:pelletsRequired(j)
            move_finger(finger)
            pause(.1)
        end
    end
    trackMotor.Speed = 30;
    backD = abs(sum(distances));
    start(trackMotor)
    while (readRotation(trackMotor) < backD)
        pause(4)
        break
    end
    stop(trackMotor,1)
    pause(20)
end
stop(trackMotor)
stop(finger)
