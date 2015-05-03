function writexlsfile(fileName,thresholdRowValue,thresholdVoltage,pdivRow,pdivVoltage,pdevRow,pdevVoltage)
toWrite = {'Result Ver.2 ','ROW NUMBER','VOLTAGE (V)';'THRESHOLD',thresholdRowValue,thresholdVoltage;'PDIV',pdivRow,pdivVoltage;'PDEV',pdevRow,pdevVoltage};
xlswrite(fileName,toWrite,'Daten','Z13');
fprintf('Done writing file %s',fileName);
end

