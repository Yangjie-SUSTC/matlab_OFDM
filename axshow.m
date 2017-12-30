function []= axshow(datapath,panel,handles)
%%
%{
if pnum==1
    if exist([pwd,'\fig\oldhanl_l.mat'])
        load([pwd,'\fig\oldhanl_l.mat']);
    else
        oldhan_l=[];
    end
    old=oldhan_l;
else
    if exist([pwd,'\fig\oldhanl_r.mat'])
        load([pwd,'\fig\oldhanl_r.mat']);
    else
        oldhan_r=[];
    end
    old=oldhan_r;

end
%}
old=findall(panel,'type','axes');
delete(old)
load(datapath)
set(panel,'Title',sup_title)
set(panel,'FontSize',suptitle_size)

axes('parent',panel);  %重建一个axes
splot(datapath,handles);
%{
if pnum==1
    oldhan_l=oldhandles;
    save([pwd,'\fig\oldhanl_l.mat'],'oldhan_l');
    
else
    oldhan_r=oldhandles;
    save([pwd,'\fig\oldhanl_r.mat'],'oldhan_r');
end
    %}
