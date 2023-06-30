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
% snrArray = [1,5,10,15];
% for i = 1:length(snrArray)
%     snr = snrArray(i);
snr = 15;
noisy = awgn(audio, snr, 'measured');
audio_fft = fft(audio);
noisy_fft = fft(noisy);
soundsc(noisy,targetFs);
figure;
subplot(4,1,1);
plot(linspace(0, length(audio)/targetFs, length(audio)),audio);
subplot(4,1,2);
plot(linspace(0, length(audio)/targetFs, length(audio)),noisy);
subplot(4,1,3);
plot(abs(audio_fft));
subplot(4,1,4);
plot(abs(noisy_fft));


