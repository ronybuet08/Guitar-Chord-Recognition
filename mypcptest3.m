clear all
close all
windowsize = 131072;
folder_path = 'C:\Users\alex.davilafrias\Desktop\Guitar-Chord-Recognition-master-my tests ndsu\jim2012Chords\Other_Instruments\Piano\';
chord_paths = {'a';'am'; 'bm'; 'c'; 'd'; 'dm'; 'e'; 'em'; 'f'; 'g' };
chord_matrix = [];


for ith_chord = 1: 10
total_path = char(strcat(folder_path,chord_paths(ith_chord)));
cd(total_path);
%cd 'C:\Users\alex.davilafrias\Desktop\Guitar-Chord-Recognition-master-my tests ndsu\jim2012Chords\Guitar_Only\f';
%path_a='C:\Users\alex.davilafrias\Desktop\Guitar-Chord-Recognition-master-my tests ndsu\jim2012Chords\Guitar_Only\f\';
path_a= char(strcat(total_path,'\'));
waveFiles=dir([path_a '*.wav']);
%waveFileName=sprintf('f1.wav',1);
for jth_chord = 1:length(waveFiles)
waveFileName=sprintf(char(strcat(chord_paths(ith_chord),int2str(jth_chord),'.wav')),jth_chord);
y=audioread(waveFileName);
y=y/norm(y);
y_fft=abs(fft(y,windowsize));

%Calculate PCP vector:
%t = 0:11;
for i=0: 11
t(i+1,jth_chord)=PCP(i,y_fft);
end

strcat(waveFileName, ' processed')

end
% Write a csv file per chord (12 * 200):
csv_filen=sprintf(char(strcat(chord_paths(ith_chord),'.csv')));
csvwrite(csv_filen,t,0,0);
chord_matrix = [chord_matrix, t];


end


cd(folder_path);
path_a= char(strcat(folder_path,'\'));
%a = (ith_chord-1)*length(waveFiles)
%t2=t

csv_filen=sprintf('all_my_chords.csv');
csvwrite(csv_filen,chord_matrix,0,0);
%dlmwrite(csv_filen,t,'delimiter',',','-append','roffset',-12*(ith_chord-1), 'coffset',a);

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