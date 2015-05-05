% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function [startrowList,endrowList,pdivRow,pdevRow,sizeList] = getpdivpdevrow(thresholdRowValue,frequencyPD, row_offset) 
%% Gives the row value where pdiv and pdev voltage is found
counter=0;
indexMax=0;
endrowList = [0];
startrowList =[0];
indexpdSum = 0;
indexsizeList =0;
sizeList = [0];
pdSum =[0];
rows = size(frequencyPD);
indexMax=0;
thresholdRowValue=thresholdRowValue-1;
cycle = 0;
temA=0;
pdevRowValue=0;

% "if block" checks that we always start with a positive cycle of the PD
if mod(thresholdRowValue,2) == 0
    % cycle is negative
    cycle = -1;
    % moves the row to positive cycle from negative cycle
    n=thresholdRowValue-1; 
else
    %cycle is positive
    cycle = 1; 
    n=thresholdRowValue;
end
% Traversing the entire FrequencyPD and obtaining different PDEVs and 
% sizeList and the list is incremented by two because for everystep 
% consecutive positive and negative cyclles are added

for i = n:2:(rows)
% checking for out of bound condition
    if (i~=rows)
% adding the subsequent +ve and -ve cycles
        temA=frequencyPD(i)+frequencyPD(i+1);   
    else
        temA=frequencyPD(i);
    end
%  when sum not zero, stored in an array and counter incremented by 2
%  because we move by 2 rows
    if (temA~=0)
       indexpdSum=indexpdSum+1;
       pdSum(indexpdSum)=temA;
       counter=counter+2;
    else
% when zero we increment indexsizeList and store the value of counter in 
% sizeList array  
       indexsizeList=indexsizeList+1;
       sizeList(indexsizeList)=counter;
       counter=0;
% if sum is zero then values in i and i+1 are zero and hence the 
% non zero values are in i-1 or i-2 and we check for it below
       if (frequencyPD(i-1)> 0)
            pdevRowValue=i-1;
            n=pdevRowValue+2;
       else
            pdevRowValue=i-2;
            n=pdevRowValue+3;
       end
       endrowList(indexsizeList)=pdevRowValue;
    end
end %end for
% to obtain the pdiv row array we subtract size of each set from its pdev
% array
% to solve the problem of sizelist - i.e counter inremented y 2 though the
% pdev value is not. Hence al Pdiv's are actualpdiv-1
% for i = 1:indexsizeList
%   if mod(endrowList(i),2) == 0
% Means its an odd row(-ve). hence no problem
%       sizeList(i)=sizeList(i);
%    else
%       sizeList(i)= sizeList(i)-1;
%   end
% end
startrowList = endrowList-sizeList;
% the largest set is our actual PD range
[M,indexMax] = max(sizeList(:));

% when the PD ends with +ve cycle and the subsequent cycle is zero and -ve 
%  then the actual pdev row is the negative row
tempPdev = endrowList(indexMax)+ row_offset;
if mod(tempPdev,2)== 0
    pdevRow=tempPdev+1;
else
    pdevRow = tempPdev;
end
if mod(pdevRow,2) == 0
    % cycle is +ve
    cycle = 1;
    pdivRow = startrowList(indexMax)+2+ row_offset; 
else
    %cycle is -ve
    cycle = -1; 
    % negative cycle we have removed 1 to start from +ve cycle. Therefore
    % in the end we have add a buffer of 1 extra
    pdivRow = startrowList(indexMax)+1+ row_offset;
end
end

