t=0:0.001:4.284;
In=1.6:1.6;
T=transpose(t);
Kistler= -KistlerNm;
hold on;
plot(T,Kistler,'k')
plot(T,ones(length(T),1)*mean(Kistler),'g');
plot(T,ones(length(T),1)*In,'b');
ylim([1.55 1.85])
xlim([0 4])
xlabel('Time (s)')
ylabel('')
legend('Command (Amp)','Mean torque-sensor (Nm)')
box on