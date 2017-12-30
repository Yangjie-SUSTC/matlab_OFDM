function axshowfilter(fpath,axnum,f)
%%
fighand=open(fpath);
gcaobj=get(gca);
name=get(fighand,'name');
h=gcaobj.Children;

data=get(h,{'xdata','ydata'});
xlim = gcaobj.XLim;
ylim = gcaobj.YLim;

xlabobj=gcaobj.XLabel;
xlab=get(xlabobj,'string');
ylabobj=gcaobj.YLabel;
ylab=get(ylabobj,'string');
close (fighand)
axes(axnum);
if f==1
    semilogx(data{1},data{2}) 
else
    semilogx(data{1},data{2})
end
grid on 
title (name,'fontsize',20)
xlabel(xlab,'fontsize',15)
ylabel(ylab,'fontsize',15)
axis([xlim ,ylim]);
