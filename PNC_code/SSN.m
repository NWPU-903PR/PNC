function [ index_R,p ] = SSN( sample,ref )
%function:construct the SSN
%   Input:
%         sample:calculated sample
%          ref:the reference samples
%   Output:
%         adjacency_matrix:the network structure
%a example
% sample=new_T(:,1);
% ref=new_N;

[R,P]=corrcoef(ref');
final_R0=R;
final_R0(isnan(final_R0))=0;

NEW_data=[ref sample];
[R1,P1]=corrcoef(NEW_data');
final_R1=R1;
final_R1(isnan(final_R1))=0;

index_R=final_R1-final_R0;
[m,n]=size(ref);
Z=index_R./((1-final_R0.^2)/(n-1));
Z(Z==inf)=max(max(Z));
Z(Z==-inf)=-max(max(Z));
Z(isnan(Z))=0;

clear NEW_data final_R1 final_R0 R0 R1 P P1
p=1-normcdf(abs(Z));

end

