function []=pplot(sn,name,handles)
packagenum=1;
[fpath1,fpath2]=pathfinder(sn,name,handles);
for i=1;size(fpath1,1)
axshow(fpath1(i,:),handles.uipanel2,handles)
axshow(fpath2(i,:),handles.uipanel6,handles)
packagenum=packagenum+1;
set(handles.edit24,'String',num2str(packagenum))
[fpath1,fpath2]=pathfinder(sn,name,handles);
end
%}
