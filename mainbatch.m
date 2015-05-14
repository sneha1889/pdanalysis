% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
for i = 1:36
[fileName,fPath] = uigetfile({'*.xlsx'});
frequencyPD = xlsread(fullfile(fPath,fileName),'P:P');
timeStamp = xlsread(fullfile(fPath,fileName),'O:O');
actTimeStamp = xlsread(fullfile(fPath,fileName),'E:E');
voltageValues = xlsread(fullfile(fPath,fileName),'F:F');
chargeValues=xlsread(fullfile(fPath,fileName),'B:B');
thresholdRowValue = computethresholdrow(frequencyPD,1);
thresholdVoltage = computevoltage(voltageValues, actTimeStamp,timeStamp,thresholdRowValue);
[pdStartRow,pdEndRow,pdivRow, pdevRow,sizeList]= getpdivpdevrow(thresholdRowValue,frequencyPD,1);
pdivVoltage = computevoltage(voltageValues, actTimeStamp,timeStamp,pdivRow);
pdevVoltage = computevoltage(voltageValues, actTimeStamp,timeStamp,pdevRow);
[maxPDCharge,freqMaxPD]=getmaxcharge(chargeValues);
writexlsfile(fullfile(fPath,fileName),thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage,maxPDCharge,freqMaxPD);
end