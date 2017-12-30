function xadc=demodulation(rsawc,fc,tau,T,handles,n,denum)
w=2*pi*fc;
rt=0:tau:(length(rsawc)-1)*tau;
cosc=cos(w*rt);
sinc=sin(w*rt);
sdr=rsawc.*cosc;
sdi=rsawc.*sinc;
saveplot(rt.',sdr.',0,[],'Demodulating real',tau,T,handles,'linear','linear')
saveplot(rt.',sdi.',0,[],'Demodulating image',tau,T,handles,'linear','linear')
%saveplot(rt,sdr,'plot','Demodulating real',tau,'block4',handles,biaozhu)
%saveplot(rt,sdi,'plot','Demodulating image',tau,'block4',handles,biaozhu)

cutf=str2double(get(handles.edit23,'String'));
order=get(handles.listbox3,'value'); 
[bf,af] = besself(order,cutf*2*pi);
H=[tf(bf,af)];

%mx=x.*sin(2*pi*f2*t(1:length(x)));bv    
%ecodex=lsim(bf,af,x,t(1:length(x)));
[ecodex,t1]=lsim(H,sdr,rt(1:length(sdr)));
srr=ecodex.';
tsrr=t1.';
[ecodex,t1]=lsim(H,sdi,rt(1:length(sdr)));
sri=ecodex.';
tsri=t1.';
saveplot(tsrr.',srr.',0,[],'Demodulated real',tau,T,handles,'linear','linear')
saveplot(tsri.',sri.',0,[],'Demodulated image',tau,T,handles,'linear','linear')
%saveplot(tsrr,srr,'plot','Demodulated real',tau,'block4',handles,biaozhu)
%saveplot(tsri,sri,'plot','Demodulated image',tau,'block4',handles,biaozhu)

srrf=srr+sri*1j;

% Analog-to¨CDigital Converter 

s = srrf(1:end-1);
s=s(1:end-denum(end));
rs=reshape(s,[n,size(s,1)*size(s,2)/n]);
xadc=sum(rs)/n;%xadc==xcp
xx=0:length(xadc)-1;
saveplot(xx.',xadc.',0,[],'ADC demodulated',T,T,handles,'linear','linear')
%saveplot(0:length(xadc)-1,xadc,'stem','ADC demodulated',tau*n,'block4',handles,biaozhu)