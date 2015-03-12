function [startrowList,endrowList,pdivRow,pdevRow] = togetpdivpdevrow(thresholdRowValue,frequencyPD, row_offset) 
%% Gives the row value where pdiv and pdev voltage is found
n = 0;
counter=0;
endrowList = [0];
startrowList =[0];
index = 0;
sizeList = [0];
rows = size(frequencyPD);
indexMax=0;

for i = thresholdRowValue:rows
    if frequencyPD(i)>= 1
        n=i;
        counter=counter+1;
        if (frequencyPD(n)>=1 && frequencyPD(n+1) == 0)
            pdevRowValue = n;
            index = index+1;
            sizeList(index)= counter;
            % stores each of the ending row number of the range. The ending
            % whenever the frequencyPD(n) has a zero in it. 
            endrowList(index) = pdevRowValue;
            thresholdRowValue = pdevRowValue;
            continue;
        end
    end
end
sizeList = cat(2,sizeList(1),abs(diff(sizeList)));
startrowList = endrowList-sizeList;
[M,indexMax] = max(sizeList(:));
pdivRow = startrowList(indexMax)+ 1 + row_offset;
pdevRow = endrowList(indexMax)+ row_offset;
end