function [ recognition ] = mconfusion( class,samplenum,classnum)
%求不同动作的识别率的motion confusion matrix
recognition = zeros(classnum,classnum);
for i=1:classnum
    for j=1:samplenum
        for k = 1:classnum
            if (class((i-1)*samplenum+j)) == k
                recognition(k,i)=recognition(k,i)+1;
            end 
        end
    end
end
recognition = recognition*100/(samplenum);
end