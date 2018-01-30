function path=pathmaker(dna,target,obstacles)
path=[0;0];
for k=1:size(dna,2)-1
    pathsum=path(:,end)+dna(:,k);
    path=[path pathsum];
    
end
path= checkhit(path,target);
path= check_crash(path,obstacles);
end

function path= checkhit(path, target)
%check hit
    Gap=target(3,1);
    hit=zeros(2,size(path,2));
    for i=1:2
    hit(i,:)=(path(i,:)<(target(i,1))+Gap)&(path(i,1)>(target(i,1))-Gap);
    hit=sum(hit);
    hitidx=find(hit==2);
    if ~isempty(hitidx)
        path(1,hitidx(1):end)=path(1,hitidx(1));
        path(2,hitidx(1):end)=path(2,hitidx(1));
    end
    end
end
function path= check_crash(path, obstacles)
    %check crash
%    Gap=obstacles;
    %obstacles(1,:)=[obstaclesP(1,1):0.1:obstaclesP(1,:)];
    %obstacles(2,:)=[obstaclesP(2,1):0.1:obstaclesP(2,:)];
    crash=zeros(2,size(path,2));
    for obs=1:size(obstacles,2)
        crash(1,:)=(path(1,:)<=obstacles(obs).obstacles(1,2))&(path(1,:)>=obstacles(obs).obstacles(1,1));
        crash(2,:)=(path(2,:)<=obstacles(obs).obstacles(2,2))&(path(2,:)>=obstacles(obs).obstacles(2,1));
        crashlog=sum(crash);
        crashidx=find(crashlog==2);
        if ~isempty(crashidx)
            path(1,crashidx(1):end)=path(1,crashidx(1));
            path(2,crashidx(1):end)=path(2,crashidx(1));
            %path(crashidx(1)-300);%need to change to be dependant of d from obstacle
        end
    end
end
