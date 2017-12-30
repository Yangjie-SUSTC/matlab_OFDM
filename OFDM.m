function varargout = OFDM(varargin)

% OFDM MATLAB code for OFDM.fig
%      OFDM, by itself, creates a new OFDM or raises the existing
%      singleton*.
%
%      H = OFDM returns the handle to a new OFDM or the handle to
%      the existing singleton*.
%
%      OFDM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OFDM.M with the given input arguments.
%
%      OFDM('Property','Value',...) creates a new OFDM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OFDM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OFDM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OFDM

% Last Modified by GUIDE v2.5 30-Dec-2017 08:57:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OFDM_OpeningFcn, ...
                   'gui_OutputFcn',  @OFDM_OutputFcn, ...
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


% --- Executes just before OFDM is made visible.
function OFDM_OpeningFcn(hObject, eventdata, handles, varargin)
a=get(gcf,'position'); 
KD_Old=a(3);
GD_Old=a(4);
handles.KD_Old=KD_Old;
handles.GD_Old=GD_Old;

if ~exist('.\fig')
    mkdir('.\fig\block1');
    mkdir('.\fig\block2');
    mkdir('.\fig\block3');
    mkdir('.\fig\block4');
    mkdir('.\fig\channel');
    mkdir('.\fig\data');
end

pic=imread([pwd,'\','sustc_logo_fig.png']);
axes(handles.axes4);
imshow(pic);
old=findall(handles.uipanel2,'type','axes');
delete(old)
set(handles.uipanel2,'Title','')

old=findall(handles.uipanel6,'type','axes');
delete(old)
set(handles.uipanel6,'Title','')

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OFDM (see VARARGIN)

% Choose default command line output for OFDM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OFDM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OFDM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_plot_Callback(hObject, eventdata, handles)
% hObject    handle to save_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
order=get(handles.listbox3,'value'); 
block={'block1','block2','block3','block4','channel'};
tezhen1={
    1,'Pilot',1;
    1,'Signal',1;
    1,'Add pilot',1;
    1,'Serial to parallel convertor',1;
    0,'IFFT',1;
    0,'Parallel to serial to IFFT',1;
    0,'Add CP IFFT',1;
    };
tezhen2={
    0,'Serial to parallel',1;
    0,'Remove CP',1;
    0,'DFT',1;
    0,'Channel gain',1;
    0,'Gained',1;
    0,'Parallel to serial',1;
    0,'Final full pilot',1;
    0,'Final full signal',1;
    };
tezhen3={
    0,'DAC',1;
    1,'Real part carry wave',1;
    1,'Image part carry wave',1;
    1,'Modulated .* signal',1;
    1,'After DAC real',1;
    1,'Modulated real',1;
    1,'After DAC image',1;
    1,'Modulated image',1;
    1,'Transmitting',1;
    };
tezhen4={
   1,'Recieved',1;
    1,'Echo removed',1;
    1,'Demodulating real',1;
    1,'Demodulated real',1;
    1,'Demodulating image',1;
    1,'Demodulated image',1;
    0,'ADC demodulated',1;
    };
tezhen5={
    1,'Channel impulse response',1;
    1,[num2str(order),' order Bessel filter amplitude response'],1;
    1,[num2str(order),' order Bessel filter phase response'],1;
    };
tezhen={tezhen1,tezhen2,tezhen3,tezhen4,tezhen5};
opath=pwd;

for k=1:length(block)
    fsaveplot(block{k},tezhen{k},handles)
end
  
clc





% --------------------------------------------------------------------
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause()


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function load_signal_Callback(hObject, eventdata, handles)
% hObject    handle to load_signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pilot
global signal
clc
[filename,pathname]=uigetfile('*.mat','load file');%
pilotpath=fullfile(pathname,'pilot.mat');
pathfile=fullfile(pathname,filename);%
signals=load(pathfile);
pilots=load(pilotpath);
signal=signals.signal;
pilot=pilots.pilot;

T=str2double(get(handles.edit1,'String'));

x=0:length(pilot)-1;
y=pilot;
saveplot(x',y',1,[],'Pilot',T,T,handles,'linear','linear')
x=0:length(signal)-1;
y=signal;
saveplot(x',y',0,[],'Signal',T,T,handles,'linear','linear')






% --------------------------------------------------------------------
function Transmite_device_Callback(hObject, eventdata, handles)
% hObject    handle to Transmite_device (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function channel_Callback(hObject, eventdata, handles)
% hObject    handle to channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function R_process_Callback(hObject, eventdata, handles)
% hObject    handle to R_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function R_input_sig_Callback(hObject, eventdata, handles)
% hObject    handle to R_input_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'ADC demodulated',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)







% --------------------------------------------------------------------
function R_cp_removed_Callback(hObject, eventdata, handles)
% hObject    handle to R_cp_removed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'Remove CP',handles);





% --------------------------------------------------------------------
function R_s_p_con_Callback(hObject, eventdata, handles)
% hObject    handle to R_s_p_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 pplot(0,'Serial to parallel',handles);




% --------------------------------------------------------------------
function R_DFT_Callback(hObject, eventdata, handles)
% hObject    handle to R_DFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'DFT',handles);



% --------------------------------------------------------------------
function R_divIgain_Callback(hObject, eventdata, handles)
% hObject    handle to R_divIgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function R_p_s_conv_Callback(hObject, eventdata, handles)
% hObject    handle to R_p_s_conv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'Parallel to serial',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function R_fsig_Callback(hObject, eventdata, handles)
% hObject    handle to R_fsig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function R_recieve_sig_Callback(hObject, eventdata, handles)
% hObject    handle to R_recieve_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Recieved',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function R_echo_rm_Callback(hObject, eventdata, handles)
% hObject    handle to R_echo_rm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Echo removed',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function Untitled_40_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function T_real_t_Callback(hObject, eventdata, handles)
% hObject    handle to T_real_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function T_ima_t_Callback(hObject, eventdata, handles)
% hObject    handle to T_ima_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function trans_sig_Callback(hObject, eventdata, handles)
% hObject    handle to trans_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Transmitting',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function signal_sequence_Callback(hObject, eventdata6 , handles)
% hObject    handle to signal_sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Signal',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function T_add_pilot_Callback(hObject, eventdata, handles)
% hObject    handle to T_add_pilot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Add pilot signal',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --------------------------------------------------------------------
function s_p_converter_Callback(hObject, eventdata, handles)
% hObject    handle to s_p_converter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(1,'Serial to parallel convertor',handles);





% --------------------------------------------------------------------
function T_IDFT_Callback(hObject, eventdata, handles)
% hObject    handle to T_IDFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'IFFT',handles);



% --------------------------------------------------------------------
function p_s_converter_Callback(hObject, eventdata, handles)
% hObject    handle to p_s_converter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'Parallel to serial IFFT',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




% --------------------------------------------------------------------
function add_cp_Callback(hObject, eventdata, handles)
% hObject    handle to add_cp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'Add CP IFFT',handles);




% --------------------------------------------------------------------
function T_premodu_sig_Callback(hObject, eventdata, handles)
% hObject    handle to T_premodu_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'Parallel to serial IFFT',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --------------------------------------------------------------------
function T_ima_Callback(hObject, eventdata, handles)
% hObject    handle to T_ima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'After DAC image',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function T_ima_m_Callback(hObject, eventdata, handles)
% hObject    handle to T_ima_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Modulated image',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --------------------------------------------------------------------
function T_real_Callback(hObject, eventdata, handles)
% hObject    handle to T_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'After DAC real',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




% --------------------------------------------------------------------
function T_real_m_Callback(hObject, eventdata, handles)
% hObject    handle to T_real_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Modulated real',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function R_real_dem_Callback(hObject, eventdata, handles)
% hObject    handle to R_real_dem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function R_ima_dem_Callback(hObject, eventdata, handles)
% hObject    handle to R_ima_dem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function gain_Callback(hObject, eventdata, handles)
% hObject    handle to gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'Channel gain',handles);




% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('click')



% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uibuttongroup1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
packagenum=str2double(get(handles.edit24,'String'));
filename=strtrim([handles.axes1.Title.String,' ',num2str(packagenum)]);
datapath=[pwd,'\fig\',filename,'.mat'];
plotfig(datapath)







% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over togglebutton1.
function togglebutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on togglebutton1 and none of its controls.
function togglebutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
global pilot
global signal

%nc=str2double(get(handles.edit22,'String'));
nc=get(handles.listbox4,'value'); 
T=str2double(get(handles.edit1,'String'));%*10^(-6);
fc=str2double(get(handles.edit21,'String'));%*10^6;
alpha1=str2double(get(handles.edit12,'String'));
alpha2=str2double(get(handles.edit13,'String'));
alpha3=str2double(get(handles.edit15,'String'));
alpha4=str2double(get(handles.edit17,'String'));
delay2=str2double(get(handles.edit14,'String'));
delay3=str2double(get(handles.edit16,'String'));
delay4=str2double(get(handles.edit18,'String'));

[apsig,bnum]=setseq(pilot,signal,nc);
%{
parallsignal :   parallel signal with pilot,several column
packagenum   :   each colum number match its packagenumber
type         :   show this column whether pilot or signal,string
order_in_pack:   the order of signal in each package
apsig        :   serial signal with pilot, one row
bnum         :   last signal column length
zp           :   pilot column index
zs           :   signal column index
%}
alpha=[alpha1,alpha2,alpha3,alpha4];
delay=[0, delay2,delay3,delay4];
x=0:length(apsig)-1;
saveplot(x.',apsig.',0,[],'Add pilot signal',T,T,handles,'linear','linear')



calcu(apsig,T,fc,alpha,delay,length(pilot),nc,bnum,handles);



%{

for sigc=1:pc
    set(handles.edit24,'String',num2str(sigc))
    inputsig=sinput(:,(sigc-1)*(nc+1)+1);
    inputsig=inputsig.';
    biaozhu=['pilot_',num2str(sigc)];
  
output=calcu(inputsig,T,fc,alpha,delay,handles,biaozhu);
gain=output./inputsig.';
saveplot(0:length(gain)-1,gain,'stem','Channel gain',T,'block2',handles,biaozhu)
Rp=output./gain;
saveplot(0:length(Rp)-1,Rp,'stem','Gained',T,'block2',handles,biaozhu)
output=Rp.';
saveplot(0:length(output)-1,output,'stem','Parallel to serial',T,'block2',handles,biaozhu)
mrp=[mrp,output];

for k=(sigc-1)*(nc+1)+2:min(pc+cs,sigc*(nc+1))
inputsig=sinput(:,k);
inputsig=inputsig.';

    biaozhu=['signal_',num2str(k-sigc)];

output=calcu(inputsig,T,fc,alpha,delay,handles,biaozhu);
RS=output./gain;
saveplot(0:length(RS)-1,RS,'stem','Gained',T,'block2',handles,biaozhu)
output=RS.';
saveplot(0:length(output)-1,output,'stem','Parallel to serial',T,'block2',handles,biaozhu)


mrs=[mrs,output];
end
end
frp=mrp;
saveplot(0:length(frp)-1,frp,'stem','Final',T,'block2',handles,'full pilot')
frs=mrs(1:end-bnum);
saveplot(0:length(frs)-1,frs,'stem','Final',T,'block2',handles,'full signal')
%}








% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause()


% --- Executes on key press with focus on pushbutton3 and none of its controls.
function pushbutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
disp('click')


% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
for i=1:1
continue;
end


% --- Executes during object creation, after setting all properties.
function pushbutton3_CreateFcn(hObject, eventdata, handles)
disp('CreateFcn')
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)
disp('ButtonDownFcn')
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function pushbutton3_DeleteFcn(hObject, eventdata, handles)
disp('pushbutton3_DeleteFcn')
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


fpath1=[pwd,'\fig\data\','Signal waveform.mat'];
fpath2=[pwd,'\fig\data\','Final full signal waveform real part.mat'];
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)







%--------------------------------------------------------------------
%{
function fpath=plotfig(x,y,xlabels,ylabels,style,name,filepath)
%%
figpath=[pwd,'\fig\',filepath,'\'];
ffpath=[pwd,'\fig\'];
h=figure('name',name);
if strcmp(style,'stem')
    stem(x,y)
else
    plot(x,y)
end
title (name,'fontsize',15)
xlabel(xlabels,'fontsize',15)
ylabel(ylabels,'fontsize',15)
axis([min(x),max(x),min(y),max(y)]);
fpath=[figpath,name,'_',style,'.fig'];
saveas(h,fpath)
fpath=[ffpath,name,'_',style,'.fig'];
saveas(h,fpath)
close(h)
%}

% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uibuttongroup2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
packagenum=str2double(get(handles.edit24,'String'));
if isnan(packagenum)
    packagenum='';
end
filename=strtrim([handles.uipanel6.Title,' ',num2str(packagenum)]);
datapath=[pwd,'\fig\data\',filename,'.mat'];
plotfig(datapath,handles)


% --------------------------------------------------------------------
function dac_Callback(hObject, eventdata, handles)
% hObject    handle to dac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'DAC',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
order=get(handles.listbox3,'value'); 
fpath1=[pwd,'\fig\data\',num2str(order),' order Bessel filter amplitude response.mat'];
fpath2=[pwd,'\fig\data\',num2str(order),' order Bessel filter phase response.mat'];
axshow(fpath1,handles.uipanel2,handles);
set(gca,'Xgrid','on')
set(gca,'Ygrid','on')
axshow(fpath2,handles.uipanel6,handles);
set(gca,'Xgrid','on')
set(gca,'Ygrid','on')




% --------------------------------------------------------------------
function Untitled_43_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function realc_Callback(hObject, eventdata, handles)
% hObject    handle to realc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Real part carry wave',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




% --------------------------------------------------------------------
function imac_Callback(hObject, eventdata, handles)
% hObject    handle to imac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Image part carry wave',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function IP_Callback(hObject, eventdata, handles)
% hObject    handle to IP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Channel impulse response',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function TSS_Callback(hObject, eventdata, handles)
% hObject    handle to TSS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[fpath1,fpath2]=bxpathfinder('channel','Recieved');
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Recieved',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




% --------------------------------------------------------------------
function adc_Callback(hObject, eventdata, handles)
% hObject    handle to adc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'ADC demodulated',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
cutf=str2double(get(handles.edit23,'String'));%*10^6;
order=get(handles.listbox3,'value'); 
[bf,af] = besself(order,cutf*2*pi);

filfreqplot(bf,af, handles);
fpath1=[pwd,'\fig\data\',num2str(order),' order Bessel filter amplitude response.mat'];
fpath2=[pwd,'\fig\data\',num2str(order),' order Bessel filter phase response.mat'];
axshow(fpath1,handles.uipanel2,handles);
set(gca,'Xgrid','on')
set(gca,'Ygrid','on')
axshow(fpath2,handles.uipanel6,handles);
set(gca,'Xgrid','on')
set(gca,'Ygrid','on')



% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on listbox3 and none of its controls.
function listbox3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function dgsignal_Callback(hObject, eventdata, handles)
% hObject    handle to dgsignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pplot(0,'Gained',handles);




% --------------------------------------------------------------------
function fp_Callback(hObject, eventdata, handles)
% hObject    handle to fp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function fs_Callback(hObject, eventdata, handles)
% hObject    handle to fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'Final full signal',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)




% --------------------------------------------------------------------
function cleara_Callback(hObject, eventdata, handles)
% hObject    handle to cleara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
set(handles.listbox4,'Value',1)
set(handles.listbox3,'Value',5)
set(handles.edit1,'String',1)
set(handles.edit21,'String',100)
set(handles.edit23,'String',50)
set(handles.edit12,'String',0.5)
set(handles.edit13,'String',0.4)
set(handles.edit14,'String',1.5)
set(handles.edit15,'String',0.35)
set(handles.edit16,'String',2.5)
set(handles.edit17,'String',0.3)
set(handles.edit18,'String',3)
set(handles.edit24,'String',0)
old=findall(handles.uipanel2,'type','axes');
delete(old)
set(handles.uipanel2,'Title','')

old=findall(handles.uipanel6,'type','axes');
delete(old)
set(handles.uipanel6,'Title','')



% --------------------------------------------------------------------
function pl_Callback(hObject, eventdata, handles)
% hObject    handle to pl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(0,'Final full pilot',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --------------------------------------------------------------------
function Demodulatingi_Callback(hObject, eventdata, handles)
% hObject    handle to Demodulatingi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Demodulating image',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)



% --------------------------------------------------------------------
function Demodulatedi_Callback(hObject, eventdata, handles)
% hObject    handle to Demodulatedi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Demodulated image',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --------------------------------------------------------------------
function Demodulatingr_Callback(hObject, eventdata, handles)
% hObject    handle to Demodulatingr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Demodulating real',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)

% --------------------------------------------------------------------
function Demodulatedr_Callback(hObject, eventdata, handles)
% hObject    handle to Demodulatedr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','')
[fpath1,fpath2]=pathfinder(1,'Demodulated real',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double
packagenum=str2double(get(handles.edit24,'String'));
if isnan(packagenum)
    packagenum='';
end
filename=strtrim([handles.uipanel2.Title,' ',num2str(packagenum)]);
datapath=[pwd,'\fig\',filename,'.mat'];
axshow(datapath,handles.uipanel2,handles)
filename=strtrim([handles.uipanel6.Title,' ',num2str(packagenum)]);
datapath=[pwd,'\fig\',filename,'.mat'];
axshow(datapath,handles.uipanel6,handles)





% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uibuttongroup3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
packagenum=str2double(get(handles.edit24,'String'));
if isnan(packagenum)
    packagenum='';
end
filename=strtrim([handles.uipanel2.Title,' ',num2str(packagenum)]);
datapath=[pwd,'\fig\data\',filename,'.mat'];
plotfig(datapath,handles)


% --- Executes during object creation, after setting all properties.
function uibuttongroup3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Pilot_Callback(hObject, eventdata, handles)


% hObject    handle to Pilot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit24,'String','');
[fpath1,fpath2]=pathfinder(1,'Pilot',handles);
axshow(fpath1,handles.uipanel2,handles)
axshow(fpath2,handles.uipanel6,handles)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox3.
function listbox3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit24.
function edit24_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit24 and none of its controls.
function edit24_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
