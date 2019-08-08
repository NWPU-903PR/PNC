%Remainder: Please install gurobi before running our code (http://www.gurobi.com/)

%Remainder: Please install gurobi before running our code (http://www.gurobi.com/)

%Remainder: Please install gurobi before running our code (http://www.gurobi.com/)

This package includes Matlab scripts and several datasets for demo of PNC approaches: 

(a)	main_PNC.m is a Matlab function for the routine of experimental analysis. 

(b)	main_PNC.m is the main script to call PNC by supplying following parameters: (1)	expression_tumor_fileName: the directory locating of the gene tumor expression data as the input data. (2) expression_normal_fileName: the directory locating of the gene normal expression data as the input data. (b) PNC.m is the main script to call PNC 

(c) The input datasets include: (1) expression_tumor_fileName.txt: the gene tumor expression data. (2) expression_normal_fileName.txt: the gene normal expression data. Note that the samples in expression_tumor_fileName.txt and expression_normal_fileName.txt should be paired.

The output datasets include: The sample-specific driver profiles (matrix) by using PNC； For PNC, the column is the samples and the rows is the genes. The value “1” denoted that the gene is driver genes; 

(d) We choose 5 patients data in BRCA as a test case in our demo. As a demo, users can directly run main_PNC.m in Matlab and obtain the corresponding results quickly.This package has been tested in different computer environments as: Window 7 or above; Matlab 2014 or above.

(e) When users analyzed yourself new data, please: (1) Prepare input datasets as introduced in (d). (2) Clear the previous results. (3) Set parameters in PNC.m as introduced in (b). (4) Run main_PNC.m. (5) Suggest that the users add all fille in our folders to your folder.

% $Id: main_PNC.m Created at 2019-05-29 22:22:20 $ 

% by Weifeng Guo, Northwestern Polytechtical University, China % Copyright (c) 2014-2019 by Key Laboratory of Information Fusion Technology of Ministry of Education in Northwestern Polytechnical University and key Laboratory of Systems Biology in Shanghai Institutes for Biological Science; 

% If any problem,pleasse contact shaonianweifeng@126.com for help.
