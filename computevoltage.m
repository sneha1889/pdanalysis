% Author: Snehalatha Radhakrishnan
% This entire code was written to compute and analyse the PDIV and PDEV voltages
% The work is a part of my master thesis.
function maximumValue = computevoltage(voltageValues,actTimeStamp, timeStamp,thresholdRowValue)
%% function maximumValue = maximumvalue(voltageValues,actTimeStamp, timeStamp,thresholdRowValue)
actTimestamprow = 0;
maximumValue=0;
n=0;
zeroCrossingTime=0;
cycle=0;
analysisArray = [0];
thresholdRowValue = thresholdRowValue-1;
% "if block" checks that we always start with a positive cycle of the PD
if mod(thresholdRowValue,2) == 0
% cycle is negative
    cycle = -1; 
else
% cycle is positive
    cycle = 1;
end
% Time at which the threshold voltage occurs (zero-crossing)
zeroCrossingTime = timeStamp(thresholdRowValue);
for i = 1:size(actTimeStamp,1)
% we calculate the difference between the zero crossing time and actual
% time stamp and ensure its within limits 
    if  ((actTimeStamp(i) - zeroCrossingTime) < 0.01 && (actTimeStamp(i) - zeroCrossingTime) > 0)
        actTimestamprow = i;
        break;
    end
end
% To find out the maximum value of voltage from the acttimestamp to the
% end of voltage values for different conditions
for i = actTimestamprow:size(voltageValues,1)
    if cycle == -1 && voltageValues(actTimestamprow) > 0
        % aberration from ideal condition 1 
        % increase and check again
         actTimestamprow=actTimestamprow+1;
    else
        %check for ideal condition 1
        if cycle == -1 && voltageValues(actTimestamprow) < 0
% when cycle is -ve and voltage sign matches add to analysis array 
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
% when cycle is +ve and voltage sign matches add to analysis array 
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
% Once the analysisArray is finished we find the maximum voltage required
    maximumValue = max(abs(analysisArray));
end