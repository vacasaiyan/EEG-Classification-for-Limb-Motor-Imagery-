% Load EEGlab
eeglab;

%dataset
gdf_files = {'A01E.gdf', 'A01T.gdf', 'A02E.gdf', 'A02T.gdf', ...
             'A03E.gdf', 'A03T.gdf', 'A04E.gdf', 'A04T.gdf', ...
             'A05E.gdf', 'A05T.gdf', 'A06E.gdf', 'A06T.gdf', ...
             'A07E.gdf', 'A07T.gdf', 'A08E.gdf', 'A08T.gdf', ...
             'A09E.gdf', 'A09T.gdf'};

iclabel_results_raw = zeros(length(gdf_files), 7);        % 7 ICLabel categories for raw data
iclabel_results_filtered = zeros(length(gdf_files), 7);   % 7 ICLabel categories for filtered data
iclabel_results_asr = zeros(length(gdf_files), 7);        % 7 ICLabel categories for ASR corrected data


for i = 1:length(gdf_files)
    % Load EEG data
    EEG = pop_biosig(gdf_files{i});
    
    %  ICA
    EEG = pop_runica(EEG, 'icatype', 'runica');
    
    
    EEG_unprocessed = EEG;
    
    % Raw Data
    EEG_raw = EEG_unprocessed;
    
    % Filtered data
    EEG_filtered = pop_eegfiltnew(EEG_unprocessed, [], [1 40]);  
    
    % 3. ASR Corrected Data (
    EEG_asr = pop_clean_rawdata(EEG_unprocessed, 'FlatlineCriterion', 5, 'ChannelCriterion', 0.8, ...
        'LineNoiseCriterion', 4, 'Highpass', 'off', 'BurstCriterion', 20, ...
        'WindowCriterion', 'off', 'BurstRejection', 'off', 'ComputeICAACT', 'on', ...
        'WriteLog', 'off');
    EEG_asr = pop_eegfiltnew(EEG_asr, [], [1 40]);  % Apply bandpass filter after ASR
    
    % Calculate ICLabel for each dataset
    try
        EEG_raw = pop_iclabel(EEG_raw);
        iclabel_results_raw(i, :) = mean(EEG_raw.etc.ic_classification.ICLabel.classifications, 1);
    catch ME
        fprintf('Error processing file %s (Raw):\n%s\n', gdf_files{i}, ME.message);
    end
    
    try
        EEG_filtered = pop_iclabel(EEG_filtered);
        iclabel_results_filtered(i, :) = mean(EEG_filtered.etc.ic_classification.ICLabel.classifications, 1);
    catch ME
        fprintf('Error processing file %s (Filtered):\n%s\n', gdf_files{i}, ME.message);
    end
    
    try
        EEG_asr = pop_iclabel(EEG_asr);
        iclabel_results_asr(i, :) = mean(EEG_asr.etc.ic_classification.ICLabel.classifications, 1);
    catch ME
        fprintf('Error processing file %s (ASR):\n%s\n', gdf_files{i}, ME.message);
    end
end

% Display average IClabel
disp('Average Number of ICs Classified by ICLabel:');
disp('-------------------------------------------');
disp('[ BRAIN, MUSCLE, EYE, HEART, LINE, NOISE, CHANNEL NOISE, OTHER ]');
disp('Raw EEG Data:');
disp(mean(iclabel_results_raw, 1));
disp('Filtered EEG Data:');
disp(mean(iclabel_results_filtered, 1));
disp('ASR Corrected EEG Data:');
disp(mean(iclabel_results_asr, 1));

close;

