function dna=dnaGen(dna1, dna2,moves);
%moves=15;
if isempty(dna1)&&isempty(dna1)
dna=[round((-1-1)*rand(1,moves)+1);round((-1-1)*rand(1,moves)+1)];
else
    %find shorter paths length
    mut=1.1;
    idx=min([size(dna1,2) size(dna2,2)]);
    %find random dna between 2 dna
    dnap1= round(mut*((dna1(:,1:idx)-dna2(:,1:idx)).*rand(1) + dna2(:,1:idx)));
   %add rest of the way randomly
    dnap2=[round((-1-1)*rand(1,moves-idx)+1);round((-1-1)*rand(1,moves-idx)+1)];
    dna=[dnap1 dnap2];
   end
end