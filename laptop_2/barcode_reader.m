function DOSAGE = barcode_reader(ev3, barcodeMotor, color)
    % dosage is in the for [SW, LW, SR, LR, SB, LB, Steel, HDPE]
    clearLCD(ev3);
    code = [];
    numBarcodes = 0;
    start(barcodeMotor)
    speed = 13;
    barcodeMotor.Speed = 0;
    mkdir('barcode_results');
    % start with clean file
    fid = fopen('barcode_results/results.txt', 'w');
    fprintf(fid, '');
    fclose(fid);
    while true
        if readButton(ev3, 'right')
            DOSAGE = zeros(1,8);
            fid = fopen('barcode_results/results.txt', 'a');
            barcodeMotor.Speed = speed;
            while numBarcodes < 4
                % reads first black stripe
                if strcmp(readColor(color),'black') == 1
                    %%%%%barcodeMotor.Speed = 0;
                    stop(barcodeMotor, 1);
                    % read barcode
                    resetRotation(barcodeMotor);
                    pause(1)
                    %%%%%barcodeMotor.Speed = speed;
                    start(barcodeMotor);
                    while length(code) <= 7
                        if (readRotation(barcodeMotor) >= 52)
    %                         barcodeMotor.Speed = -2;
    %                         pause(.05)
    %                         barcodeMotor.Speed = 0;
                            stop(barcodeMotor, 1);
                            pause(.5)
                            if strcmp(readColor(color),'black') == 1
                                code = [code 1];
                            elseif strcmp(readColor(color),'white') == 1
                                code = [code 0];
                            end
                            pause(.5)
                            resetRotation(barcodeMotor);
                            %%%%%%barcodeMotor.Speed = speed;
                            start(barcodeMotor);
                        end
                    end
                    % process barcode
                    code = num2str(code);
                    code_no = code(code ~= ' ');
                    [marbleStr, DOSAGE] = code2marbles(code_no, DOSAGE);
                    new_string = strsplit(marbleStr,'\n');
                    % write results to file
                    fprintf(fid, 'Code: %s\n%s\n\n', code_no, marbleStr);
                    % display results on ev3
                    clearLCD(ev3)
                    writeLCD(ev3,code_no,3,6)
                    %writeLCD(ev3, new_string{1},5,1)
                    %writeLCD(ev3, new_string{2},6,1)
                    %writeLCD(ev3, 'marble(s)',7,1)
                    code = [];
                    numBarcodes = numBarcodes + 1;
                end
                if readButton(ev3, 'left')
                    while ~readButton(ev3, 'right')
                        barcodeMotor.Speed = 0;
                    end
                    barcodeMotor.Speed = speed;
                end
            end
            fclose(fid);
            % open output file with default text editor
            winopen('barcode_results/results.txt') 
            % eject last barcode
            pause(1.5)
            stop(barcodeMotor)
            return;
        else
            barcodeMotor.Speed = 0;
        end
    end
    end