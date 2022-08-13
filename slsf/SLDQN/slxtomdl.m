function slxtomdl(modelfile)
modellist = modelfile;
disp(modellist)
disp(length(modellist))
for i=1:length(modellist)
    oldpath = cd(modellist(i).folder)
    cd
    model = modellist(i).name(1:end-4);
    load_system(model)
    save_system(model,[model '.mdl'])
    close_system(model)
    cd(oldpath)
    cd
end
