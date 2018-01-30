function [dna1 dna2]= geneSelector (pool)
    parents=2;
    dna.dna=[];
    if size(pool,2)<parents
        dna1=[];
        dna2=[];
    else
        dnainx=[];
        for i=1:parents
            emptydna=true;
            dnainx=[dnainx randi(size(pool,2))];
            while emptydna==true;
                if isempty(pool(dnainx(i)).dna)
                        if dnainx(i)<size(pool,2)
                            dnainx(i)=dnainx(i)+1;
                        else
                            dnainx(i)=2;
                        end
                    else
                        emptydna=false;
                 end
                end
            dna(i).dna=pool(dnainx(i)).dna;
            pool(dnainx(i)).dna=[];                  
        end
        dna1=dna(1).dna;
        dna2=dna(2).dna;    
        end
end