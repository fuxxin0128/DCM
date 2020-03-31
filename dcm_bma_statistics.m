clear all
close all

data_path = 'H:\fMRI_data';
members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};

cd('H:\fMRI_data\dcm_bms_noFB');

load('H:\fMRI_data\dcm_bms_noFB\BMS.mat')

hvalue_a = zeros(4,4);
pvalue_a = zeros(4,4);
hvalue_b = zeros(4,4);
pvalue_b = zeros(4,4);
hvalue_c = zeros(4,1);
pvalue_c = zeros(4,1);

%A
for i = 1:4
    for j = 1:4
        [h,p,ci,stats] = ttest(BMS.DCM.ffx.bma.a(i,j,:));
        hvalue_a(i,j) = h;
        pvalue_a(i,j) = p;
    end
end

%B
for i = 1:4
    for j = 1:4
        [h,p,ci,stats] = ttest(BMS.DCM.ffx.bma.b(i,j,1,:));
        hvalue_b(i,j) = h;
        pvalue_b(i,j) = p;
    end
end

%C
for i = 1:4
        [h,p,ci,stats] = ttest(BMS.DCM.ffx.bma.c(i,1,:));
        hvalue_c(i) = h;
        pvalue_c(i) = p;
end

save('statistic_conn_FB','hvalue_a','pvalue_a','hvalue_b','pvalue_b','hvalue_c','pvalue_c');
