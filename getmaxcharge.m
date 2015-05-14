% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function[maxPDCharge,freqMaxPD]=getmaxcharge(chargeValues)
%to make the max value the minimum multiply by -1
chargeValues= (-1*chargeValues);
% use mode function to find the minimum value of array which is actually
% our maximum
[maxPDCharge,freqMaxPD]=mode(chargeValues);
%disp the actual PD value using absolute function 
maxPDCharge = abs(maxPDCharge);
end


