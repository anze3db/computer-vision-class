function histograms = getAllHists(files,bins)
    files=textread(files, '%s');
    histograms=0;
    nb=2;
    histograms=zeros(length(files),bins^3);
    
    
    for i = 1 : length(files)
        %filename=char(files(i));%matlab

        filename=['/home/smotko/development/zks/vaja2/',files{i}];%octave
        I = imread(filename) ;
        h = myhist2RGB(I,bins);
        histograms(i,:) = h(:) ;
    end
end

