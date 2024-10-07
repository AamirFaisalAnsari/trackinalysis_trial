% create extended vector for
% estimating weighted median according to my definition
% weight_vect should be integers
function ext_vect=extended_vector_afa(vect, weight_vect)

% vect=[2,1,3,4];
% weight_vect=[2,1,1,6];
ext_vect=[];
for i=1:length(vect)
    ext_vect=[ext_vect;repmat(vect(i),weight_vect(i),1)];
end

