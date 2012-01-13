h = getAllHists('data/slike.txt', 8);
ref = h(10,:);

files=textread('data/slike.txt', '%s');
distances = {'l2', 'chi2','hell','intersect'};
for img=1:length(distances)
    
    getDistanceHist(ref, h(1,:), distances{img});
    res = zeros(length(files),1);
    for i = 1:length(files)
        res(i,1) = getDistanceHist(ref, h(i,:), distances{img});
    endfor
    
    res_s = sort(res(:,:));
    figure(img); clf;
    for i = 1:6
        for k = 1:length(res)
            
            if res_s(i) == res(k)
                filename=['/home/smotko/development/zks/vaja2/',files{k}];%octave
                subplot(3,6,i);
                imshow(imread(filename));
                title(distances{img});
                subplot(3,6,6+i);
                plot(h(k,:));
                title(num2str(res_s(i)));
            end
        end
        subplot(3,6,13);
        bar(res_s(1:6));
        subplot(3,6,14);
        bar(res_s(1:20));
        subplot(3,6,15);
        bar(res_s(1:50));
        subplot(3,6,16);
        bar(res_s(1:length(files)));
        
    endfor

end



