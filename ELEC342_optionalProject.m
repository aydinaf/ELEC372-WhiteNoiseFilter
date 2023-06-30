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
noise = rand(size(audio));
noise = highpass(noise, 400, targetFs);
noisePwr = 5.01;
noisy = audio + noise * noisePwr;
audio_fft = fft(audio);
noisy_fft = fft(noisy);
soundsc(noisy,targetFs);
figure;
subplot(5,1,1);
plot(linspace(0, length(audio)/targetFs, length(audio)),audio);
subplot(5,1,2);
plot(linspace(0, length(audio)/targetFs, length(audio)),noisy);
subplot(5,1,3);
plot(abs(audio_fft));
subplot(5,1,4);
plot(abs(noisy_fft));
subplot(5,1,5);
plot(abs(noisy_fft - audio_fft));



