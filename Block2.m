function []=Block2(xadc,M,T,handles,np,nc,dnum,pilot)
zp=[];
zs=[];
xspc=reshape(xadc,(np+M),size(xadc,1)*size(xadc,2)/(np+M));
inx=0:length(xspc)-1;
parplot(inx.',xspc,nc,'Serial to parallel',T,T,handles,'linear','linear');
%saveplot(0:length(xspc)-1,xspc,'stem','Serial to parallel',T,'block2',handles,)
for i=1:size(xspc,2)
    if mod(i,nc+1)==1
    zp=[zp i];
    else  
    zs=[zs i];
    end
end

xcut=xspc(M+1:size(xspc,1),:);% Remove CP
%figure(21),
%stem(xcut);
inx=0:size(xcut,1)-1;
parplot(inx.',xcut,nc,'Remove CP',T,T,handles,'linear','linear');
%saveplot(0:size(xcut,1)-1,xcut,'stem','Remove CP',T,'block2',handles,biaozhu)



xdft=fft(xcut);% DFT doble
inx=0:size(xdft,1)-1;
parplot(inx.',xdft,nc,'DFT',T,T,handles,'linear','linear');
%saveplot(,xdft,'stem','DFT',T,'block2',handles,biaozhu)
%figure(22),
%plot(xdft);
gain=xdft./pilot.';
gainp=gain(:,zp);
pn=size(gainp,2);
if pn>1
    for i=1:pn
    biaozhu{i}=['Pilot','_',num2str(i)];
    end
else
    biaozhu=[];
end
inx=0:size(gainp,1)-1;
packagenum=1;
while packagenum<=size(gainp,2)
y1=gainp(:,packagenum);
saveplot(inx.',y1,0,packagenum,'Channel gain',T,T,handles,'linear','linear')
packagenum=packagenum+1;
end
%parplot(inx.',gainp,nc,'Channel gain',T,T,handles,'linear','linear');
%saveplot(inx',gainp,0,[],'Channel gain',T,T,handles,'linear','linear')
%saveplot(0:size(gainp,1)-1,gainp,'stem','Channel gain',T,'block2',handles,biaozhu)
for kk=1:size(gain,2)
    zpd=(zp<=kk);
    zpf=find(zpd==1);
    pindex=zpf(end);
    gain(:,kk)=gain(:,pindex); 
end


Rp=xdft./gain;
pRp=Rp(:,zp);
sRp=Rp(:,zs);

inx=0:size(Rp,1)-1;
parplot(inx.',Rp,nc,'Gained',T,T,handles,'linear','linear');
%saveplot(0:size(Rp,1)-1,Rp,'stem','Gained',T,'block2',handles,biaozhu)
Rp=reshape(Rp,size(Rp,1)*size(Rp,2),1);
output=Rp.';
inx=0:length(output)-1;
saveplot(inx',output.',0,[],'Parallel to serial',T,T,handles,'linear','linear')
%saveplot(0:length(output)-1,output,'stem','Parallel to serial',T,'block2',handles,biaozhu)

pRp=reshape(pRp,size(pRp,1)*size(pRp,2),1);
frp=pRp.';

inx=0:length(frp)-1;
saveplot(inx',frp.',0,[],'Final full pilot',T,T,handles,'linear','linear')
%saveplot(0:length(frp)-1,frp,'stem','Final full pilot',T,'block2',handles,biaozhu)
sRp=reshape(sRp,size(sRp,1)*size(sRp,2),1);
sRp=sRp(1:end-dnum,1);
frs=sRp;

inx=0:length(frs)-1;
saveplot(inx',frs,0,[],'Final full signal',T,T,handles,'linear','linear')
%saveplot(0:length(frs)-1,frs,'stem','Final full signal',T,'block2',handles,biaozhu)




