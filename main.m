tic
fileName='TE_S1V1_1200Vrms_18s-0s-18s_150223_143750.xlsx';
frequencyPD = xlsread(fileName,'P:P');
timeStamp = xlsread(fileName,'O:O');
actTimeStamp = xlsread(fileName,'E:E');
voltageValues = xlsread(fileName,'F:F');
disp('Finding threshold voltage row ...')
thresholdRowValue = thresholdvoltage(frequencyPD,1);
disp('Computing maximum value in the analysis vector ...')
thresholdVoltage = maximumvalue(voltageValues, actTimeStamp,timeStamp,thresholdRowValue)
[pdStartRow,pdEndRow,pdivRow, pdevRow]= computepdivpdev(thresholdRowValue,frequencyPD,1)
pdivVoltage = maximumvalue(voltageValues, actTimeStamp,timeStamp,pdivRow)
pdevVoltage = maximumvalue(voltageValues, actTimeStamp,timeStamp,pdevRow)
writexlsfile(fileName,thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage);
toc