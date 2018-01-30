function pool=genepool(rocket);
pool.dna=[];   
    for i=1:size(rocket,2)
        topscoore(i)=rocket(i).topscoore;
        topidx(i)=rocket(i).topidx;
        for j=1:round(topscoore(i))
            pool(end+1).dna=rocket(i).dna(:,1:topidx(i));
        end
    end
end