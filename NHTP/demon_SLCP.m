% demon sparse complementarity problems
clc; clear; close all;                    
n         = 10000;  
s         = ceil(0.01*n);
ExMat     = 2; %= 1, 2, 3
MatType   = {'z-mat','sdp','sdp-non'};
data      = LCPdata(MatType{ExMat},n,s);
func      = @(x,T1,T2)LCP(x,T1,T2,data);
out       = NHTP(func,n,s);

fprintf(' CPU time:          %.3fsec\n',  out.time);
fprintf(' Objective:         %5.2e\n',  out.obj);
fprintf(' Sample size:       %dx%d\n', n,n);
RecoverShow(data.xopt,out.sol,[900,500,500,250],1);

