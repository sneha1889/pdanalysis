tic
clc;
[fileName,fPath] = uigetfile({'*.xlsx'});
% for i= 1:1
%for i= 1:size(fileName)
    frequencyPD = xlsread(fullfile(fPath,fileName),'P:P');
    timeStamp = xlsread(fullfile(fPath,fileName),'O:O');
    actTimeStamp = xlsread(fullfile(fPath,fileName),'E:E');
    voltageValues = xlsread(fullfile(fPath,fileName),'F:F');
    disp('Finding threshold voltage row ...');
    thresholdRowValue = computethresholdrow(frequencyPD,1);
%   disp('Computing maximum value in the analysis vector ...')
    thresholdVoltage = computevoltage(voltageValues, actTimeStamp,timeStamp,thresholdRowValue);
    [pdStartRow,pdEndRow,pdivRow, pdevRow]= togetpdivpdevrow(thresholdRowValue,frequencyPD,1);
    pdivVoltage = computepdivvoltage(voltageValues, actTimeStamp,timeStamp,pdivRow);
    pdevVoltage = computevoltage(voltageValues, actTimeStamp,timeStamp,pdevRow);
    writexlsfile(fullfile(fPath,fileName),thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage);
% end
toc