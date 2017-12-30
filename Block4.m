function xadc=Block4(sawc,a1,denum,tau,T,fc,n,handles)
%movecho(strf,sawc,path,T/n);

rsawc=removecho(sawc,a1,denum);
x=0:tau:(length(rsawc)-1)*tau;
saveplot(x.',rsawc.',0,[],'Echo removed',tau,T,handles,'linear','linear')
%saveplot(x,rsawc,'plot','Echo removed',tau,'block4',handles)

xadc=demodulation(rsawc,fc,tau,T,handles,n,denum);





