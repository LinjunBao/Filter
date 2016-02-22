function [ output_args ] = stageblock( input_args,highthresholdpercent,lowthresholdpercent,expand )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    datalength = size(input_args);
    output_args = input_args;
    maxpoint = max(input_args);
    highthreshold = maxpoint/highthresholdpercent;
    lowthreshold = maxpoint/lowthresholdpercent;
    countht = 0;
    countlt = 0;
    for i = 1 : datalength 
    	if input_args(i)<= lowthreshold
    		if countlt == 1 && countht == 0
    			countlt = 0;
    	    elseif countlt == 1 && countht == 2
    	    	indexstop  = i+expand;
                if indexstop >datalength
                    indexstop = datalength;
                end
    	    	for j = indexstart : indexstop
    	    		output_args(j) = 0;
                end
                i = indexstop+expand;
                countht = 0;
                countlt = 0;

    	    end
    	elseif input_args(i)>lowthreshold && input_args(i)<= highthreshold
    		if countlt ==0 && countht == 0
    			countlt = 1;
    			indexstart = i-expand;
                if indexstart <1
                    indexstart = 1;
                end
    		elseif countlt == 1 && countht == 1
    			countht = 2;
    		end
    	else 
    		if countlt == 1 && countht == 0
    			countht = 1;
    		end
    	end
    end
    		



end

