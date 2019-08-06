clc
clear
%   $Id: main_PNC.m Created at 2019-05-29 22:22:20 $
%   by Weifeng Guo, Northwestern Polytechtical University, China
%   Copyright (c) 2014-2019 by Key Laboratory of Information Fusion Technology of Ministry of Education in Northwestern Polytechnical University,
%   and key Laboratory of Systems Biology in Shanghai Institutes for Biological Science; 
%   If any problem,pleasse contact shaonianweifeng@126.com for help.

%Remainder: Please install gurobi before running our code
%Remainder: Please install gurobi before running our code
%Remainder: Please install gurobi before running our code

%**************Part 1:Input the information of samples and network information****
%**************sample information**************
%Example:TCGA-example cancer data (BRCA cancer datasets)
expression_tumor_fileName = 'Example_tumor.txt';
expression_normal_fileName = 'Example_normal.txt';


%%**************Part 2:Network control methods output the predicted combinational drugs****

[ PNC_driver_result ] = PNC( expression_tumor_fileName,expression_normal_fileName);

%%**************Part 3:save the result****

save PNC_driver_result 
