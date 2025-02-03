clear; clc;

% Define the root folder containing weight class directories
rootFolder = 'data'; % Change this if necessary

% Get all weight class folders (e.g., '40g', '110g', '120g')
weightFolders = dir(rootFolder);
weightFolders = weightFolders([weightFolders.isdir]); % Keep only directories
weightFolders = weightFolders(~ismember({weightFolders.name}, {'.', '..'})); % Remove system folders

% Loop through each weight class folder
for wIdx = 1:length(weightFolders)
    dataFolder = fullfile(rootFolder, weightFolders(wIdx).name);
    fprintf('\nProcessing weight class: %s\n', weightFolders(wIdx).name);

    % Get list of all .txt data files in the folder
    filePattern = fullfile(dataFolder, 'Data_*.txt');
    dataFiles = dir(filePattern);

    % Initialize an empty cell array to store .mat filenames
    matFileNames = {};

    % Process each data file
    for k = 1:length(dataFiles)
        fileName = fullfile(dataFiles(k).folder, dataFiles(k).name);
        fprintf('Processing file: %s\n', fileName);

        % Read all lines of the file
        rawLines = readlines(fileName);

        % Initialize empty array for numeric data
        data = [];

        % Process each line
        for i = 1:length(rawLines)
            line = rawLines(i);

            % Remove unwanted text markers
            if contains(line, {'[inf]', '[dbg]', 'connected'})
                line = erase(line, {'[inf]', '[dbg]', 'connected'});
            end

            % Remove leading commas and extra spaces
            line = strtrim(line);
            line = regexprep(line, '^,+', '');  % Remove leading commas
            line = strrep(line, ',', ' ');      % Convert commas to spaces

            % Convert to numeric array
            numericValues = sscanf(line, '%f');

            % Store only valid rows with at least 4 numbers
            if length(numericValues) >= 4
                data = [data; numericValues(1:4)']; %#ok<AGROW>
            end
        end

        % If no valid data was found, skip saving
        if isempty(data)
            warning('Skipping %s: No valid numeric data found', fileName);
            continue;
        end

        % Convert to a MATLAB table
        D = array2table(data, 'VariableNames', {'t', 'u', 'q', 'dq'});

        % Convert the filename from .txt to .mat
        [~, baseFileName, ~] = fileparts(fileName); % Extract base name without extension
        matFileName = fullfile(dataFolder, [baseFileName, '.mat']); % Create .mat file path

        % Save as .mat file with the table
        save(matFileName, 'D');

        % Store the .mat filename for writing later
        matFileNames{end+1} = [baseFileName, '.mat']; 

        fprintf('Converted and saved: %s\n', matFileName);
    end

    % If we have valid .mat filenames, save them to 'files_names.txt'
    if ~isempty(matFileNames)
        fileListPath = fullfile(dataFolder, 'files_names.txt');
        fid = fopen(fileListPath, 'w');
        fprintf(fid, '%s\n', matFileNames{:});
        fclose(fid);
        fprintf('Saved file list: %s\n', fileListPath);
    end
end

disp('All files converted successfully.');
