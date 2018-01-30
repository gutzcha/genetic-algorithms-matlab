function rocket=scoore_grader(rocket,target,obstacles)
    for i=1:size(rocket,2)
        path=rocket(i).path;
        d=((path(1,:)-target(1,1)).^2+(path(2,:)-target(2,1)).^2).^(0.5);
        d(d<=0.1)=1;
        d=1./d;
        %increase hit scoore
        hitidx=find(isinf(d));
        d(hitidx)=1;
        if ~isempty(hitidx)
            d(hitidx(1):end)=0;
        end
        %decrese crash scoore
        for obs=1:size(obstacles,2)
        crash(1,:)=path(1,:)<obstacles(obs).obstacles(1,2)&path(1,:)>obstacles(obs).obstacles(1,1);
        crash(2,:)=path(2,:)<=obstacles(obs).obstacles(2,2)&path(2,:)>=obstacles(obs).obstacles(2,1);
        carsh=sum(crash);
        crashidx=find(crash==2);
        d(crashidx)=0.0;
        end
        if ~isempty(crashidx)
            %d=0;
            d(crashidx(1):end)=0;
        end
        
   %    rocket(i).hit=true;
        didx=1:size(d,2);
        
        pscoore=(1./didx);
        absScoore(i,:)=d;
        %+0.0001*pscoore;
        %-0.001*didx;
    end
        Smax=max(max(absScoore));
        Smin=min(min(absScoore));
        Normscoore=round(((absScoore-Smin)./(Smax-Smin))*100);
        for i=1:size(rocket,2)
        [rocket(i).topscoore, rocket(i).topidx]=max(Normscoore(i,:));
        end
end