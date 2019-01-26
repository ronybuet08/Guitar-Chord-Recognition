function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 26-Apr-2018 17:30:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%add trained neural network 
addpath('C:\Users\ronyn\Desktop\m files\');
%add net
load ('workspace','net');

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in recordpushbutton.
function recordpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to recordpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Define callbacks to show when
% recording starts and completes.
%Disable recordbutton
set(handles.recordpushbutton,'Enable','off') 
set(handles.result_text,'String','Recording...');
set(handles.percent_text,'String','...');
myVoice = audiorecorder(44100,16,2);
myVoice.StartFcn = 'disp(''Recording...'')';
%myVoice.StopFcn = 'disp(''End of recording.'')';

record(myVoice,3);
pause(3);
stop(myVoice);

%play(myVoice);

disp('Processing...'); 
set(handles.result_text,'String','Processing..')
pause(.05);

y2=getaudiodata(myVoice);
length(y2)
%y2=y2/norm(y2);
windowsize = 1000000;
y2_fft=abs(fft(y2,min(windowsize,length(y2))));

t2 = 0:11;
for i=0: 11
t2(i+1)=PCP(i,y2_fft);
end
t2'
%add trained neural network 
addpath('C:\Users\ronyn\Desktop\m files\');
%load trained net
load ('workspace','net');
result=net(t2')

%Define chords names:
chord_paths = {'a';'am'; 'bm'; 'c'; 'd'; 'dm'; 'e'; 'em'; 'f'; 'g' };

[M,I] = max(result);

M=sprintf('%.2f',M*100);

set(handles.result_text,'String',char(chord_paths(I)));
set(handles.percent_text,'String',strcat(M, ' %'));
%Enable recordbutton
set(handles.recordpushbutton,'Enable','on') 



%Functions to calculate PCP:
function pcp_star = PCP_star(p,X)
temp_pcp_star=0;    
for k=0:(length(X)/2)-1
    temp_pcp_star=temp_pcp_star + X(k+1).*conj(X(k+1))*kroneckerdelta(M(k, length(X),44100,16.351),p);
end
pcp_star=temp_pcp_star;    

function pcp = PCP(p,X)
temp_pcp = 0;    
    for j=0:11    
    temp_pcp = temp_pcp + PCP_star(j,X);        
    end
pcp = PCP_star(p,X)/temp_pcp;

function d = M(l,N,fs,fref)
    if l == 0
    d = -1;
    else
    d = mod(round(12*log2(fs*(l/N)/fref),0),12);
    end

function d = kroneckerdelta(m,n)
    if m == n
    d = 1;    
    else
    d = 0;    
    end
