function maximumValue = maximumvalue(voltageValues,actTimeStamp, timeStamp,thresholdRowValue)
%% function maximumValue = maximumvalue(voltageValues,actTimeStamp, timeStamp,thresholdRowValue)
actTimestamprow = 0;
maximumValue=0;
n=0;
zeroCrossingTime=0;
cycle=0;
analysisArray = [0];
thresholdRowValue = thresholdRowValue-1;
if mod(thresholdRowValue,2) == 0
    cycle = -1; 
else
    cycle = 1;
end
zeroCrossingTime = timeStamp(thresholdRowValue);
for i = 1:size(actTimeStamp,1)
    if  ((actTimeStamp(i) - zeroCrossingTime) < 0.01 && (actTimeStamp(i) - zeroCrossingTime) > 0)
        actTimestamprow = i;
        break;
    end
end

for i = actTimestamprow:size(voltageValues,1)
    if cycle == -1 && voltageValues(actTimestamprow) > 0
        % aberration from ideal condition 1
         actTimestamprow=actTimestamprow+1;
    else
        %check for ideal condition 1
        if cycle == -1 && voltageValues(actTimestamprow) < 0
            n=n+1;
            analysisArray(n,1) = voltageValues(actTimestamprow);
             actTimestamprow=actTimestamprow+1;
                if voltageValues(actTimestamprow) > 0
                    break;
                end
        end
    end
    % end of ideal condition 1
    if cycle == 1 && voltageValues(actTimestamprow) < 0
          % aberration from ideal condition 2
        actTimestamprow=actTimestamprow+1;
    else
        % check for ideal condition 2
        if cycle == 1 && voltageValues(actTimestamprow) > 0
            n=n+1;
            analysisArray(n,1) = voltageValues(actTimestamprow);
            actTimestamprow=actTimestamprow+1;
                if voltageValues(actTimestamprow) < 0
                    break;
                end
        end
    end
    % end of ideal condition 2
end

    maximumValue = max(abs(analysisArray));
end