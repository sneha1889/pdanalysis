function [startrowList,endrowList,pdivRow,pdevRow,sizeList] = togetpdivpdevrow(thresholdRowValue,frequencyPD, row_offset) 
%% Gives the row value where pdiv and pdev voltage is found
%n = -1;
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

if mod(thresholdRowValue,2) == 0
    cycle = -1;
    n=thresholdRowValue+1;
else
    cycle = 1; 
    n=thresholdRowValue;
end

for i = n:rows
    if (i~=size(frequencyPD))
        temA=frequencyPD(i)+frequencyPD(i+1);
       % disp('n is 1999')
    else
        temA=frequencyPD(i);
       % disp('n is not 1999')
    end
    if (temA~=0)
       indexpdSum=indexpdSum+1;
       pdSum(indexpdSum)=temA;
       counter=counter+1;
       n=i+2;
    else
       indexsizeList=indexsizeList+1;
       sizeList(indexsizeList)=counter;
       counter=0;
       if (frequencyPD(i-1)> 0)
            pdevRowValue=i-1;
            n=pdevRowValue+2;
       else
            pdevRowValue=i-2;
            n=pdevRowValue+3;
       end
       endrowList(indexsizeList)=pdevRowValue;
      %fprintf('the end rows are:%d\n',endrowList);
    end
    %n=i+2;
end %end for
%sizeList = cat(2,sizeList(1),abs(diff(sizeList)));
%fprintf('the rows are:%d\n', sizeList);
startrowList = endrowList-sizeList;
[M,indexMax] = max(sizeList(:));
pdivRow = startrowList(indexMax)+2+ row_offset;
pdevRow = endrowList(indexMax)+ row_offset;
end