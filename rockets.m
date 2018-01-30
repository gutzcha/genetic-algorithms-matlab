function rockets(rocketnumber,moves,perC,mut_deg,mut_length,target,pouse_time,generations,obstacles)
%walls
obstacles(4).obstacles=[-100 -100; -0.2*target(2,1) 1.2*target(2,1)];
obstacles(5).obstacles=[100 100; -0.2*target(2,1) 1.2*target(2,1)];
obstacles(6).obstacles=[-100 100; -0.2*target(2,1) -0.2*target(2,1)];
obstacles(7).obstacles=[-100 100; 1.2*target(2,1) 1.2*target(2,1)];


pool=[];
tempperC=perC;          %incase it's stuck in a local minimum
for gen=1:generations
    if mod(gen,round(0.1*generations))==1||mod(gen,round(0.1*generations))==2
        perC=0.2;
    else
        perC=tempperC;
    end
    %creat random Dna for each rocket from pool
    for i=1:rocketnumber
        [dna1, dna2]=geneSelector(pool);
        rocket(i).dna=dnaGen(dna1,dna2,moves);
    end
    
        
    %add ranrom mutations
    rocket=random_mut(rocket,perC,mut_deg,mut_length);

    %creat path for each rocket
    for i=1:rocketnumber
        rocket(i).path=pathmaker(rocket(i).dna,target,obstacles);
    end
        
    %give scoore to each path
    rocket=scoore_grader(rocket,target,obstacles);
    
    %creat a gene pool
    pool=genepool(rocket);
    
    %plot each rocket path
    make_plots(target, rocket,gen,obstacles);
    
    pause (pouse_time)
end
%clear
end