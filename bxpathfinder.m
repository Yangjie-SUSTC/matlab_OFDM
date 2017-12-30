function [fpath1,fpath2]=bxpathfinder(block,name)
op=pwd;
fpath=[pwd,'\fig\',block,'\'];
cd (fpath)
type=[name,'*'];
[filename,pathname]=uigetfile(type,'load file');%
filename=regexprep(filename,' *frequency spectrum.*','');
filename=regexprep(filename,' *waveform.*','');
filename=regexprep(filename,' *real part.*','');
filename=regexprep(filename,' *image part.*','');
cd (op)
[fpath1,fpath2]=pathfinder(pathname,filename);

