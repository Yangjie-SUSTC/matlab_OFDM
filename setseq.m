function [input,bnum]= setseq(pilot,signal,nc)
p='Pilot';
s='Signal';
np=length(pilot);
pilot=pilot.';

cs=ceil(length(signal)/np);% signal colum
bnum=np*cs-length(signal);
last=[signal(np*(cs-1)+1:end),zeros(1,bnum)];
signal=signal(1:np*(cs-1));
signal=signal.';
signal=reshape(signal,np,cs-1);
signal=[signal,last.'];
pc=ceil(cs/nc);% pilot colum
packcolnum=nc+1;% package collum number



cl=1;
count=1;
zp=[];
zc=[];
package_num=1;
oip_pilot=1;

while cl<=size(signal,2)
    if mod(count,packcolnum)==1 %pilot
        package_num=package_num+1;
        tmk(:,count)=pilot;
        packagenum(count)=package_num;
        type{count}=p;
        order_in_pack=oip_pilot;
        zp=[zp,count];
        oip_signal=1; 
    else
        tmk(:,count)=signal(:,cl);
        packagenum(count)=package_num;
        type{count}=s;
        order_in_pack=oip_signal;
        zc=[zc,count];
        cl=cl+1;
        oip_signal=oip_signal+1;
    end
    count=count+1;
end


input=reshape(tmk,1,np*(cs+pc));

