function [file_metrics] = run_for_metrics(filePath)
    %UNTITLED 此处提供此函数的摘要
    %   此处提供详细说明
    metrics = [
        %'CloneContent',
        %   "CloneDetection",
           "CyclomaticComplexity",
         %  "DescriptiveBlockNames",
          % "DiagnosticWarningsCount",
           %"ExplicitIOCount",
          % "FileCount",
           "IOCount",
           "LayerSeparation",
          % "LibraryContent",
          % "LibraryLinkCount",
         %  "MatlabCodeAnalyzerWarnings",
          % "MatlabFunctionCount",
         %  "MatlabLOCCount",
         %  "ModelFileCount",
          % "ParameterCount",
           "SimulinkBlockCount",
        %   "StateflowChartCount",
         %  "StateflowChartObjectCount",
         %  "StateflowLOCCount",
           "SubSystemCount",
           "SubSystemDepth",
           ]; 
    
    fileFolder = fullfile(filePath);
    dirOutput = dir(fullfile(fileFolder, '*.slx'));
    fileNames = {dirOutput.name};
    file_metrics = zeros(length(fileNames), length(metrics)+1);
    
    
    for i = 1:length(fileNames)
        fileName = strsplit(string(fileNames(i)), '.');
        fileName = fileName(1);
        fprintf("%d/%d", [i, length(fileNames)]);
        tStart = tic;           % pair 2: tic
        n = 6;
        T = zeros(length(fileNames),6);
        load_system(fileName)
        LinehanPath = find_system(fileName,'FindAll','on','LookUnderMasks','on','FollowLinks','on','type','line');
        LinkCount = length(LinehanPath);
        for j = 1:length(metrics)
            try
                tic         % pair 1: tic
                file_metrics(i, j) = get_matlab_metrics(fileName, char(metrics(j)));
                file_metrics(i, j+1) = LinkCount;
                T(i,j)= toc;  % pair 1: toc
            catch
                file_metrics(i, j) = -1;
            end
             bdclose(fileName)
        end 
        tEnd = toc(tStart);
    end
    save('MetricsTime','T','tEnd')
    clear T 
    clear tEnd
end