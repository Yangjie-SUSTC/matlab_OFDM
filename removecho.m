function h1=removecho(soun,alpha,delay)

%a=zeros(1,delay+1);
i=1;
a=zeros(1,delay(end)+1);
a(delay+1)=alpha;
h1=filter(1,a,soun);
%{
while  (i<=length(alpha))
a(1,delay(i)+1)=alpha(i);
i=i+1;
end

%sound(soun,8192);

%h1=h1';

%h1=select(h1,0,4000);

h=figure('name',fname);
subplot(211)
t=h1(2,:);
plot(t,soun);
title('signal','fontsize',15);
xlabel('Time/\mus','fontsize',10);
ylabel('Amplitude')
axis([min(t),max(t),min(soun),max(soun)]);
subplot(212)
signal=h1(1,:);
plot(h1(2,:),signal);
title('echo remove signal','fontsize',15);
xlabel('Time/\mu s','fontsize',10);
ylabel('Amplitude')
axis([min(t),max(t),min(signal),max(signal)]);
saveas(h,[pathway,name], 'psc2');
saveas(h,[pathway,name,'.fig']);
saveas(h,[pathway,name,'.jpg']);
%}
end