% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function thresholdRowValue = computethresholdrow(frequencyPD, row_offset) 
%% Gives the row value where threshold voltage is found
counter = 1;
rows = size(frequencyPD);
for i = 1:rows
% checks for the first occurence of PD
    if frequencyPD(i)== 1
        thresholdRowValue = counter + row_offset;
        break
    else 
         counter =counter+1;
    end
end
end
 