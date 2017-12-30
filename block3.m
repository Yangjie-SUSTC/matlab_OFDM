function strf=block3(xcp,T,n,fc,tau,handles)

sdac=ones(n,1)*xcp;
sdac=reshape(sdac,1,size(sdac,1)*size(sdac,2));
sdac=[sdac,sdac(end)];


t=0:T/n:(length(sdac)-1)*T/n;% for each T, there are 10 point
saveplot(t',sdac.',0,[],'DAC',tau,T,handles,'linear','linear')

% Transmitter RF Front-End 

w=2*pi*fc;
sr=real(sdac);
saveplot(t',sr.',0,[],'After DAC real',tau,T,handles,'linear','linear')
%saveplot(t,sr,'plot','After DAC real',tau,'block3',handles,biaozhu)% image
si=imag(sdac);
saveplot(t',si',0,[],'After DAC image',tau,T,handles,'linear','linear')
%saveplot(t,si,'plot','After DAC image',tau,'block3',handles,biaozhu)% image
%t2=-3:1/500:36.998;
leng=4*pi/(tau*w)+2;
cosC=cos(w*t);
xx=t(1:leng);
yy=cosC(1:leng);
saveplot(xx',yy.',1,[],'Real part carry wave',tau,T,handles,'linear','linear')
%saveplot(t,cosC,'plot','Real part carry wave',tau,'block3',handles,biaozhu)
sinC=sin(w*t);
yy=sinC(1:leng);
saveplot(xx',yy.',1,[],'Image part carry wave',tau,T,handles,'linear','linear')
%saveplot(t,sinC,'plot','Image part carry wave',tau,'block3',handles,biaozhu)
strf=sr.*cosC+si.*sinC;
saveplot(t',(sr.*cosC).',0,[],'Modulated real',tau,T,handles,'linear','linear')
saveplot(t',(si.*sinC).',0,[],'Modulated image',tau,T,handles,'linear','linear')
saveplot(t',(strf).',0,[],'Transmitting',tau,T,handles,'linear','linear')

%{
saveplot(t,sr.*cosC,'plot','Modulated real',tau,'block3',handles,biaozhu)
saveplot(t,si.*sinC,'plot','Modulated image',tau,'block3',handles,biaozhu)
saveplot(t,strf,'plot','Transmitting',tau,'block3',handles,biaozhu)
%}