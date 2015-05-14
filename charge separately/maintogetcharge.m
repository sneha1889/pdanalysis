% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
for i=1:36
[fileName,fPath] = uigetfile({'*.xlsx'});
chargeValues=xlsread(fullfile(fPath,fileName),'B:B');
[maxPDCharge,freqMaxPD]=getmaxcharge(chargeValues);
writecharge(fullfile(fPath,fileName),maxPDCharge,freqMaxPD);
end
