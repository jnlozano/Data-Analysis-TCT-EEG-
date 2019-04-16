# Data-collection-analysis-TCT-
Targeted Cognitive Training data. EEG data analysis done using eeglab in matlab. Done for UCSD Schizophrenia Research Program.

Relevant information for EEG:
[background information: this is an EEG recording of a patient with schizophrenia using a
classical ‘oddball’ paradigm. The patient was presented with a series of standard ‘beep’ tones
(‘S 1’ in the data) interrupted by ‘odd’ or deviate tones (S 3, S 11-14). We want to examine
how well one’s brain can distinguish deviate tones from standard ones.]
1. Load the sample EEG data to EEGLab.
2. Change the sampling rate to 256 Hz (points/second). [Bonus question: what’s the
benefit of reducing sampling rate? Is sampling rating the lower the better?]
3. How many channels/electrodes are there in the EEG data? Where are the located on the
scalp? Plot a 3-D scalp map showing the location of the electrodes.
4. Apply a 0.5 Hz high-pass filter to the data. [Bonus question: why do we apply filters to
our data? What does a high-pass filter do to our data in terms of signal to noise ratio?]
5. Plot the EEG data. The signal on one channel is obviously abnormal and full of noise.
Interpolate that bad channel.
6. Segment the continuous EEG data into 600 msec epochs (-100 msec to 500 msec)
surrounding event markers ‘S 1’. Perform baseline correction using the -100 msec to 0
msec window.
7. The data get very noisy towards the end of the recording. Delete epochs 200 ~ 207.
8. Average across odd epochs (epochs 1, 3, 5, etc.). Plot the average (evented-related
potential, or ERP) waveform at electrode Fz. Try doing it without any built-in EEGLab
functions.
