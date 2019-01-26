clear all
close all

cd 'C:\Users\Usuario\Desktop\Guitar-Chord-Recognition-my tests\jim2012Chords\Guitar_Only\g';
path_a='C:\Users\Usuario\Desktop\Guitar-Chord-Recognition-my tests\jim2012Chords\Guitar_Only\g\';
waveFiles=dir([path_a '*.wav']);
for k=1:length(waveFiles)
waveFileName=sprintf('g%d.wav',1);
y=audioread(waveFileName);
y=y/norm(y);
y_fft=abs(fft(y));
audiofilesize=length(y);
windowsize = 2048;
Pyy = power(y_fft,2)/windowsize;
f = 44100/(audiofilesize+1)*(0:(windowsize-1));
plot(f,Pyy(1:windowsize))
title('Power spectral density')
xlabel('Frequency (Hz)')
t = 0:11;
for i=0: 11
t(i+1)=PCP(i,y_fft,4096);
end

csv_filen=sprintf('g%d.csv',k);
csvwrite(csv_filen,t',0,0);
end

%PCP_star(y_fft,6,2048);
%kroneckerdelta(M (2,audiofilesize,44100,16.3516),0)
%y_fft(1).*conj(y_fft(1))*kroneckerdelta(M(2,audiofilesize,44100,16.3516),0)
function pcp_star = PCP_star(p,X,lmax)
temp_pcp_star=0;    
for k=0:lmax-1
    temp_pcp_star=temp_pcp_star + X(k+1).*conj(X(k+1))*kroneckerdelta(M(k,79837,44100,16.3516),p);
end
pcp_star=temp_pcp_star;    
end
function pcp = PCP(p,X,lmax)
temp_pcp = 0;    
    for j=0:11    
    temp_pcp = temp_pcp + PCP_star(j,X,lmax);        
    end
pcp = PCP_star(p,X,lmax)/temp_pcp;
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