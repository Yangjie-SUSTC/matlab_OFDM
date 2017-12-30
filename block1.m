function [xidft,nl]=block1(input,M,T,np,nc,handles)

xpsc=input.';% Serial-to-Parallel Converter
nl=size(xpsc,1)*size(xpsc,2)/np;
xpsc=reshape(xpsc,np,nl);
method='Serial to parallel convertor';
inx=(0:size(xpsc,1)-1).';
parplot(inx,xpsc,nc,method,T,T,handles,'linear','linear');


xidft=ifft(xpsc);% Inverse DFT
inx=(0:size(xidft,1)-1).';
parplot(inx,xidft,nc,'IFFT',T,T,handles,'linear','linear');



xcp=[xidft(size(xidft,1)-M+1:size(xidft,1),:);xidft];
%xcp=[cxidft(end-M+1:end,:),xidft];% Add CP (less than 1/4 length of signal)
%x=length(xidft)-length(xcp):length(xidft)-1;
x=(0:size(xcp,1)-1)-M;
parplot(x.',xcp,nc,'Add CP IFFT',T,T,handles,'linear','linear');
xidft=xcp;
xidft=reshape(xidft,1,size(xidft,1)*size(xidft,2));
x=0:length(xidft)-1;
saveplot(x',xidft.',0,[],'Parallel to serial IFFT',T,T,handles,'linear','linear')




