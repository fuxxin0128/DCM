clear all
close all

data_path = 'H:\fMRI_data';
members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
trial_num = 50;

spm('Defaults','fMRI');
spm_jobman('initcfg');

clear matlabbatch

for t = 1:size(members,2)
    for s = 1:6
        matlabbatch{1}.spm.dcm.bms.inference.dir = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)]));
        for m = 1:8
            matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{1}.dcmmat{m,1} = fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],['DCM_',num2str(m),'.mat']);
        end
        matlabbatch{1}.spm.dcm.bms.inference.model_sp = {''};
        matlabbatch{1}.spm.dcm.bms.inference.load_f = {''};
        matlabbatch{1}.spm.dcm.bms.inference.method = 'FFX';
        matlabbatch{1}.spm.dcm.bms.inference.family_level.family_file = {''};
        matlabbatch{1}.spm.dcm.bms.inference.bma.bma_no = 0;
        matlabbatch{1}.spm.dcm.bms.inference.verify_id = 1;
        
        spm_jobman('run',matlabbatch);
        clear matlabbatch
    end
end