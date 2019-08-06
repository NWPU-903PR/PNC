function [ PNC_driver_result ] = PNC( expression_tumor_fileName,expression_normal_fileName)
%we output the sample-specific driver profiles by using different control
%methods
%   Input:
%         expression_fileName including expression_tumor_fileName and expression_normal_fileName)   
%         index:denotes we use which network construction method

%  Output:
%         The sample-specific driver profiles of PNC;
%         The column is the samples and the rows is the genes. The value “1” denoted that the gene is driver genes; 
%************************part1:LOAD sample data and network data************************
%********************obtain the paired expression data******************

[tumor,~,name_tumor]=importdata(expression_tumor_fileName);
gene_list=tumor.textdata(2:end,1);tumor_data=tumor.data;
[normal,~,name_normal]=importdata(expression_normal_fileName);
Sample_name_normal=normal.textdata(1,2:end);normal_data=normal.data;
data=tumor_data;ref_data=normal_data;



load('GIN_network_information.mat')
%load('sPPI_network_information.mat')
%[~,PPI,~]=xlsread('network_FIsInGene_041709.xlsx');
[x1,y1]=ismember(edge0(:,1),gene_list);
[x2,y2]=ismember(edge0(:,2),gene_list);

y=y1.*y2;
z=[y1 y2];
z(find(y==0),:)=[];
N1=length(gene_list);
[N2,~]=size(z);

Net=zeros(N1,N1);

for i=1:N2
    
         Net(z(i,2),z(i,1))=1;  %undirected gene-gene interaction network
         %Net(z(i,1),z(i,2))=1;    
end



    
 %***************paired SSN*********************** 
 
  
%for i=1:size(data,2)
  for i=1:2
    
    tic
    i
   
    sample_tumor=data(:,i);
    [R0,P]=SSN(sample_tumor,ref_data);
    
   P(isnan(P))=1;
   P(P>=0.05)=0;
   P(P~=0)=1;
    %construct the normal SSN
    clear  sample_tumor 
    sample_normal=ref_data(:,i);
    [R1,P1]=SSN(sample_normal,ref_data);
    clear  sample_normal 
    
   P1(isnan(P1))=1;
   P1(P1>=0.05)=0;
   P1(P1~=0)=1;
    C=abs(P-P1).*Net; 
    
    
    [x,y]=find(C~=0);
    Dz1=[y x];N=length(C);

[ PNC_x1,PNC_nd1 ] = Opti_weight_nc( Dz1,N  );

 
PNC_driver_result(:,i)=PNC_x1;
    
 toc   
 
    
end




end

