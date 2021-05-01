function varargout = Layer_properties_gui(varargin)
% LAYER_PROPERTIES_GUI MATLAB code for Layer_properties_gui.fig
%      LAYER_PROPERTIES_GUI, by itself, creates a new LAYER_PROPERTIES_GUI or raises the existing
%      singleton*.
%
%      H = LAYER_PROPERTIES_GUI returns the handle to a new LAYER_PROPERTIES_GUI or the handle to
%      the existing singleton*.
%
%      LAYER_PROPERTIES_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYER_PROPERTIES_GUI.M with the given input arguments.
%
%      LAYER_PROPERTIES_GUI('Property','Value',...) creates a new LAYER_PROPERTIES_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Layer_properties_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Layer_properties_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Layer_properties_gui

% Last Modified by GUIDE v2.5 25-Jan-2016 10:29:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Layer_properties_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Layer_properties_gui_OutputFcn, ...
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

%%
% --- Executes just before Layer_properties_gui is made visible.
function Layer_properties_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Layer_properties_gui (see VARARGIN)

% Choose default command line output for Layer_properties_gui
handles.output = hObject;

set(handles.popup_soiltype,'visible','off');
set(handles.toggle_cohesionless,'Value',0)
set(handles.toggle_cohesive,'Value',0)
%%%defining handles%%%
handles.soiltype='initial';
handles.v='v';
handles.E='E';
handles.mv='mv';
handles.H='H';
handles.c='c';
handles.phi='phi';
handles.gama='gama';
handles.content=0;
handles.u='u';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Layer_properties_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%
% --- Outputs from this function are returned to the command line.
function varargout = Layer_properties_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%
% --- Executes on selection change in popup_soiltype.
function popup_soiltype_Callback(hObject, eventdata, handles)
% hObject    handle to popup_soiltype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_soiltype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_soiltype
if strcmp(handles.soiltype,'cohesive')
    switch get(hObject, 'Value');
        case 1
            handles.u=1.1;
        case 2
            handles.u=0.85;
        case 3
            handles.u=0.6;
        case 4
            handles.u=0.35;
    end
end
guidata(hObject, handles);
%%
% --- Executes during object creation, after setting all properties.
function popup_soiltype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_soiltype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%

function edt_v_Callback(hObject, eventdata, handles)
% hObject    handle to edt_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_v as text
%        str2double(get(hObject,'String')) returns contents of edt_v as a double
if str2double(get(hObject,'String'))>0.5
    errordlg('Poissons Ratio cannot be bigger than 0.5','File Error');
    set(handles.edt_v,'String','');
elseif str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_v,'String','');
else
handles.v=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%%
% --- Executes during object creation, after setting all properties.
function edt_v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edt_E_Callback(hObject, eventdata, handles)
% hObject    handle to edt_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_E as text
%        str2double(get(hObject,'String')) returns contents of edt_E as a double
if str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_E,'String','');
else
handles.E=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%%
% --- Executes during object creation, after setting all properties.
function edt_E_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edt_mv_Callback(hObject, eventdata, handles)
% hObject    handle to edt_mv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_mv as text
%        str2double(get(hObject,'String')) returns contents of edt_mv as a double
if str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_mv,'String','');
else
handles.mv=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%%
% --- Executes during object creation, after setting all properties.
function edt_mv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_mv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edt_H_Callback(hObject, eventdata, handles)
% hObject    handle to edt_H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_H as text
%        str2double(get(hObject,'String')) returns contents of edt_H as a double
if str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_H,'String','');
else
handles.H=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%% 
% --- Executes during object creation, after setting all properties.
function edt_H_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%% 


function edt_c_Callback(hObject, eventdata, handles)
% hObject    handle to edt_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_c as text
%        str2double(get(hObject,'String')) returns contents of edt_c as a double
if strcmp(handles.soiltype,'cohesionless') && str2double(get(hObject,'String'))~=0
    errordlg('This value is 0 for cohesionless soils','File Error');
    set(handles.edt_c,'String','0');
elseif str2double(get(hObject,'String'))>200
    errordlg('Undrained Shear Strength should be less than 200kPa','File Error');
    set(handles.edt_c,'String','');
elseif str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_c,'String','');
else
handles.c=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%% 
% --- Executes during object creation, after setting all properties.
function edt_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%% 


function edt_phi_Callback(hObject, eventdata, handles)
% hObject    handle to edt_phi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_phi as text
%        str2double(get(hObject,'String')) returns contents of edt_phi as a double
if strcmp(handles.soiltype,'cohesive') && str2double(get(hObject,'String'))~=0
    errordlg('Angle of friction is 0 for cohesive soils in undrained conditions','File Error');
    set(handles.edt_phi,'String','0');
elseif str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_phi,'String','');
elseif str2double(get(hObject,'String'))>45
    errordlg('This value should be less than 45','File Error');
    set(handles.edt_phi,'String','');
else
handles.phi=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%% 
% --- Executes during object creation, after setting all properties.
function edt_phi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_phi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%% 


function edt_gama_Callback(hObject, eventdata, handles)
% hObject    handle to edt_gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_gama as text
%        str2double(get(hObject,'String')) returns contents of edt_gama as a double
if str2double(get(hObject,'String'))<0
    errordlg('You can not enter negative value','File Error');
    set(handles.edt_gama,'String','');
else
handles.gama=str2double(get(hObject,'String'));
end
guidata(hObject, handles);
%% 
% --- Executes during object creation, after setting all properties.
function edt_gama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% 
% --- Executes on button press in push_save.
function push_save_Callback(hObject, eventdata, handles)
% hObject    handle to push_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%global variablelarý tanýmla ve variablelarýn geçerliliðini kontrol et

global v E mv H c phi gama u soiltype

if isnan(handles.v)
    errordlg('Enter Poissons Ratio value as a number please','File Error');
elseif isnumeric(handles.v)==0
    errordlg('Enter Poissons Ratio value as a number please','File Error');
elseif isnan(handles.E)
    errordlg('Enter Modulus of Elasticity value as a number please','File Error');
elseif isnumeric(handles.E)==0
    errordlg('Enter Modulus of Elasticity value as a number please','File Error');
elseif isnan(handles.mv)
    errordlg('Enter Coefficient of Volume Compressibility value as a number please','File Error');
elseif isnumeric(handles.mv)==0
    errordlg('Enter Coefficient of Volume Compressibility value as a number please','File Error');
elseif isnan(handles.H)
    errordlg('Enter Height value as a number please','File Error');
elseif isnumeric(handles.H)==0
    errordlg('Enter Height value as a number please','File Error');
elseif isnan(handles.c)
    errordlg('Enter Cohession or Undrained Shear Strength value as a number please','File Error');
elseif isnumeric(handles.c)==0
    errordlg('Enter Cohession or Undrained Shear Strength value as a number please','File Error');
elseif isnan(handles.phi)
    errordlg('Enter Angle of Friction value as a number please','File Error');
elseif isnumeric(handles.phi)==0
    errordlg('Enter Angle of Friction value as a number please','File Error');
elseif isnan(handles.gama)
    errordlg('Enter Unit Weight value as a number please','File Error');
elseif isnumeric(handles.gama)==0
    errordlg('Enter Unit Weight value as a number please','File Error');
elseif strcmp(handles.soiltype,'initial');
    errordlg('Choose Soil Type Please','File Error');
elseif isnan(handles.u)
    errordlg('Choose Clay Type','File Error');
elseif isnumeric(handles.u)==0
    errordlg('Choose Clay Type Please','File Error');
       
else
    u=handles.u;
    soiltype=handles.soiltype;
    v=handles.v;
    E=handles.E;
    mv=handles.mv;
    H=handles.H;
    c=handles.c;
    phi=handles.phi;
    gama=handles.gama;
    close
end
%% 
% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'toggle_cohesive'
        handles.soiltype='cohesive';
        set(handles.popup_soiltype,'visible','on');
        set(handles.edt_phi,'String','0');
        set(handles.txt_c,'String','Cu, Undrained Shear Strength (kPa)    ');
        set(handles.edt_c,'String','');
        handles.phi=0;
    case 'toggle_cohesionless'
        handles.soiltype='cohesionless';
        set(handles.popup_soiltype,'visible','off');
        set(handles.edt_c,'String','0');
        set(handles.edt_phi,'String','');
        set(handles.txt_c,'String','c, Cohesion (kPa)                            ');
        handles.c=0;
        handles.u=0;
end
guidata(hObject, handles);
%% 


% --- Executes on button press in push_typical.
function push_typical_Callback(hObject, eventdata, handles)
% hObject    handle to push_typical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(typical)
