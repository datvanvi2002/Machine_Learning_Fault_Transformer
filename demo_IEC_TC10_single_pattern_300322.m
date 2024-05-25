clc;
clear;
load dga_data_117.txt;
x1 = dga_data_117(:,1);
x2 = dga_data_117(:,2); 
x3 = dga_data_117(:,3);
i = 49;
Fault_code = Duval_DGA(x1(i),x2(i),x3(i)) %ma loi



