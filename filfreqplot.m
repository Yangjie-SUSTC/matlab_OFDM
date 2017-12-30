function filfreqplot(b,a,handles)
order=get(handles.listbox3,'value'); 


[H,w]=freqs(b,a,512); %绘出滤波器的复数频率特性
magH=abs(H);
phaH=unwrap(angle(H));%求幅频响应和相频响应
x=w/(2*pi);
y=20*log10(magH);
sup_title=[num2str(order),' order Bessel filter amplitude response'];
fname=sup_title;
sub_title='';
plot_style=1;
labelx='Frequency  / MHz';
labely='Magnitude / dB';
suptitle_size=18;
subtitle_size=15;
label_size=12;
filename=fname;
pathway=[pwd,'\fig\data\'];
X_scale='log';
Y_scale='linear';
packagenum='';
savedata(x,y,fname,sup_title,sub_title,plot_style,labelx,labely,suptitle_size,subtitle_size,label_size,filename,pathway,X_scale,Y_scale,packagenum);


x=w/2/pi;
y=angle(H);
sup_title=[num2str(order),' order Bessel filter phase response'];
fname=sup_title;
sub_title='';
plot_style=1;
labelx='Frequency  / MHz';
labely='Phase / rad';
suptitle_size=18;
subtitle_size=15;
label_size=12;
filename=fname;
pathway=[pwd,'\fig\data\'];
X_scale='log';
Y_scale='linear';
packagenum='';
savedata(x,y,fname,sup_title,sub_title,plot_style,labelx,labely,suptitle_size,subtitle_size,label_size,filename,pathway,X_scale,Y_scale,packagenum);




end
function datapath=savedata(x,y,fname,sup_title,sub_title,plot_style,labelx,labely,suptitle_size,subtitle_size,label_size,filename,pathway,X_scale,Y_scale,packagenum)
datapath=[pathway,filename,'.mat'];
save(datapath)
end



 