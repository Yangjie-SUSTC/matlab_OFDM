function plotnum=splot(datapath,handles)
    load(datapath)
    set(handles.edit24,'String',num2str(packagenum));
    plotnum=size(y,2);
    if plotnum==1
        
        spplot(x,y,plot_style)
        xlabel(labelx,'fontsize',label_size);
        ylabel(labely,'fontsize',label_size);
        if string(labelx)=='Frequency / MHz'
            wc=str2num(get(handles.edit21,'String'));
            if max(x)>2*wc
            pd=y>max(y)*0.01;
            xz=find(pd==1);
            xlim([x(min(xz)),x(max(xz))])
            end
        end
      
            
            
    
        set(gca,'XScale',X_scale)
        set(gca,'YScale',Y_scale)
    else
        for count=1:plotnum
        h=subplot(plotnum*100+10+count);
        spplot(x(:,count),y(:,count),plot_style(:,count))
        if string(labelx(count))=='Frequency / MHz'
            wc=str2num(get(handles.edit21,'String'));
            if max(x)>2*wc
            pd=y(:,count)>max(y(:,count))*0.01;
            xz=find(pd==1);
            xlim([min(xz),max(xz)])
            end
        end
        xlabel(labelx{count},'fontsize',label_size);
        ylabel(labely{count},'fontsize',label_size)
        title(sub_title{count},'fontsize',subtitle_size)
        end
     
        
    end
end




function []=spplot(x,y,plot_style)
    if plot_style==1
        plot(x,y)
    else
        stem(x,y)
    end
    if max(y)==min(y)
        if min(y)==0
            miny=-1;
            maxy=1;
        else
            miny=min(0.9*min(y),1.1*min(y));
            maxy=max(0.9*min(y),1.1*min(y));
        end
    else
        miny=min(y);
        maxy=max(y);
    end
    axis([min(x),max(x),miny,maxy]); 
end