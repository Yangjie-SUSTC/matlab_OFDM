function []=parplot(x,y,nc,method,tau,distau,handles,X_scale,Y_scale)
packagenum=1;
while packagenum*(nc+1)<=size(y,2)
y1=y(:,(packagenum-1)*(nc+1)+1:packagenum*(nc+1));
saveplot(x,y1,0,packagenum,method,tau,distau,handles,X_scale,Y_scale)
packagenum=packagenum+1;
end