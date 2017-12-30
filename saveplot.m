function []=saveplot(x,y,periodic,packagenum,method,tau,distau,handles,X_scale,Y_scale)


    if tau<distau% continue use plot
        plot_style_1(1:size(y,2))=1;
        xlabel_1(1:size(y,2))=cellstr('Time/ \mus');
        ylabel_1(1:size(y,2))=cellstr('Magnitude');  
    else
        plot_style_1(1:size(y,2))=0;
        xlabel_1(1:size(y,2))=cellstr('N');
        ylabel_1(1:size(y,2))=cellstr('Magnitude');
    end
    
if isreal(y) % real signal do fft
    name_1=strtrim([method,' waveform']);
    name_2=strtrim([method,' frequency spectrum ']);
    x1=x;
    y1=y;
    N=size(y,1);
    f_s = 1/tau;
    f_x = 0:f_s/(N-1):f_s;
    w=f_x-f_s/2;
    x2=w.';
    y2=abs(fftshift(tau*fft(y)));
    if periodic==1% periodic fft use stem
        plot_style_2(1:size(y2,2))=0;
        xlabel_2(1:size(y2,2))=cellstr('Frequency / MHz');
        ylabel_2(1:size(y2,2))=cellstr('Magnitude');
    else
        plot_style_2(1:size(y2,2))=1;
        xlabel_2(1:size(y2,2))=cellstr('Frequency / MHz');
        ylabel_2(1:size(y2,2))=cellstr('Magnitude');
    end
    
    
    
else
    name_1=strtrim([method,' waveform real part']);
    name_2=strtrim([method,' waveform image part ']);
    x1=x;
    x2=x;
    y1=real(y);
    y2=imag(y);
    xlabel_2=xlabel_1;
    ylabel_2=ylabel_1;
    plot_style_2=plot_style_1;
   
end
  sup_title_1=name_1;
  sup_title_2=name_2;
if size(y1,2)==1
         sub_title_1=name_1;
         sub_title_2=name_2;
        
else
        sub_title{1}='pilot';
        for i=2:size(y,2)
         sub_title{i}=strtrim(['signal ',num2str(i-1)]);
        end
        if i==2
         sub_title{i}='signal';
        end
        sub_title_1=sub_title;
        sub_title_2=sub_title_1;
        
end
fname_1=[sup_title_1,' ',num2str(packagenum)];
fname_1=strtrim(fname_1);
filename_1=fname_1;
%datapath_1=savedata(x1,y1,fname_1,sup_title_1,sub_title_1,plot_style_1,xlabel_1,ylabel_1,18,15,12,filename_1,[pwd,'\fig\',block,'\',],X_scale,Y_scale);
x1=x1*ones(1,size(y1,2));
x2=x2*ones(1,size(y2,2));
datapath_1=savedata(x1,y1,fname_1,sup_title_1,sub_title_1,plot_style_1,xlabel_1,ylabel_1,18,15,12,filename_1,[pwd,'\fig\data\'],X_scale,Y_scale,packagenum);



fname_2=[sup_title_2,' ',num2str(packagenum)];
fname_2=strtrim(fname_2);
filename_2=fname_2;
%datapath_2=savedata(x2,y2,fname_2,sup_title_2,sub_title_2,plot_style_2,xlabel_2,ylabel_2,18,15,12,filename_2,[pwd,'\fig\',block,'\',],X_scale,Y_scale);
datapath_2=savedata(x2,y2,fname_2,sup_title_2,sub_title_2,plot_style_2,xlabel_2,ylabel_2,18,15,12,filename_2,[pwd,'\fig\data\'],X_scale,Y_scale,packagenum);

axshow(datapath_1,handles.uipanel2,handles);
axshow(datapath_2,handles.uipanel6,handles);
clc








%figsave=splot(x2,y2,sub_title_2,plot_style_2,xlabel_2,ylabel_2,block,name2,packagenum);
%axshow(figsave,handles.axes3)
end

function datapath=savedata(x,y,fname,sup_title,sub_title,plot_style,labelx,labely,suptitle_size,subtitle_size,label_size,filename,pathway,X_scale,Y_scale,packagenum)
datapath=[pathway,filename,'.mat'];
save(datapath)
end





    
        
    




    
    
    
