clear all
close all
% This batch script analyses the Attention to Visual Motion fMRI dataset
% available from the SPM website using DCM:
%   http://www.fil.ion.ucl.ac.uk/spm/data/attention/
% as described in the SPM manual:
%   http://www.fil.ion.ucl.ac.uk/spm/doc/spm12_manual.pdf#Chap:DCM_fmri
%__________________________________________________________________________
% Copyright (C) 2014 Wellcome Trust Centre for Neuroimaging

% Guillaume Flandin & Peter Zeidman
% $Id: dcm_spm12_batch.m 12 2014-09-29 19:58:09Z guillaume $


% Directory containing the attention data
%--------------------------------------------------------------------------
data_path = 'H:\fMRI_data';
members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
trial_num = 50;



% Initialise SPM
%--------------------------------------------------------------------------
spm('Defaults','fMRI');
spm_jobman('initcfg');
%spm_get_defaults('cmdline',1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GLM SPECIFICATION, ESTIMATION & INFERENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% factors = load(fullfile(data_path,'factors.mat'));

% f = spm_select('FPList', fullfile(data_path,'functional'), '^snf.*\.img$');

clear matlabbatch
for t = 1:size(members,2)
    for s = 1:6
        % OUTPUT DIRECTORY
        %--------------------------------------------------------------------------
        matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM']));
        matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = ['sess',num2str(s)];
        
        % MODEL SPECIFICATION
        %--------------------------------------------------------------------------
        % matlabbatch{2}.spm.stats.fmri_spec.dir = cellstr(fullfile(data_path,'GLM'));
        % matlabbatch{2}.spm.stats.fmri_spec.timing.units = 'scans';
        % matlabbatch{2}.spm.stats.fmri_spec.timing.RT    = 3;
        % matlabbatch{2}.spm.stats.fmri_spec.sess.scans            = cellstr(f);
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(1).name     = 'Photic';
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(1).onset    = [factors.att factors.natt factors.stat];
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(1).duration = 10;
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(2).name     = 'Motion';
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(2).onset    = [factors.att factors.natt];
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(2).duration = 10;
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(3).name     = 'Attention';
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(3).onset    = [factors.att];
        % matlabbatch{2}.spm.stats.fmri_spec.sess.cond(3).duration = 10;
        
        % MODEL ESTIMATION
        %--------------------------------------------------------------------------
        % matlabbatch{3}.spm.stats.fmri_est.spmmat = cellstr(fullfile(data_path,'GLM','SPM.mat'));
        
        % INFERENCE
        %--------------------------------------------------------------------------
%         matlabbatch{2}.spm.stats.con.spmmat = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
%         matlabbatch{2}.spm.stats.con.consess{1}.fcon.name = 'Effects of Interest';
%         matlabbatch{2}.spm.stats.con.consess{1}.fcon.weights = [1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%             0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%             0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%             0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%             0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%             0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0];
%         if t<strmatch('nakamura',members)
%             matlabbatch{2}.spm.stats.con.consess{2}.tcon.name = 'with';
%             matlabbatch{2}.spm.stats.con.consess{2}.tcon.weights = [1     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0    0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0];
%             matlabbatch{2}.spm.stats.con.consess{3}.tcon.name = 'without';
%             matlabbatch{2}.spm.stats.con.consess{3}.tcon.weights = [0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0    0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0];
%         else
%             matlabbatch{2}.spm.stats.con.consess{2}.tcon.name = 'with';
%             matlabbatch{2}.spm.stats.con.consess{2}.tcon.weights = [0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0    0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0];
%             matlabbatch{2}.spm.stats.con.consess{3}.tcon.name = 'without';
%             matlabbatch{2}.spm.stats.con.consess{3}.tcon.weights = [1     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0    0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0];
%         end
%         spm_jobman('run',matlabbatch);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % VOLUMES OF INTEREST
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        clear matlabbatch
        % EXTRACTING TIME SERIES: M1
        %--------------------------------------------------------------------------
        matlabbatch{1}.spm.util.voi.spmmat = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
        matlabbatch{1}.spm.util.voi.adjust = 6;  % "effects of interest" F-contrast
        matlabbatch{1}.spm.util.voi.session = s; % session 1
        matlabbatch{1}.spm.util.voi.name = 'M1';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''}; % using SPM.mat above
        matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 1;  % "with" T-contrast
        matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = [-56 8 26];
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 8;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
        matlabbatch{1}.spm.util.voi.expression = 'i1 & i2';
        
        % EXTRACTING TIME SERIES: SMA
        %--------------------------------------------------------------------------
        matlabbatch{2}.spm.util.voi.spmmat = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
        matlabbatch{2}.spm.util.voi.adjust = 6;  % "effects of interest" F-contrast
        matlabbatch{2}.spm.util.voi.session = s; % session 1
        matlabbatch{2}.spm.util.voi.name = 'SMA';
        matlabbatch{2}.spm.util.voi.roi{1}.spm.spmmat = {''}; % using SPM.mat above
        matlabbatch{2}.spm.util.voi.roi{1}.spm.contrast = 1;  % "with" T-contrast
        matlabbatch{2}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{2}.spm.util.voi.roi{1}.spm.thresh = 1;
        matlabbatch{2}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{2}.spm.util.voi.roi{2}.sphere.centre = [-8 0 66];
        matlabbatch{2}.spm.util.voi.roi{2}.sphere.radius = 8;
        matlabbatch{2}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
        matlabbatch{2}.spm.util.voi.expression = 'i1 & i2';
        
        % EXTRACTING TIME SERIES: iLOG
        %--------------------------------------------------------------------------
        matlabbatch{3}.spm.util.voi.spmmat = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
        matlabbatch{3}.spm.util.voi.adjust = 6;  % "effects of interest" F-contrast
        matlabbatch{3}.spm.util.voi.session = s; % session 1
        matlabbatch{3}.spm.util.voi.name = 'iLOG';
        matlabbatch{3}.spm.util.voi.roi{1}.spm.spmmat = {''}; % using SPM.mat above
        matlabbatch{3}.spm.util.voi.roi{1}.spm.contrast = 1;  % "with" T-contrast
        matlabbatch{3}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{3}.spm.util.voi.roi{1}.spm.thresh = 1;
        matlabbatch{3}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{3}.spm.util.voi.roi{2}.sphere.centre = [-46 -76 12];
        matlabbatch{3}.spm.util.voi.roi{2}.sphere.radius = 8;
        matlabbatch{3}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
        matlabbatch{3}.spm.util.voi.expression = 'i1 & i2';
        
        % EXTRACTING TIME SERIES: Caudate
        %--------------------------------------------------------------------------
        matlabbatch{4}.spm.util.voi.spmmat = cellstr(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
        matlabbatch{4}.spm.util.voi.adjust = 6;  % "effects of interest" F-contrast
        matlabbatch{4}.spm.util.voi.session = s; % session 1
        matlabbatch{4}.spm.util.voi.name = 'Caudate';
        matlabbatch{4}.spm.util.voi.roi{1}.spm.spmmat = {''}; % using SPM.mat above
        matlabbatch{4}.spm.util.voi.roi{1}.spm.contrast = 1;  % "with" T-contrast
        matlabbatch{4}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{4}.spm.util.voi.roi{1}.spm.thresh = 1;
        matlabbatch{4}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{4}.spm.util.voi.roi{2}.sphere.centre = [-38 -32 2];
        matlabbatch{4}.spm.util.voi.roi{2}.sphere.radius = 8;
        matlabbatch{4}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
        matlabbatch{4}.spm.util.voi.expression = 'i1 & i2';
        
        
        spm_jobman('run',matlabbatch);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % DYNAMIC CAUSAL MODELLING
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        clear DCM
        
        % SPECIFICATION DCMs "attentional modulation of backward/forward connection"
        %--------------------------------------------------------------------------
        % To specify a DCM, you might want to create a template one using the GUI
        % then use spm_dcm_U.m and spm_dcm_voi.m to insert new inputs and new
        % regions. The following code creates a DCM file from scratch, which
        % involves some technical subtleties and a deeper knowledge of the DCM
        % structure.
        load(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],'SPM.mat'));
        
        % Load regions of interest
        %--------------------------------------------------------------------------
        load(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['VOI_M1_',num2str(s),'.mat']),'xY');
        DCM.xY(1) = xY;
        load(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['VOI_SMA_',num2str(s),'.mat']),'xY');
        DCM.xY(2) = xY;
        load(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['VOI_iLOG_',num2str(s),'.mat']),'xY');
        DCM.xY(3) = xY;
        load(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['VOI_Caudate_',num2str(s),'.mat']),'xY');
        DCM.xY(4) = xY;
        
        DCM.n = length(DCM.xY);      % number of regions
        DCM.v = length(DCM.xY(1).u); % number of time points
        
        % Time series
        %--------------------------------------------------------------------------
        DCM.Y.dt  = SPM.xY.RT;
        DCM.Y.X0  = DCM.xY(1).X0;
        for i = 1:DCM.n
            DCM.Y.y(:,i)  = DCM.xY(i).u;
            DCM.Y.name{i} = DCM.xY(i).name;
        end
        
        DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);
        
        % Experimental inputs
        %--------------------------------------------------------------------------
        DCM.U.dt   =  SPM.Sess(s).U.dt;
        DCM.U.name = [SPM.Sess(s).U.name];
        if size(SPM.Sess(s).U,2)==2
            DCM.U.u    = [SPM.Sess(s).U(1).u(33:end,1) ...
                SPM.Sess(s).U(2).u(33:end,1)];
        elseif size(SPM.Sess(s).U,2)==1
            DCM.U.u    = SPM.Sess(s).U(1).u(33:end,1);
        end

        % DCM parameters and options
        %--------------------------------------------------------------------------
        DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
        DCM.TE     = 0.03;
        
        DCM.options.nonlinear  = 0;
        DCM.options.two_state  = 0;
        DCM.options.stochastic = 0;
        DCM.options.nograph    = 1;
        
        % Connectivity matrices for model1 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;0 0 1 1;1 0 0 1]; %intrinsic connectivity
        if size(SPM.Sess(s).U,2)==2
            DCM.b = zeros(4,4,2);  DCM.b(1,2,1) = 1; %modulation of connectivity
            DCM.c = [0 0;1 0;0 0;0 0]; %direct inputs
            DCM.d = zeros(4,4,0); %•s–¾
        elseif size(SPM.Sess(s).U,2)==1
            DCM.b = zeros(4,4);  DCM.b(1,2) = 1; %modulation of connectivity
            DCM.c = [0;1;0;0]; %direct inputs
            DCM.d = zeros(4,4,0); %•s–¾
        end
        
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_1.mat'),'DCM');
        
        % Connectivity matrices for model2 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;1 0 1 1;1 0 0 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_2.mat'),'DCM');
        
        % Connectivity matrices for model3 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;0 1 1 1;1 0 0 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_3.mat'),'DCM');
        
        % Connectivity matrices for model4 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;0 0 1 1;1 0 1 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_4.mat'),'DCM');
        
        % Connectivity matrices for model5 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;1 1 1 1;1 0 0 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_5.mat'),'DCM');
        
        % Connectivity matrices for model6 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;0 1 1 1;1 0 1 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_6.mat'),'DCM');
        
        % Connectivity matrices for model7 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;1 0 1 1;1 0 1 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_7.mat'),'DCM');
        
        % Connectivity matrices for model8 modulation
        %--------------------------------------------------------------------------
        DCM.a = [1 1 1 0;1 1 1 0;1 1 1 1;1 0 1 1];
        save(fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_8.mat'),'DCM');
        
        % DCM Estimation
        %--------------------------------------------------------------------------
        clear matlabbatch
        
        matlabbatch{1}.spm.dcm.fmri.estimate.dcmmat = {...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_1.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_2.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_3.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_4.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_5.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_6.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_7.mat'); ...
            fullfile(data_path,members{t},['results_representation_',num2str(trial_num),'_DCM'],['sess',num2str(s)],'DCM_8.mat')
            };
        
        spm_jobman('run',matlabbatch);
        
        % Bayesian Model Comparison
        %--------------------------------------------------------------------------
%         DCM_1 = load('DCM_1.mat','F');
%         DCM_2 = load('DCM_2.mat','F');
%         DCM_3 = load('DCM_3.mat','F');
%         DCM_4 = load('DCM_4.mat','F');
%         DCM_5 = load('DCM_5.mat','F');
%         DCM_6 = load('DCM_6.mat','F');
%         DCM_7 = load('DCM_7.mat','F');
%         DCM_8 = load('DCM_8.mat','F');
%         fprintf('Model evidence: %f (1) vs %f (2) %f (3) vs %f (4) vs %f (5) vs %f (6) vs %f (7)\n',DCM_1.F,DCM_2.F,DCM_3.F,DCM_4.F,DCM_5.F,DCM_6.F,DCM_7.F);
    end
end
