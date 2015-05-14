% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function writexlsfile(fileName,thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage,maxPDCharge,freqMaxPD)
toWrite = {'Result Ver.3 ','ROW NUMBER','VOLTAGE (V)';'THRESHOLD',thresholdRowValue,thresholdVoltage;'PDIV',pdivRow,pdivVoltage;'PDEV',pdevRow,pdevVoltage;'MAX. PD VALUE',maxPDCharge,'';'FREQ OF OCCURENCE',freqMaxPD,''};
xlswrite(fileName,toWrite,'Daten','Z13');
fprintf('Done writing file %s\n',fileName);
end

