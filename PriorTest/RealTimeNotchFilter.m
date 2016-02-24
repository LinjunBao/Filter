function [filteredData,nextFilterInitPara,thisFilterFre]=RealTimeNotchFilter(toNotchFilterData,InitPara,SampleFre,BandPassMaxFre,boolIsStart,lastFilterFre)

modifyIndex = 0.15;
[N,b]=size(toNotchFilterData);
fre = 10:5:100;
[a,frenum]=size(fre);
results = zeros(frenum,1);
if boolIsStart == 1 
	xn0 =0;
    xn1 = 0;
	x=[xn1;xn0;toNotchFilterData];
	for i=1:frenum
		M = floor(BandPassMaxFre/fre(i));
		theta = 2*pi*fre(i)/SampleFre;
		%dw = 0.1/M;
        BW = fre(i)*modifyIndex;
		dw = 2*BW*pi/SampleFre;
		r=1-dw/2;
		yn0 = zeros(1,M);
		yn1 = zeros(1,M);  %xn1,xn2,yn1.yn2中的n均表示negtive
		resultTemp = zeros(N+2,M+1);
		resultTemp(1,2:(M+1))=yn1;
		resultTemp(1,2:(M+1))=yn0;
		resultTemp(:,1)=x;
		for j =1:N
			for k = 1:M
				resultTemp(j+2,k+1)= resultTemp(j+2,k)-2*cos(k*theta)*resultTemp(j+1,k)+resultTemp(j,k)+2*r*cos(k*theta)*resultTemp(j+1,k+1)-r*r*resultTemp(j,k+1);
			end
		end
		results(i) = sum(resultTemp(3:N+2,M+1).^2)/N;
	end
	[C2,targetfreFlag]=min(results);
	thisFilterFre = fre(targetfreFlag);

	M = floor(BandPassMaxFre/thisFilterFre);
	theta = 2*pi*thisFilterFre/SampleFre;
	%dw = 0.1/M;
    BW = fre(i)*modifyIndex;
	dw = 2*BW*pi/SampleFre;
	r=1-dw/2;
	yn0 = zeros(1,M);
	yn1 = zeros(1,M);  %xn1,xn2,yn1.yn2中的n均表示negtive
	resultTemp = zeros(N+2,M+1);
	resultTemp(1,2:(M+1))=yn1;
	resultTemp(1,2:(M+1))=yn0;
	resultTemp(:,1)=x;
	for j =1:N
		for k = 1:M
			resultTemp(j+2,k+1)= resultTemp(j+2,k)-2*cos(k*theta)*resultTemp(j+1,k)+resultTemp(j,k)+2*r*cos(k*theta)*resultTemp(j+1,k+1)-r*r*resultTemp(j,k+1);
		end
	end
	nextFilterInitPara = resultTemp((N+1):(N+2),:);
	filteredData  = resultTemp(3:(N+2),M+1);
else
	x=[0;0;toNotchFilterData];
	for i=1:frenum
		M = floor(BandPassMaxFre/fre(i));
		theta = 2*pi*fre(i)/SampleFre;
		%dw = 0.1/M;
        BW = fre(i)*modifyIndex;
		dw = 2*BW*pi/SampleFre;
		r=1-dw/2;
		yn0 = zeros(1,M);
		yn1 = zeros(1,M);  %xn1,xn2,yn1.yn2中的n均表示negtive
		resultTemp = zeros(N+2,M+1);
		resultTemp(1,2:(M+1))=yn1;
		resultTemp(1,2:(M+1))=yn0;
		resultTemp(:,1)=x;
		for j =1:N
			for k = 1:M
				resultTemp(j+2,k+1)= resultTemp(j+2,k)-2*cos(k*theta)*resultTemp(j+1,k)+resultTemp(j,k)+2*r*cos(k*theta)*resultTemp(j+1,k+1)-r*r*resultTemp(j,k+1);
			end
		end
		results(i) = sum(resultTemp(3:(N+2),M+1).^2)/N;
	end
	[C2,targetfreFlag]=min(results);
	thisFilterFre = fre(targetfreFlag);

	M = floor(BandPassMaxFre/thisFilterFre);
	theta = 2*pi*thisFilterFre/SampleFre;
	%dw = 0.1/M;
    BW = fre(i)*modifyIndex;
	dw = 2*BW*pi/SampleFre;
	r=1-dw/2;
	yn0 = zeros(1,M);
	yn1 = zeros(1,M);  %xn1,xn2,yn1.yn2中的n均表示negtive
	resultTemp = zeros(N+2,M+1);
	resultTemp(1,2:(M+1))=yn1;
	resultTemp(1,2:(M+1))=yn0;
	resultTemp(:,1)=x;
	if thisFilterFre == lastFilterFre
		resultTemp(1:2,2:(M+1))=InitPara(:,2:(M+1));
        x=[InitPara(:,1);toNotchFilterData];
        resultTemp(:,1)=x;
    end
	for j =1:N
		for k = 1:M
			resultTemp(j+2,k+1)= resultTemp(j+2,k)-2*cos(k*theta)*resultTemp(j+1,k)+resultTemp(j,k)+2*r*cos(k*theta)*resultTemp(j+1,k+1)-r*r*resultTemp(j,k+1);
		end
	end
	nextFilterInitPara = resultTemp((N+1):(N+2),:);
	filteredData  = resultTemp(3:(N+2),M+1);
end