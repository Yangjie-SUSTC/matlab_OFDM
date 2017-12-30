function sawc=antenna(strf,a1,denum,tau,T,handles)

h=zeros(1,denum(end)+1);
h(denum+1)=a1;
x=0:tau:(length(h)-1)*tau;
saveplot(x.',h.',0,[],'Channel impulse response',tau,T,handles,'linear','linear')
%saveplot(0:tau:(length(h)-1)*tau,h,'plot','Channel impulse response',tau,'channel',handles,'')
%{
delay=[];
for k=1:length(denum)
rnum=denum(end)-denum(k);
delay=[delay;[zeros(1,denum(k)),strf,zeros(1,rnum)]];
end
sawc=sum(diag(a1)*delay);% recieved signal
%}
sawc=conv(strf,h);
%saveplot(0:tau:(length(sww)-1)*tau,sww,'plot','Convolution',tau,'channel',handles)


%{
delta0=[strf zeros(1,1500)];%¦Ä(t)
delta1=[zeros(1,750) strf zeros(1,750)];%¦Ä(t-1.5T)
delta2=[zeros(1,1250) strf zeros(1,250)];%¦Ä(t-2.5T)
delta3=[zeros(1,1500) strf];%¦Ä(t-3T)
sawc=0.5*delta0+0.4*delta1+0.35*delta2+0.3*delta3;
%}
rt=0:tau:(length(sawc)-1)*tau;
saveplot(rt',sawc.',0,[],'Recieved',tau,T,handles,'linear','linear')
%saveplot(rt,sawc,'plot','Recieved',tau,'channel',handles,biaozhu)
fprintf ('y[n]=%.2fx[n]+%.2fx[n-%.f]+%.2fx[n-%.f]\n',a1(1),a1(2),denum(2),a1(3),denum(3))