clear all
close all
windowsize = 131072;
%add path of trained neural network
addpath('C:\Users\Usuario\Desktop\Guitar-Chord-Recognition-my tests\Trained_neural_networks\classifier\50_neurons\');
load ('workspace', 'net');
cd 'C:\Users\Usuario\Desktop\Guitar-Chord-Recognition-my tests\jim2012Chords\Guitar_Only\f';
path_a='C:\Users\Usuario\Desktop\Guitar-Chord-Recognition-my tests\jim2012Chords\Guitar_Only\f\';
waveFiles=dir([path_a '*.wav']);
waveFileName=sprintf('f1.wav',1);
y=audioread(waveFileName);
y=y/norm(y);
y_fft=abs(fft(y,min(windowsize,length(y))));
audiofilesize=length(y);
windowsize = 2048;
Pyy = power(y_fft,2)/windowsize;
f = 44100/(audiofilesize+1)*(0:(windowsize-1));
plot(f,Pyy(1:windowsize))
title('Power spectral density')
xlabel('Frequency (Hz)')
length(y_fft)
t = 0:11;
for i=0: 11
t(i+1)=PCP(i,y_fft);
%t(i+1)=PCP_star(i,y_fft);
end
%PCP_star(y_fft,6,2048);
%kroneckerdelta(M (2,audiofilesize,44100,16.3516),0)
%y_fft(1).*conj(y_fft(1))*kroneckerdelta(M(2,audiofilesize,44100,16.3516),0)
function pcp_star = PCP_star(p,X)
temp_pcp_star=0;    
for k=0:(length(X)/2)-1
    temp_pcp_star=temp_pcp_star + X(k+1).*conj(X(k+1))*kroneckerdelta(M(k, length(X),44100,16.3510),p);
end
pcp_star=temp_pcp_star;    
end
function pcp = PCP(p,X)
temp_pcp = 0;    
    for j=0:11    
    temp_pcp = temp_pcp + PCP_star(j,X);        
    end
pcp = PCP_star(p,X)/temp_pcp;
end
function d = M(l,N,fs,fref)
    if l == 0
    d = -1;
    else
    d = mod(round(12*log2(fs*(l/N)/fref),0),12);
    end
end
function d = kroneckerdelta(m,n)
    if m == n
    d = 1;    
    else
    d = 0;    
    end
end