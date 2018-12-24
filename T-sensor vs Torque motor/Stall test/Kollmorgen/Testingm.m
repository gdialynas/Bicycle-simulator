t=0:0.001:4.285
T=transpose(t)
plot(T,KistlerNm)
M=nanmean(Torque)
K=nanmean(KistlerNm)
e=M+K
plot (Torque