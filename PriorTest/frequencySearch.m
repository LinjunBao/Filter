function targetfre = frequencySearch(data,samplefre)
fre = 10:5:100;
[a,frenum]=size(fre);
[a,N]=size(data);
results = zeros(frenum,1);
for i = 1:frenum
	datatemp = mFilter(data,fre(i),samplefre);
	results(i) = (sum(datatemp.^2))/N;
end
[C2,targetfreFlag]=min(results);
targetfre = fre(targetfreFlag);
