clear all
close all

data_path = 'H:\fMRI_data';
members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
trial_num = 50;

spm('Defaults','fMRI');
spm_jobman('initcfg');

clear matlabbatch

cd('H:\fMRI_data\group_analysis_one_sample_t');

% X = 1;
% Y = 1;

matlabbatch{1}.spm.dcm.bms.inference.dir = {'H:\fMRI_data\dcm_bms_FB'};
matlabbatch{2}.spm.dcm.bms.inference.dir = {'H:\fMRI_data\dcm_bms_noFB'};
for t = 1:size(members,2)
    for s = 1:6
        if t<strmatch('nakamura',members)&&mod(s,2)==1
            for m = 1:8
                matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{t}(quorem(sym(s),sym(2))+1).dcmmat{m,1} = fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],['DCM_',num2str(m),'.mat']);
            end
        elseif t>=strmatch('nakamura',members)&&mod(s,2)==0
            for m = 1:8
                matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{t}(s/2).dcmmat{m,1} = fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],['DCM_',num2str(m),'.mat']);
            end
        elseif t<strmatch('nakamura',members)&&mod(s,2)==0
            for m = 1:8
                matlabbatch{2}.spm.dcm.bms.inference.sess_dcm{t}(s/2).dcmmat{m,1} = fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],['DCM_',num2str(m),'.mat']);
            end
        elseif t>=strmatch('nakamura',members)&&mod(s,2)==1
            for m = 1:8
                matlabbatch{2}.spm.dcm.bms.inference.sess_dcm{t}(quorem(sym(s),sym(2))+1).dcmmat{m,1} = fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],['DCM_',num2str(m),'.mat']);
            end
        end
    end
end

matlabbatch{1}.spm.dcm.bms.inference.model_sp = {''};
matlabbatch{1}.spm.dcm.bms.inference.load_f = {''};
matlabbatch{1}.spm.dcm.bms.inference.method = 'FFX';
matlabbatch{1}.spm.dcm.bms.inference.family_level.family_file = {''};
matlabbatch{1}.spm.dcm.bms.inference.bma.bma_yes.bma_famwin = 'famwin';
matlabbatch{1}.spm.dcm.bms.inference.verify_id = 1;

matlabbatch{2}.spm.dcm.bms.inference.model_sp = {''};
matlabbatch{2}.spm.dcm.bms.inference.load_f = {''};
matlabbatch{2}.spm.dcm.bms.inference.method = 'FFX';
matlabbatch{2}.spm.dcm.bms.inference.family_level.family_file = {''};
matlabbatch{2}.spm.dcm.bms.inference.bma.bma_yes.bma_famwin = 'famwin';
matlabbatch{2}.spm.dcm.bms.inference.verify_id = 1;

spm_jobman('run',matlabbatch);
clear matlabbatch