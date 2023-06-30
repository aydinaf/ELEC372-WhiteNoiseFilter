%Aydin Azari Farhad - Summer 2023
%All rights reserved
%ELEC 372 - Concordia University
inputFile = 'G:\My Documents\MATLAB\sampleAudio.mp3';
[audio,fs] = audioread(inputFile);
targetFs = 8000;
audio = resample(audio, targetFs, fs);
duration = 60;
numSamples = duration * targetFs;
audio = audio(1:numSamples);
% sound(audio, targetFs);
snr = 10;
noisy = awgn(audio, snr, 'measured');
soundsc(noisy,targetFs);
figure;
subplot(2,1,1);
plot(linspace(0, length(audio)/targetFs, length(audio)),audio);
subplot(2,1,2);
plot(linspace(0, length(audio)/targetFs, length(audio)),noisy);


