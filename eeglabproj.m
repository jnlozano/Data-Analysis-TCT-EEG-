%% Part 1
eeglab
EEG = pop_loadset('SampleEEG.set');
eeglab redraw

%% Part 2

EEG = pop_resample( EEG, 256);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');

% Bonus: Reducing sampling rate in this dataset is helpful to create a better signal-to-noise
% ratio. Having a high sampling rate would make it
% difficult to compute all of the values associated with those points and it won't give
% much more information than ~twice the highest frequency. 
% A lower sampling rate reduces analysis time and disk space so long as we know 
% we aren't in too low of a sampling rate where we miss important information. Sampling rate is always
% dependent on what we are trying to analyze from our dataset. Generally, it's
% always a good idea to have a sampling rate that is twice the highest frequency of interest.


%% Part 3

% 73 channels, Electrodes are all around the scalp from F,P,O,C,T. 
% Edit > Channel locations > plot 3-D(xyz)
 EEG = pop_chanedit(EEG);
 [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
 EEG = pop_chanedit(EEG,'save','mychans.elp');
 eloc = EEG.chanlocs;
 %plotchans3d('mychans.elp');
 topoplot([],EEG.chanlocs, 'style', 'blank',  'electrodes', 'labelpoint', 'chaninfo', EEG.chaninfo);
 
 % Press plot 3D(xyz);
 
% I don't know how to get an elp file and read it correctly for
% plotchans3d() to work. 
 %% Part 4
 
 % Tools > Filter the data > Basic FIR filter
 
 EEG = pop_eegfiltnew(EEG,0.5,0);
 eeglab redraw
 
 % Bonus: The high-pass filter will help remove some of the artifacts that we
 % know are probably muscle movements such as eye/eyebrow movements during the recordings. This will benefit the processing of the data since we
 % wont have to put these artifacts in the analysis. Also, a highpass of
 % 0.5 Hz helps minimize slow drifts. This is done before epochs since
 % artifacts may last up to 6s, which can be longer than the epoched data. 
 
 %% Part 5
 
 %Plot > channel data(scroll)
 pop_eegplot(EEG,1,1,1);
 
 EEG = pop_interp(EEG, [57], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off');
 


 %% Part 6
 EEG = pop_epoch( EEG, {  'S  1'  }, [-0.1         0.5], 'newname', 'sampleEEG epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-100    0]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'setname','sampleEEG epochs1','gui','off');
 
 %% Part 7
EEG = pop_eegthresh(EEG,1,[1:73] ,-10,10,0.2,0.207,0,1);
EEG = pop_rejepoch( EEG, [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1] ,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 5,'gui','off'); 
 
 %% Part 8
 
%  data = EEG.data;
%  data(:,2:2:length(data)) =0; 
%  %EEG.data = data;
%  Fz = data(38,:,:);
%  
%  [x y z] = size(Fz);
%  new = zeros(1,y);
%  sum = 0;
%  for c = 1:y
%        for c2 = 1:z
%            sum = Fz(1,c,c2);
%            sum + sum; 
%        end
%        new(1,c) = sum/z;
%  end
%  plot(new,1:y);
%  
%  
%  