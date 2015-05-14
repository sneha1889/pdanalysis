% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thes
function writexlsfile(fileName,maxPDCharge,freqMaxPD)
toWrite = {'MAX. PD VALUE',maxPDCharge,'';'FREQ OF OCCURENCE',freqMaxPD,''};
xlswrite(fileName,toWrite,'Daten','Z17');
fprintf('Done writing charge to file %s\n',fileName);
end

