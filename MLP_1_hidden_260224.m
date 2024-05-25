clc;
clear;

% load Doernenburg_training_data.txt;
% x1 = Doernenburg_training_data(:,1:4);
% t1 = Doernenburg_training_data(:,5:10);
% load Doernenburg_testing_data.txt;
% x2 = Doernenburg_testing_data(:,1:4);
% t2 = Doernenburg_testing_data(:,5:10);

% load Rogers_training_data.txt;
% x1 = Rogers_training_data(:,1:4);
% t1 = Rogers_training_data(:,5:10);
% load Rogers_testing_data.txt;
% x2 = Rogers_testing_data(:,1:4);
% t2 = Rogers_testing_data(:,5:10);

load IEC_training_data.txt;
x1 = IEC_training_data(:,1:3);
t1 = IEC_training_data(:,4:9);
load IEC_testing_data.txt;
x2 = IEC_testing_data(:,1:3);
t2 = IEC_testing_data(:,4:9);

% load CSUS_training_data.txt;
% x1 = CSUS_training_data(:,1:5);
% t1 = CSUS_training_data(:,6:11);
% load CSUS_testing_data.txt;
% x2 = CSUS_testing_data(:,1:5);
% t2 = CSUS_testing_data(:,6:11);

nin = 3; %so nut dau vào
nhidden = 3; %so nut an
nout = 6; % so nut ra
%Khoi tao trong so, do lech
w1 = randn(nin, nhidden);
b1 = randn(1, nhidden);
w2 = randn(nhidden, nout);
b2 = randn(1, nout);
M = 20000;
nu = 0.001;
alpha = 0.1;
N1 = size(x1,1);
for i = 1:M 
    a1 = x1*w1 + ones(N1,1)*b1;
    y = tanh(a1);
    a2 = y*w2 + ones(N1,1)*b2;
    temp = exp(a2);
    z = temp./(sum(temp, 2)*ones(1,nout));
    
    delout = z - t1;  %sai so dau ra cua mang ung voi du lieu
    gw2 = y'*delout;
    gb2 = sum(delout,1);
    
    delhid = (delout*w2').*(1.0 - y.*y);
    gw1 = x1'*delhid;
    gb1 = sum(delhid, 1);
    w1 = w1 - nu*(gw1 + alpha*w1);
    b1 = b1 - nu*(gb1 + alpha*b1);
    w2 = w2 - nu*(gw2 + alpha*w2);
    b2 = b2 - nu*(gb2 + alpha*b2);
end
N2 = size(x2,1);%x2 test data
a1 = x2*w1 + ones(N2,1)*b1;
y = tanh(a1);
a2 = y*w2 + ones(N2,1)*b2;
temp = exp(a2);
z = temp./(sum(temp, 2)*ones(1,nout));
[C,rate] = confmat(z,t2)

C1 = C(1,1);
C2 = C(1,2);
C3 = C(1,3);
C4 = C(1,4);
C5 = C(1,5);
C6 = C(1,6);

C7 = C(2,1);
C8 = C(2,2);
C9 = C(2,3);
C10 = C(2,4);
C11 = C(2,5);
C12 = C(2,6);

C13 = C(3,1);
C14 = C(3,2);
C15 = C(3,3);
C16 = C(3,4);
C17 = C(3,5);
C18 = C(3,6);

C19 = C(4,1);
C20 = C(4,2);
C21 = C(4,3);
C22 = C(4,4);
C23 = C(4,5);
C24 = C(4,6);

C25 = C(5,1);
C26 = C(5,2);
C27 = C(5,3);
C28 = C(5,4);
C29 = C(5,5);
C30 = C(5,6);

C31 = C(6,1);
C32 = C(6,2);
C33 = C(6,3);
C34 = C(6,4);
C35 = C(6,5);
C36 = C(6,6);

TP_1 = C1;
FN_1 = C2 + C3 + C4 + C5 + C6;
FP_1 = C7 + C13 + C19 + C25 + C31;
TN_1 = C8 + C9 + C10 + C11 + C12 + C14 + C15 + C16 + C17 + C18 +...
       C20 + C21 + C22 + C23 + C24 + C26 + C27 + C28 + C29 + C30 +...
       C32 + C33 + C34 + C35 + C36;

TP_2 = C8;
FN_2 = C7 + C9 + C10 + C11 + C12;
FP_2 = C2 + C14 + C20 + C26 + C32;
TN_2 = C1 + C3 + C4 + C5 + C6 + C13 + C15 + C16 + C17 + C18 +...
       C19 + C21 + C22 + C23 + C24 + C25 + C27 + C28 + C29 + C30 +...
       C31 + C33 + C34 + C35 + C36;
   
TP_3 = C15;
FN_3 = C13 + C14 + C16 + C17 + C18;
FP_3 = C3 + C9 + C21 + C27 + C33;
TN_3 = C1 + C2 + C4 + C5 + C6 + C7 + C8 + C10 + C11 + C12 +...
       C19 + C20 + C22 + C23 + C24 + C25 + C26 + C28 + C29 + C30 +...
       C31 + C32 + C34 + C35 + C36;

TP_4 = C22;
FN_4 = C19 + C20 + C21 + C23 + C24;
FP_4 = C4 + C10 + C16 + C28 + C34;
TN_4 = C1 + C2 + C3 + C5 + C6 + C7 + C8 + C9 + C11 + C12 +...
       C13 + C14 + C15 + C17 + C18 + C25 + C26 + C27 + C29 + C30 +...
       C31 + C32 + C33 + C35 + C36;

TP_5 = C29;
FN_5 = C25 + C26 + C27 + C28 + C30;
FP_5 = C5 + C11 + C17 + C23 + C35;
TN_5 = C1 + C2 + C3 + C4 + C6 + C7 + C8 + C9 + C10 + C12 +...
       C13 + C14 + C15 + C16 + C18 + C19 + C20 + C21 + C22 + C24 +...
       C31 + C32 + C33 + C34 + C36;

TP_6 = C36;
FN_6 = C31 + C32 + C33 + C34 + C35;
FP_6 = C6 + C12 + C18 + C24 + C30;
TN_6 = C1 + C2 + C3 + C4 + C5 + C7 + C8 + C9 + C10 + C11 +...
       C13 + C14 + C15 + C16 + C17 + C19 + C20 + C21 + C22 + C23 +...
       C25 + C26 + C27 + C28 + C29;

TP = [TP_1 TP_2 TP_3 TP_4 TP_5 TP_6];
FN = [FN_1 FN_2 FN_3 FN_4 FN_5 FN_6];
FP = [FP_1 FP_2 FP_3 FP_4 FP_5 FP_6];
TN = [TN_1 TN_2 TN_3 TN_4 TN_5 TN_6];

Accuracy = (TP + TN)./(TP + TN + FP + FN);
Sensitivity = TP./(TP + FN);
Specificity = TN./(TN + FP);
Accuracy_Sensitivity_Specificity = [Accuracy' Sensitivity' Specificity']
% A=(sum(TP)+sum(TN))/(sum(TP)+sum(TN)+sum(FP)+sum(FN))
% Se=sum(TP)/(sum(TP)+sum(FN))
% Sp=sum(TN)/(sum(TN)+sum(FP))

[y, x] = roc(t2',z');

plot(x{1},y{1},'r-','linewidth',2);
hold on;
plot(x{2},y{2},'b-','linewidth',2);
hold on;
plot(x{3},y{3},'k-','linewidth',2);
hold on;
plot(x{4},y{4},'r--','linewidth',2);
hold on;
plot(x{5},y{5},'b--','linewidth',2);
hold on;
plot(x{6},y{6},'k--','linewidth',2);
set(gca,'FontName','Arial','FontSize',12);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
grid on;
legend('PD','D1','D2','T1','T2','T3');
AUC_PD = trapz(x{1},y{1});
AUC_D1 = trapz(x{2},y{2});
AUC_D2 = trapz(x{3},y{3});
AUC_T1 = trapz(x{4},y{4});
AUC_T2 = trapz(x{5},y{5});
AUC_T3 = trapz(x{6},y{6});
AUC_PD_D1_D2_T1_T2_T3 = [AUC_PD AUC_D1 AUC_D2 AUC_T1 AUC_T2 AUC_T3]
