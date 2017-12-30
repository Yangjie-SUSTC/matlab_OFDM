function [fpath1,fpath2]=pathfinder(datatype,pat,handles)
k=ls([pwd,'\fig\data']);
 filename_mat=k(arrayfun(@(n)all(isequal(k(n,1:length(pat)),pat)),[1:size(k,1)]'),:);

%{
if datatype % real signal do fft
    name_1=strtrim([method,' waveform']);
    name_2=strtrim([method,' frequency spectrum ']);
else
    name_1=strtrim([method,' waveform real part']);
    name_2=strtrim([method,' waveform image part ']);
    
end
packagenum=str2double(get(handles.edit24,'String'));
if isnan(packagenum)
    packagenum='';
end
name_1=strtrim([name_1,' ',num2str(packagenum)]);
name_2=strtrim([name_2,' ',num2str(packagenum)]);
%}
pathway=[pwd,'\fig\data\'];
for i=1:size(filename_mat,1)/2
fpath2(i,:)=strtrim([pathway,filename_mat(i,:)]);
fpath1(i,:)=strtrim([pathway,filename_mat(size(filename_mat,1)/2+i,:)]);
end













