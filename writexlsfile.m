% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function writexlsfile(fileName,thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage)
toWrite = {'Result Ver.2 ','ROW NUMBER','VOLTAGE (V)';'THRESHOLD',thresholdRowValue,thresholdVoltage;'PDIV',pdivRow,pdivVoltage;'PDEV',pdevRow,pdevVoltage};
xlswrite(fileName,toWrite,'Daten','Z13');
fprintf('Done writing file %s\n',fileName);
end

