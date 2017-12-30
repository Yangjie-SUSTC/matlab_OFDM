function h=plotfig(datapath,handles)
load(datapath);
h=figure('name',fname);
plotnum=splot(datapath,handles);
if plotnum==1
    title(fname,'fontsize',18);
    
else
    suptitle(fname);
end
    
    
set(gcf,'outerposition',get(0,'screensize'));
end