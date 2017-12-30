function []=fsaveplot(block,tezhen_mat,handles)

k=ls([pwd,'\fig\data']);

for te=1:size(tezhen_mat,1)
    tezhen_sub_mat=tezhen_mat(te,:);
    for tesub=1:size(tezhen_sub_mat,1)
        tezhen=tezhen_sub_mat{tesub,1};
        pat=tezhen_sub_mat{tesub,2};
        saveflag=tezhen_sub_mat{tesub,3};
        filename_mat=k(arrayfun(@(n)all(isequal(k(n,1:length(pat)),pat)),[1:size(k,1)]'),:);
       
        for i=1:size(filename_mat,1)
            filename=filename_mat(i,:)  ;
            filename=strtrim(filename);
            datapath=[pwd,'\fig\data\',filename];
            if saveflag==1
                h=plotfig(datapath,handles);
                saveas(h,[pwd,'\fig\',block,'\',filename(1:end-4),'.png']);
                close (h);
            end
        end
    end
end

end




    
