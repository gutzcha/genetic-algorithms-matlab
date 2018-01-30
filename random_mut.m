function [rocket]=random_mut(rocket,perC,mut_deg,mut_length)
    mut_num=round(perC*size(rocket,2));
    rocketidx=randi(size(rocket,2),1,mut_num); %number of mutated rockts
    for i=1:mut_num    
        mut_count=round(size(rocket(rocketidx(i)).dna,2)*(mut_deg));     %how many mutation segments
        mut_segment_len=round(size(size(rocket(rocketidx(i)).dna,2))*mut_length);%lenght of each mutated segment
        mut_spots=randi(size(rocket(rocketidx(i)).dna,2),1,mut_count);   %idx of mutations
        mut_segmentidx=[];
        for j=1:size(mut_spots,2)
            mut_segmentidx=[mut_segmentidx mut_spots(j):mut_spots(j)+mut_segment_len];
        end
        
        rocket(rocketidx(i)).dna(mut_segmentidx)=-rocket(rocketidx(i)).dna(mut_segmentidx);    
    %round((-1-1)*rand(1)+1) ;
    %(-1)*rocket(rocketidx(i)).dna(mut_segmentidx);
    end
end