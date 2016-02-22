function oData = mPSD(fftiData)
fftiData = abs(fftiData)./max(abs(fftiData));
oData = fftiData.^2;

