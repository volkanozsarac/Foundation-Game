function varargout = Main_gui(varargin)
% MAIN_GUI MATLAB code for Main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_gui

% Last Modified by GUIDE v2.5 23-Jan-2016 20:47:03
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_gui_OutputFcn, ...
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


% --- Executes just before Main_gui is made visible.
function Main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_gui (see VARARGIN)

% Choose default command line output for Main_gui
choice = questdlg('Welcome to Foundation Design Simulation! You are a geotechnical engineer and structural requirements are given to you. First, do some lab tests and learn about your site. Then, design your foundation. Finally, let us check your design. Are you ready to start?', ...
	'Welcome', ...
	'Yes, continue','No, I want to read instructions first','Yes, continue');
% Handle response
switch choice
    case 'Yes, continue'
         
    case 'No, I want to read instructions first'
        uiwait(instructions)  %%make this instrcutions
end
handles.output = hObject;

        global v;   
        v='start';  %to control whether layers are updated or not
        handles.v1=0;
        handles.v2=0;
        handles.v3=0;
        handles.v4=0;
        
        handles.GW='GW';    %to control is GW entered first or not
        handles.layer_number=0; %layer control for calculations
        handles.foundationtype=0; %foundation type control
        
        
        %foundation data handles%
        set(handles.uipanel7,'visible','off');
        set(handles.txt_B,'visible','off');
        set(handles.edt_width,'visible','off');
        set(handles.txt_L,'visible','off');
        set(handles.edt_length,'visible','off');
        set(handles.txt_Dpile,'visible','off');
        set(handles.edt_Dpile,'visible','off');
        set(handles.txt_npile,'visible','off');
        set(handles.edt_npile,'visible','off');
        set(handles.txt_mpile,'visible','off');
        set(handles.edt_mpile,'visible','off');
        set(handles.txt_Lpile,'visible','off');
        set(handles.edt_Lpile,'visible','off');
        set(handles.txt_piletype,'visible','off');
        
        
        set(handles.push_layer1,'visible','off');
        set(handles.push_layer2,'visible','off');
        set(handles.push_layer3,'visible','off');
        set(handles.push_layer4,'visible','off');
        set(handles.radio_layer_1,'Value',0);
        set(handles.radio_layer_2,'Value',0);
        set(handles.radio_layer_3,'Value',0);
        set(handles.radio_layer_4,'Value',0);
        set(handles.radio_GW_verydeep,'Value',0);     
        set(handles.radio_GW_shallow,'Value',0);
        set(handles.radio_footing,'Value',0);
        set(handles.radio_pile,'Value',0);
        set(handles.edt_GW,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function push_generate_Callback(hObject, eventdata, handles)
% hObject    handle to push_generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
storey_numbers=[10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26];
column_numbers=[8 9 10 12 14 15 16 18 20];
floor_weight=[1500 1750 2000 2250 2500 2750 3000 3250 3500 3750 4000];
t=[1 1.25 1.5 2 2.25 2.5];
M=[0 50 100 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950 1000];

storey=storey_numbers(randi(17));
floor=floor_weight(randi(11));
column=column_numbers(randi(9));

%for single footing design
total_weight=storey*floor;
column_loading=total_weight./column;
handles.M1=M(randi(21));
handles.M2=M(randi(21));
handles.single_loading=column_loading;

handles.t=t(randi(6));
handles.Df=2*handles.t;
%for pile raft foundation
handles.total_loading=total_weight;

set(handles.txt_stories,'String',num2str(storey));
set(handles.txt_columns,'String',num2str(column));
set(handles.txt_weight,'String',num2str(floor));
set(handles.txt_t,'String',num2str(handles.t));
set(handles.txt_Df,'String',num2str(handles.Df));
set(handles.txt_M1,'String',num2str(handles.M1));
set(handles.txt_M2,'String',num2str(handles.M2));

guidata(hObject, handles);

% --- Executes on button press in push_layer1.
function push_layer1_Callback(hObject, eventdata, handles)
% hObject    handle to push_layer1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radio_GW_verydeep,'Value'))==1 || isnumeric(handles.GW)==1
uiwait(Layer_properties_gui)   
%open layer properties gui and then save data with following commands
global v E mv H c phi gama u soiltype
if strcmp(v,'start')
    warndlg('Layer 1 properties are not updated','Warning');
else
handles.v1=v;
handles.E1=E;
handles.mv1=mv;
handles.H1=H;
handles.z1=0;
handles.c1=c;
handles.phi1=phi;
handles.gama1=gama;
handles.u1=u;
handles.soiltype1=soiltype;
v='start';

end
elseif (get(handles.radio_GW_verydeep,'Value'))==0 && (get(handles.radio_GW_shallow,'Value'))==1
    warndlg('Do not forget to enter ground water level value please','Warning');
else
    warndlg('Enter ground water level please','Warning');
end

guidata(hObject, handles);

% --- Executes on button press in push_layer2.
function push_layer2_Callback(hObject, eventdata, handles)
% hObject    handle to push_layer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radio_GW_verydeep,'Value'))==1 || isnumeric(handles.GW)==1
uiwait(Layer_properties_gui)   
%open layer properties gui and then save data with following commands
global v E mv H c phi gama u soiltype
if strcmp(v,'start')
    warndlg('Layer 2 properties are not updated','Warning');
else
handles.v2=v;
handles.E2=E;
handles.mv2=mv;
handles.H2=H;
handles.z2=handles.z1+handles.H1;
handles.c2=c;
handles.phi2=phi;
handles.gama2=gama;
handles.u2=u;
handles.soiltype2=soiltype;
v='start';


end

elseif (get(handles.radio_GW_verydeep,'Value'))==0 && (get(handles.radio_GW_shallow,'Value'))==1
    warndlg('Do not forget to enter ground water level value please','Warning');
else
    warndlg('Enter ground water level please','Warning');
end

guidata(hObject, handles);


% --- Executes on button press in push_layer3.
function push_layer3_Callback(hObject, eventdata, handles)
% hObject    handle to push_layer3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radio_GW_verydeep,'Value'))==1 || isnumeric(handles.GW)==1
uiwait(Layer_properties_gui)   
%open layer properties gui and then save data with following commands
global v E mv H c phi gama u soiltype
if strcmp(v,'start')
    warndlg('Layer 3 properties are not updated','Warning');
else
handles.v3=v;
handles.E3=E;
handles.mv3=mv;
handles.H3=H;
handles.z3=handles.z2+handles.H2;
handles.c3=c;
handles.phi3=phi;
handles.gama3=gama;
handles.u3=u;
handles.soiltype3=soiltype;
v='start';

end

elseif (get(handles.radio_GW_verydeep,'Value'))==0 && (get(handles.radio_GW_shallow,'Value'))==1
    warndlg('Do not forget to enter ground water level value please','Warning');
else
    warndlg('Enter ground water level please','Warning');
end

guidata(hObject, handles);


% --- Executes on button press in push_layer4.
function push_layer4_Callback(hObject, eventdata, handles)
% hObject    handle to push_layer4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radio_GW_verydeep,'Value'))==1 || isnumeric(handles.GW)==1
    uiwait(Layer_properties_gui)   
%open layer properties gui and then save data with following commands
global v E mv H c phi gama u soiltype
if strcmp(v,'start')
    warndlg('Layer 4 properties are not updated','Warning');
else
handles.v4=v;
handles.E4=E;
handles.mv4=mv;
handles.H4=H;
handles.z4=handles.z3+handles.H3;
handles.c4=c;
handles.phi4=phi;
handles.gama4=gama;
handles.u4=u;
handles.soiltype4=soiltype;
v='start';

end

elseif (get(handles.radio_GW_verydeep,'Value'))==0 && (get(handles.radio_GW_shallow,'Value'))==1
    warndlg('Do not forget to enter ground water level value please','Warning');
else
    warndlg('Enter ground water level please','Warning');
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uipanel_layer_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel_layer_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uipanel_layer_number.
function uipanel_layer_number_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel_layer_number 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radio_layer_1'
        set(handles.push_layer1,'visible','on');
        set(handles.push_layer2,'visible','off');
        set(handles.push_layer3,'visible','off');
        set(handles.push_layer4,'visible','off');
        handles.layer_number=1;
    case 'radio_layer_2'
        set(handles.push_layer1,'visible','on');
        set(handles.push_layer2,'visible','on');
        set(handles.push_layer3,'visible','off');
        set(handles.push_layer4,'visible','off');
        handles.layer_number=2;
    case 'radio_layer_3'
        set(handles.push_layer1,'visible','on');
        set(handles.push_layer2,'visible','on');
        set(handles.push_layer3,'visible','on');
        set(handles.push_layer4,'visible','off');
        handles.layer_number=3;
    case 'radio_layer_4'
        set(handles.push_layer1,'visible','on');
        set(handles.push_layer2,'visible','on');
        set(handles.push_layer3,'visible','on');
        set(handles.push_layer4,'visible','on');
        handles.layer_number=4;
end
guidata(hObject, handles);

% --- Executes when selected object is changed in uipanel_foundation_type.
function uipanel_foundation_type_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel_foundation_type 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag')
    case 'radio_footing'
        set(handles.uipanel7,'visible','on');
        set(handles.txt_B,'visible','on');
        set(handles.edt_width,'visible','on');
        set(handles.txt_L,'visible','on');
        set(handles.edt_length,'visible','on');
        
        set(handles.txt_Dpile,'visible','off');
        set(handles.edt_Dpile,'visible','off');
        set(handles.txt_npile,'visible','off');
        set(handles.edt_npile,'visible','off');
        set(handles.txt_mpile,'visible','off');
        set(handles.edt_mpile,'visible','off');
        set(handles.txt_Lpile,'visible','off');
        set(handles.edt_Lpile,'visible','off');
        set(handles.txt_piletype,'visible','off');
        
        handles.foundationtype=1;
    case 'radio_pile'
        set(handles.uipanel7,'visible','on');
        set(handles.txt_B,'visible','off');
        set(handles.edt_width,'visible','off');
        set(handles.txt_L,'visible','off');
        set(handles.edt_length,'visible','off');
        
        set(handles.txt_Dpile,'visible','on');
        set(handles.edt_Dpile,'visible','on');
        set(handles.txt_npile,'visible','on');
        set(handles.edt_npile,'visible','on');
        set(handles.txt_mpile,'visible','on');
        set(handles.edt_mpile,'visible','on');
        set(handles.txt_Lpile,'visible','on');
        set(handles.edt_Lpile,'visible','on');
        set(handles.txt_piletype,'visible','on');
        
        handles.foundationtype=2;
end
guidata(hObject, handles);
      
                
function edt_GW_Callback(hObject, eventdata, handles)
% hObject    handle to edt_GW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.GW=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edt_GW as text
%        str2double(get(hObject,'String')) returns contents of edt_GW as a double
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_GW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_GW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel_GW.
function uipanel_GW_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel_GW 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radio_GW_verydeep'
        set(handles.edt_GW,'visible','off');
        handles.GW=5000;
    case 'radio_GW_shallow'
        set(handles.edt_GW,'visible','on');
end
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);


% --- Executes on button press in push_help.
function push_help_Callback(hObject, eventdata, handles)
% hObject    handle to push_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(Help);
% --- Executes on button press in push_instructions.
function push_instructions_Callback(hObject, eventdata, handles)
% hObject    handle to push_instructions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(instructions);

% --- Executes during object creation, after setting all properties.
function Footing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Footing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('Foundation.png');
% Hint: place code in OpeningFcn to populate Footing
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Pile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('pile.jpg');
% Hint: place code in OpeningFcn to populate Pile
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Logo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('Metud.png');
% Hint: place code in OpeningFcn to populate Logo
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uipanel_foundation_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel_foundation_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function edt_width_Callback(hObject, eventdata, handles)
% hObject    handle to edt_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_width as text
%        str2double(get(hObject,'String')) returns contents of edt_width as a double
handles.B_footing=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_length_Callback(hObject, eventdata, handles)
% hObject    handle to edt_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_length as text
%        str2double(get(hObject,'String')) returns contents of edt_length as a double
handles.L_footing=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_Check.
function push_Check_Callback(hObject, eventdata, handles)
% hObject    handle to push_Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch handles.foundationtype
case 0
warndlg('You have forgotten to choose foundation type','Warning');
case 1
%%%%%%%%%%%%%%%%%%%%%%%% SINGLE FOOTING CASE %%%%%%%%%%%%%%%%%%%%
if handles.L_footing<handles.B_footing
    warndlg('Remember, B is the least dimension','Warning');
elseif handles.L_footing/handles.B_footing>5
    warndlg('The difference between L and B is very big, dont you think so?','Warning');
else
    switch handles.layer_number
    case 0
    warndlg('You have forgotten to enter any of layer properties','Warning');

    %%%%%%case 1 START%%%%%    
    case 1      %%%number of layers =1%%


        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        else
            %%%%Soil pressure distribution%%%%
            [qnet_max,qnet_min,qnet_ave]=soilpressures(handles.single_loading,handles.M1,handles.M2,handles.L_footing,handles.B_footing,handles.Df,handles.t,handles.gama1);
            if qnet_min<0
                errordlg('You have tension zone change dimensions','Error')
                return
            end

            %%%%%%%Settlement of first layer%%%%%%
            Si_1=immediate_settlement(qnet_ave,handles.v1,handles.E1,handles.B_footing,handles.L_footing);
            
            if strcmp(handles.soiltype1,'cohesive')    %%%check cohesiveness & consolidation%%%
                qnf=Bearing_Capacity_cohesive(handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=consolidation_settlement(qnet_ave,handles.mv1,handles.H1,handles.u1,handles.z1,handles.B_footing,handles.L_footing);
            else
                            %%%%Bearing Capacity %%%%
            qnf=Bearing_Capacity(handles.phi1,handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=0;
            end
            FS=factor_of_safety(qnf,qnet_max);
            Stotal=Si_1+Sc_1;
            set(handles.txt_FS,'String',num2str(FS));
            set(handles.txt_settlement,'String',num2str(Stotal));
            %%%%%Check Design Limits%%%%%
            if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
            elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
            else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
            end
        end
%%%%%%FINISH%%%%%
%%%%%%case 2 START%%%%%
    case 2          %%%number of layers = 2%%
        
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');    
        else
          
                        %%%%Soil pressure distribution%%%%
            [qnet_max,qnet_min,qnet_ave]=soilpressures(handles.single_loading,handles.M1,handles.M2,handles.L_footing,handles.B_footing,handles.Df,handles.t,handles.gama1);
            if qnet_min<0
                errordlg('You have tension zone change dimensions','Error')
                return
            end
            %%%%%%%Settlement of first layer%%%%%%
            Si_1=immediate_settlement(qnet_ave,handles.v1,handles.E1,handles.B_footing,handles.L_footing);
            
            if strcmp(handles.soiltype1,'cohesive')    %%%check cohesiveness & consolidation%%%
                qnf=Bearing_Capacity_cohesive(handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=consolidation_settlement(qnet_ave,handles.mv1,handles.H1,handles.u1,handles.z1,handles.B_footing,handles.L_footing);
            else
                            %%%%Bearing Capacity %%%%
            qnf=Bearing_Capacity(handles.phi1,handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=0;
            end
            FS=factor_of_safety(qnf,qnet_max);

            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_2=consolidation_settlement(qnet_ave,handles.mv2,handles.H2,handles.u2,handles.z2,handles.B_footing,handles.L_footing);
            else 
                Sc_2=0;
            end
            
            Stotal=Si_1+Sc_1+Sc_2;
            set(handles.txt_FS,'String',num2str(FS));
            set(handles.txt_settlement,'String',num2str(Stotal));
            %%%%%Check Design Limits%%%%%
            if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
            elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
            else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
            end
        end            
%%%%%FINISH%%%%%
%%%%%%case 3 START%%%%%
    case 3      %%%number of layers = 3%%
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');    
        elseif handles.v3==0;
        warndlg('You have forgotten to enter layer 3 properties','Warning');
        else
          
        %%%%Soil pressure distribution%%%%
            [qnet_max,qnet_min,qnet_ave]=soilpressures(handles.single_loading,handles.M1,handles.M2,handles.L_footing,handles.B_footing,handles.Df,handles.t,handles.gama1);
            if qnet_min<0
                errordlg('You have tension zone change dimensions','Error')
                return
            end
            %%%%%%%Settlement of first layer%%%%%%
            Si_1=immediate_settlement(qnet_ave,handles.v1,handles.E1,handles.B_footing,handles.L_footing);
            
            if strcmp(handles.soiltype1,'cohesive')    %%%check cohesiveness & consolidation%%%
                qnf=Bearing_Capacity_cohesive(handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=consolidation_settlement(qnet_ave,handles.mv1,handles.H1,handles.u1,handles.z1,handles.B_footing,handles.L_footing);
            else
                            %%%%Bearing Capacity %%%%
            qnf=Bearing_Capacity(handles.phi1,handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=0;
            end
            FS=factor_of_safety(qnf,qnet_max);

            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_2=consolidation_settlement(qnet_ave,handles.mv2,handles.H2,handles.u2,handles.z2,handles.B_footing,handles.L_footing);
            else 
                Sc_2=0;
            end

            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_3=consolidation_settlement(qnet_ave,handles.mv3,handles.H3,handles.u3,handles.z3,handles.B_footing,handles.L_footing);
            else 
                Sc_3=0;
            end                        
            Stotal=Si_1+Sc_1+Sc_2+Sc_3;
            set(handles.txt_FS,'String',num2str(FS));
            set(handles.txt_settlement,'String',num2str(Stotal));
            %%%%%Check Design Limits%%%%%
            if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
            elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
            else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
            end
        end                    
%%%%%FINISH%%%%%
%%%%%%case 4 START%%%%%
    case 4      %%%number of layers = 4%%
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');    
        elseif handles.v3==0;
        warndlg('You have forgotten to enter layer 3 properties','Warning');
        elseif handles.v4==0;
        warndlg('You have forgotten to enter layer 4 properties','Warning');
        else
            
        %%%%Soil pressure distribution%%%%
            [qnet_max,qnet_min,qnet_ave]=soilpressures(handles.single_loading,handles.M1,handles.M2,handles.L_footing,handles.B_footing,handles.Df,handles.t,handles.gama1);
            if qnet_min<0
                errordlg('You have tension zone change dimensions','Error')
                return
            end
            %%%%%%%Settlement of first layer%%%%%%
            Si_1=immediate_settlement(qnet_ave,handles.v1,handles.E1,handles.B_footing,handles.L_footing);
            
            if strcmp(handles.soiltype1,'cohesive')    %%%check cohesiveness & consolidation%%%
                qnf=Bearing_Capacity_cohesive(handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=consolidation_settlement(qnet_ave,handles.mv1,handles.H1,handles.u1,handles.z1,handles.B_footing,handles.L_footing);
            else
                            %%%%Bearing Capacity %%%%
            qnf=Bearing_Capacity(handles.phi1,handles.gama1,handles.c1,handles.Df,handles.B_footing,handles.L_footing,handles.GW,handles.t);
                Sc_1=0;
            end
            FS=factor_of_safety(qnf,qnet_max);


            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_2=consolidation_settlement(qnet_ave,handles.mv2,handles.H2,handles.u2,handles.z2,handles.B_footing,handles.L_footing);
            else 
                Sc_2=0;
            end

            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_3=consolidation_settlement(qnet_ave,handles.mv3,handles.H3,handles.u3,handles.z3,handles.B_footing,handles.L_footing);
            else 
                Sc_3=0;
            end           
            if strcmp(handles.soiltype2,'cohesive')    %%%check cohesiveness & consolidation%%%
                Sc_4=consolidation_settlement(qnet_ave,handles.mv4,handles.H4,handles.u4,handles.z4,handles.B_footing,handles.L_footing);
            else 
                Sc_4=0;
            end          
            Stotal=Si_1+Sc_1+Sc_2+Sc_3+Sc_4;
            set(handles.txt_FS,'String',num2str(FS));
            set(handles.txt_settlement,'String',num2str(Stotal));
            %%%%%Check Design Limits%%%%%
            if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
            elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
            else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
            end
        end            
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%% END OF SINGLE FOOTING %%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%% START OF PILE FOUNDATION %%%%%%%%%%%%%%%%%%%%%%
    case 2
           switch handles.layer_number
    case 0
    warndlg('You have forgotten to enter any of layer properties','Warning');

    %%%%%%case 1 START%%%%%    
    case 1      %%%number of layers =1%%
        %%%%%%%%%%%Pile Cap Dimensions%%%%%%%%%%    
        a=(handles.n_pile-1)*3*handles.D_pile+handles.D_pile;
        b=(handles.m_pile-1)*3*handles.D_pile+handles.D_pile;
        %%%%%%%%%%%Single Pile Loading%%%%%%%%%%
        pile_number=handles.n_pile*handles.m_pile;
        Qpile=(handles.total_loading+a*b*handles.t*24)/pile_number+(pi*handles.D_pile^2*handles.L_pile)*24;
        
        
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.L_pile>handles.z1+handles.H1
        warndlg('Pile length should not go beyond the bedrock','Warning');
        else
        if handles.z1<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z1+handles.H1>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong1=handles.L_pile-handles.z1;
            else
               Lalong1=handles.H1;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z1>=20*handles.D_pile
                sigma_1=0;     %%%equal to the end of previous layer
                sigma_1_end=0;  %%%equal to the end of previous layer
                Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
            
            elseif handles.z1+handles.H1<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                end
                
            elseif handles.z1+handles.H1>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z1+Lalong1<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                    elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    end
                   
                elseif handles.z1+Lalong1>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(20*handles.D_pile-handles.z1)*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*(20*handles.D_pile-handles.z1);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                    
                    elseif handles.z1<handles.GW && handles.GW<20*handles.D_pile
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(20*handles.D_pile-handles.GW)*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_1_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c1,handles.D_pile);
               Qs1=skin_friction_cohesive(handles.c1,handles.D_pile,Lalong1);
        end   %%%%%soil type end%%%%%
               Qs=Qs1; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%

%%%%%%%%%%%%%%settlement buraya yazýlcak%%%%%%%%%%
B_pile_cap=min([a b]);
L_pile_cap=max([a b]);

%%%%Layer 1 Settlement Calculations%%%%
if handles.z1<2/3*handles.L_pile
    if handles.z1+handles.H1>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v1,handles.E1,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype1,'cohesive')
            Sc1=consolidation_settlement_pile(qstart,handles.mv1,1/3*handles.L_pile,handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc1=0;
        end
    elseif strcmp(handles.soiltype1,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc1=consolidation_settlement_pile(qstart,handles.mv1,(handles.z1+handles.H1-2/3*handles.L_pile),handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc1=0;
    end
else 
    Si=0;
    Sc1=0;
end

               Stotal=Si+Sc1;
               FS=FS_pile(Qpile,Qult,handles.n_pile,handles.m_pile);
               set(handles.txt_FS,'String',num2str(FS));
               set(handles.txt_settlement,'String',num2str(Stotal));
                    if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
                    elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
                    else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
                    end
        end
        
    %%%%%%case 2 START%%%%%    
case 2      %%%number of layers =2%%
        %%%%%%%%%%%Pile Cap Dimensions%%%%%%%%%%    
        a=(handles.n_pile-1)*3*handles.D_pile+handles.D_pile;
        b=(handles.m_pile-1)*3*handles.D_pile+handles.D_pile;
        %%%%%%%%%%%Single Pile Loading%%%%%%%%%%
        pile_number=handles.n_pile*handles.m_pile;
        Qpile=(handles.total_loading+a*b*handles.t*24)/pile_number+(pi*handles.D_pile^2*handles.L_pile)*24;
        
        
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.L_pile>handles.z2+handles.H2
        warndlg('Pile length should not go beyond the bedrock','Warning');
        else
                %%% Layer 1 Calculations %%%
if handles.z1<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z1+handles.H1>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong1=handles.L_pile-handles.z1;
            else
               Lalong1=handles.H1;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z1>=20*handles.D_pile
                sigma_1=0;     %%%equal to the end of previous layer
                sigma_1_end=0;  %%%equal to the end of previous layer
                Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
            
            elseif handles.z1+handles.H1<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                end
                
            elseif handles.z1+handles.H1>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z1+Lalong1<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                    elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    end
                   
                elseif handles.z1+Lalong1>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(20*handles.D_pile-handles.z1)*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*(20*handles.D_pile-handles.z1);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                    
                    elseif handles.z1<handles.GW && handles.GW<20*handles.D_pile
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(20*handles.D_pile-handles.GW)*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_1_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c1,handles.D_pile);
               Qs1=skin_friction_cohesive(handles.c1,handles.D_pile,Lalong1);
        end   %%%%%soil type end%%%%%
               Qs=Qs1; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%    
            
            
            %%%%LAYER 2 CALCULATIONS%%%%%
        if handles.z2<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z2+handles.H2>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong2=handles.L_pile-handles.z2;
            else
               Lalong2=handles.H2;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z2>=20*handles.D_pile
                sigma_2=sigma_1_end;     %%%equal to the end of previous layer
                sigma_2_end=sigma_1_end;  %%%equal to the end of previous layer
                Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
            
            elseif handles.z2+handles.H2<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                end
                
            elseif handles.z2+handles.H2>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z2+Lalong2<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                    elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    end
                   
                elseif handles.z2+Lalong2>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(20*handles.D_pile-handles.z2)*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*(20*handles.D_pile-handles.z2);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                    
                    elseif handles.z2<handles.GW && handles.GW<20*handles.D_pile
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(20*handles.D_pile-handles.GW)*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_2_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c2,handles.D_pile);
               Qs2=skin_friction_cohesive(handles.c2,handles.D_pile,Lalong2);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%
%%%%%%%% SETTLEMENT CALCULATIONS%%%%%%%%%%

B_pile_cap=min([a b]);
L_pile_cap=max([a b]);

%%%%Layer 1 Settlement Calculations%%%%
if handles.z1<2/3*handles.L_pile
    if handles.z1+handles.H1>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v1,handles.E1,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype1,'cohesive')
            Sc1=consolidation_settlement_pile(qstart,handles.mv1,1/3*handles.L_pile,handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc1=0;
        end
    elseif strcmp(handles.soiltype1,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc1=consolidation_settlement_pile(qstart,handles.mv1,(handles.z1+handles.H1-2/3*handles.L_pile),handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc1=0;
    end
else 
    Si=0;
    Sc1=0;
end

%%%%Layer 2 Settlement Calculations%%%%
if handles.z2<2/3*handles.L_pile
    if handles.z2+handles.H2>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v2,handles.E2,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype2,'cohesive')
            Sc2=consolidation_settlement_pile(qstart,handles.mv2,1/3*handles.L_pile,handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc2=0;
        end
    elseif strcmp(handles.soiltype2,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc2=consolidation_settlement_pile(qstart,handles.mv2,(handles.z2+handles.H2-2/3*handles.L_pile),handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc2=0;
    end
else 
    Si=0;
    Sc2=0;
end 

               Stotal=Si+Sc1+Sc2;
               FS=FS_pile(Qpile,Qult,handles.n_pile,handles.m_pile);
               set(handles.txt_FS,'String',num2str(FS));
               set(handles.txt_settlement,'String',num2str(Stotal));
                    if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
                    elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
                    else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
                    end
        end
case 3      %%%number of layers =3%%
        %%%%%%%%%%%Pile Cap Dimensions%%%%%%%%%%    
        a=(handles.n_pile-1)*3*handles.D_pile+handles.D_pile;
        b=(handles.m_pile-1)*3*handles.D_pile+handles.D_pile;
        %%%%%%%%%%%Single Pile Loading%%%%%%%%%%
        pile_number=handles.n_pile*handles.m_pile;
        Qpile=(handles.total_loading+a*b*handles.t*24)/pile_number+(pi*handles.D_pile^2*handles.L_pile)*24;
        
        
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.v3==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.L_pile>handles.z3+handles.H3
        warndlg('Pile length should not go beyond the bedrock','Warning');
        else
                %%% Layer 1 Calculations %%%
if handles.z1<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z1+handles.H1>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong1=handles.L_pile-handles.z1;
            else
               Lalong1=handles.H1;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z1>=20*handles.D_pile
                sigma_1=0;     %%%equal to the end of previous layer
                sigma_1_end=0;  %%%equal to the end of previous layer
                Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
            
            elseif handles.z1+handles.H1<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                end
                
            elseif handles.z1+handles.H1>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z1+Lalong1<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                    elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    end
                   
                elseif handles.z1+Lalong1>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(20*handles.D_pile-handles.z1)*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*(20*handles.D_pile-handles.z1);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                    
                    elseif handles.z1<handles.GW && handles.GW<20*handles.D_pile
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(20*handles.D_pile-handles.GW)*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_1_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c1,handles.D_pile);
               Qs1=skin_friction_cohesive(handles.c1,handles.D_pile,Lalong1);
        end   %%%%%soil type end%%%%%
               Qs=Qs1; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%    
            
            
            %%%%LAYER 2 CALCULATIONS%%%%%
        if handles.z2<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z2+handles.H2>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong2=handles.L_pile-handles.z2;
            else
               Lalong2=handles.H2;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z2>=20*handles.D_pile
                sigma_2=sigma_1_end;     %%%equal to the end of previous layer
                sigma_2_end=sigma_1_end;  %%%equal to the end of previous layer
                Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
            
            elseif handles.z2+handles.H2<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                end
                
            elseif handles.z2+handles.H2>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z2+Lalong2<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                    elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    end
                   
                elseif handles.z2+Lalong2>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(20*handles.D_pile-handles.z2)*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*(20*handles.D_pile-handles.z2);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                    
                    elseif handles.z2<handles.GW && handles.GW<20*handles.D_pile
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(20*handles.D_pile-handles.GW)*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_2_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c2,handles.D_pile);
               Qs2=skin_friction_cohesive(handles.c2,handles.D_pile,Lalong2);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%

%%%%LAYER 3 CALCULATIONS%%%%%
        if handles.z3<handles.L_pile  %%%%%%Pile layera giriyor mu=?%%%

            if handles.z3+handles.H3>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong3=handles.L_pile-handles.z3;
            else
               Lalong3=handles.H3;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z3>=20*handles.D_pile
                sigma_3=sigma_2_end;     %%%equal to the end of previous layer
                sigma_3_end=sigma_2_end;  %%%equal to the end of previous layer
                Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
            
            elseif handles.z3+handles.H3<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z3+Lalong3<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+Lalong3*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
        
                elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*Lalong3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    
                elseif handles.z3<handles.GW && handles.GW<handles.z3+Lalong3
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(Lalong3-(handles.GW-handles.z3))*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                end
                
            elseif handles.z3+handles.H3>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z3+Lalong3<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z3+Lalong3<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+Lalong3*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
        
                    elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*Lalong3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    
                    elseif handles.z3<handles.GW && handles.GW<handles.z3+Lalong3
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(Lalong3-(handles.GW-handles.z3))*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    end
                   
                elseif handles.z3+Lalong3>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(20*handles.D_pile-handles.z3)*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                        
                    elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*(20*handles.D_pile-handles.z3);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                    
                    elseif handles.z3<handles.GW && handles.GW<20*handles.D_pile
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(20*handles.D_pile-handles.GW)*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_3_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c3,handles.D_pile);
               Qs3=skin_friction_cohesive(handles.c3,handles.D_pile,Lalong3);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2+Qs3; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%        
%%%%%%%%%%%%%%SETTLEMENT CALCULATIONS%%%%%%%%%%%%%%%%%
B_pile_cap=min([a b]);
L_pile_cap=max([a b]);

%%%%Layer 1 Settlement Calculations%%%%
if handles.z1<2/3*handles.L_pile
    if handles.z1+handles.H1>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v1,handles.E1,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype1,'cohesive')
            Sc1=consolidation_settlement_pile(qstart,handles.mv1,1/3*handles.L_pile,handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc1=0;
        end
    elseif strcmp(handles.soiltype1,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc1=consolidation_settlement_pile(qstart,handles.mv1,(handles.z1+handles.H1-2/3*handles.L_pile),handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc1=0;
    end
else 
    Si=0;
    Sc1=0;
end

%%%%Layer 2 Settlement Calculations%%%%
if handles.z2<2/3*handles.L_pile
    if handles.z2+handles.H2>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v2,handles.E2,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype2,'cohesive')
            Sc2=consolidation_settlement_pile(qstart,handles.mv2,1/3*handles.L_pile,handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc2=0;
        end
    elseif strcmp(handles.soiltype2,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc2=consolidation_settlement_pile(qstart,handles.mv2,(handles.z2+handles.H2-2/3*handles.L_pile),handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc2=0;
    end
else 
    Si=0;
    Sc2=0;
end 

%%%%Layer 3 Settlement Calculations%%%%
if handles.z3<2/3*handles.L_pile
    if handles.z3+handles.H3>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v3,handles.E3,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype3,'cohesive')
            Sc3=consolidation_settlement_pile(qstart,handles.mv3,1/3*handles.L_pile,handles.u3,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc3=0;
        end
    elseif strcmp(handles.soiltype3,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc3=consolidation_settlement_pile(qstart,handles.mv3,(handles.z3+handles.H3-2/3*handles.L_pile),handles.u3,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc3=0;
    end
else 
    Si=0;
    Sc3=0;
end 

               Stotal=Si+Sc1+Sc2+Sc3;
               FS=FS_pile(Qpile,Qult,handles.n_pile,handles.m_pile);
               set(handles.txt_FS,'String',num2str(FS));
               set(handles.txt_settlement,'String',num2str(Stotal));
                    if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
                    elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
                    else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
                    end
        end            
case 4      %%%number of layers =4%%
        %%%%%%%%%%%Pile Cap Dimensions%%%%%%%%%%    
        a=(handles.n_pile-1)*3*handles.D_pile+handles.D_pile;
        b=(handles.m_pile-1)*3*handles.D_pile+handles.D_pile;
        %%%%%%%%%%%Single Pile Loading%%%%%%%%%%
        pile_number=handles.n_pile*handles.m_pile;
        Qpile=(handles.total_loading+a*b*handles.t*24)/pile_number+(pi*handles.D_pile^2*handles.L_pile)*24;
        
        
        if handles.v1==0;   %check values are updated or not%
        warndlg('You have forgotten to enter layer 1 properties','Warning');
        elseif handles.v2==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.v3==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.v4==0;    
        warndlg('You have forgotten to enter layer 2 properties','Warning');
        elseif handles.L_pile>handles.z4+handles.H4
        warndlg('Pile length should not go beyond the bedrock','Warning');
        else
                %%% Layer 1 Calculations %%%
if handles.z1<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z1+handles.H1>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong1=handles.L_pile-handles.z1;
            else
               Lalong1=handles.H1;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z1>=20*handles.D_pile
                sigma_1=0;     %%%equal to the end of previous layer
                sigma_1_end=0;  %%%equal to the end of previous layer
                Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
            
            elseif handles.z1+handles.H1<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                end
                
            elseif handles.z1+handles.H1>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z1+Lalong1<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z1+Lalong1<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+Lalong1*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*Lalong1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    
                    elseif handles.z1<handles.GW && handles.GW<handles.z1+Lalong1
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(Lalong1-(handles.GW-handles.z1))*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        Qs1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,Lalong1);
                    end
                   
                elseif handles.z1+Lalong1>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(20*handles.D_pile-handles.z1)*handles.gama1;
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    elseif handles.z1>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.gama1-10)*(20*handles.D_pile-handles.z1);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                    
                    elseif handles.z1<handles.GW && handles.GW<20*handles.D_pile
                        sigma_1_start=0;   %%%equal to the end of previous layer%%%
                        sigma_1_end=sigma_1_start+(handles.GW-handles.z1)*handles.gama1+(20*handles.D_pile-handles.GW)*(handles.gama1-10);
                        sigma_1=(sigma_1_start+sigma_1_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs1_1=skin_friction_cohesionless(handles.phi1,sigma_1,handles.D_pile,(20*handles.D_pile-handles.z1));
                        %%%%rectangular yükleme%%%
                        Qs1_2=skin_friction_cohesionless(handles.phi1,sigma_1_end,handles.D_pile,(Lalong1-(20*handles.D_pile-handles.z1)));
                        Qs1=Qs1_1+Qs1_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_1_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c1,handles.D_pile);
               Qs1=skin_friction_cohesive(handles.c1,handles.D_pile,Lalong1);
        end   %%%%%soil type end%%%%%
               Qs=Qs1; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%    
            
            
            %%%%LAYER 2 CALCULATIONS%%%%%
        if handles.z2<handles.L_pile%%%%%%Pile layera giriyor mu=?%%%

            if handles.z2+handles.H2>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong2=handles.L_pile-handles.z2;
            else
               Lalong2=handles.H2;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z2>=20*handles.D_pile
                sigma_2=sigma_1_end;     %%%equal to the end of previous layer
                sigma_2_end=sigma_1_end;  %%%equal to the end of previous layer
                Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
            
            elseif handles.z2+handles.H2<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                end
                
            elseif handles.z2+handles.H2>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z2+Lalong2<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z2+Lalong2<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+Lalong2*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*Lalong2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    
                    elseif handles.z2<handles.GW && handles.GW<handles.z2+Lalong2
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(Lalong2-(handles.GW-handles.z2))*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        Qs2=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,Lalong2);
                    end
                   
                elseif handles.z2+Lalong2>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(20*handles.D_pile-handles.z2)*handles.gama2;
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    elseif handles.z2>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.gama2-10)*(20*handles.D_pile-handles.z2);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                    
                    elseif handles.z2<handles.GW && handles.GW<20*handles.D_pile
                        sigma_2_start=sigma_1_end;   %%%equal to the end of previous layer%%%
                        sigma_2_end=sigma_2_start+(handles.GW-handles.z2)*handles.gama2+(20*handles.D_pile-handles.GW)*(handles.gama2-10);
                        sigma_2=(sigma_2_start+sigma_2_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs2_1=skin_friction_cohesionless(handles.phi1,sigma_2,handles.D_pile,(20*handles.D_pile-handles.z2));
                        %%%%rectangular yükleme%%%
                        Qs2_2=skin_friction_cohesionless(handles.phi1,sigma_2_end,handles.D_pile,(Lalong2-(20*handles.D_pile-handles.z2)));
                        Qs2=Qs2_1+Qs2_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_2_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c2,handles.D_pile);
               Qs2=skin_friction_cohesive(handles.c2,handles.D_pile,Lalong2);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%

%%%%LAYER 3 CALCULATIONS%%%%%
        if handles.z3<handles.L_pile  %%%%%%Pile layera giriyor mu=?%%%

            if handles.z3+handles.H3>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong3=handles.L_pile-handles.z3;
            else
               Lalong3=handles.H3;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z3>=20*handles.D_pile
                sigma_3=sigma_2_end;     %%%equal to the end of previous layer
                sigma_3_end=sigma_2_end;  %%%equal to the end of previous layer
                Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
            
            elseif handles.z3+handles.H3<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z3+Lalong3<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+Lalong3*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
        
                elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*Lalong3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    
                elseif handles.z3<handles.GW && handles.GW<handles.z3+Lalong3
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(Lalong3-(handles.GW-handles.z3))*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                end
                
            elseif handles.z3+handles.H3>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z3+Lalong3<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z3+Lalong3<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+Lalong3*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
        
                    elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*Lalong3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    
                    elseif handles.z3<handles.GW && handles.GW<handles.z3+Lalong3
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(Lalong3-(handles.GW-handles.z3))*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        Qs3=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,Lalong3);
                    end
                   
                elseif handles.z3+Lalong3>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(20*handles.D_pile-handles.z3)*handles.gama3;
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                        
                    elseif handles.z3>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.gama3-10)*(20*handles.D_pile-handles.z3);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                    
                    elseif handles.z3<handles.GW && handles.GW<20*handles.D_pile
                        sigma_3_start=sigma_2_end;   %%%equal to the end of previous layer%%%
                        sigma_3_end=sigma_3_start+(handles.GW-handles.z3)*handles.gama3+(20*handles.D_pile-handles.GW)*(handles.gama3-10);
                        sigma_3=(sigma_3_start+sigma_3_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs3_1=skin_friction_cohesionless(handles.phi1,sigma_3,handles.D_pile,(20*handles.D_pile-handles.z3));
                        %%%%rectangular yükleme%%%
                        Qs3_2=skin_friction_cohesionless(handles.phi1,sigma_3_end,handles.D_pile,(Lalong3-(20*handles.D_pile-handles.z3)));
                        Qs3=Qs3_1+Qs3_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_3_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c3,handles.D_pile);
               Qs3=skin_friction_cohesive(handles.c3,handles.D_pile,Lalong3);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2+Qs3; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%        

        %%%%LAYER 4 CALCULATIONS%%%%%
        if handles.z4<handles.L_pile  %%%%%%Pile layera giriyor mu=?%%%

            if handles.z4+handles.H4>=handles.L_pile
                %%%%%Pile length along the first layer%%%%
               Lalong4=handles.L_pile-handles.z4;
            else
               Lalong4=handles.H4;
            end
        
        if strcmp(handles.soiltype1,'cohesionless')    %%cohesonless soil case%%
        
            if handles.z4>=20*handles.D_pile
                sigma_4=sigma_3_end;     %%%equal to the end of previous layer
                sigma_4_end=sigma_3_end;  %%%equal to the end of previous layer
                Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
            
            elseif handles.z4+handles.H4<=20*handles.D_pile  %%%bu layerda 20*D'ye ulaþýlmadý%%%
                
                if handles.z4+Lalong4<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+Lalong4*handles.gama4;
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
        
                elseif handles.z4>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.gama4-10)*Lalong4;
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
                    
                elseif handles.z4<handles.GW && handles.GW<handles.z4+Lalong4
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.GW-handles.z4)*handles.gama4+(Lalong4-(handles.GW-handles.z4))*(handles.gama4-10);
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
                end
                
            elseif handles.z4+handles.H4>20*handles.D_pile  %%%20*D ye bu layerda ulaþýlýyor%%%
                
                if handles.z4+Lalong4<=20*handles.D_pile     %%%sadece trapezoid yükleme var%%%
                    
                    if handles.z4+Lalong4<=handles.GW         %%%Bu layerda GW yok%%%
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+Lalong4*handles.gama4;
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
        
                    elseif handles.z4>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.gama4-10)*Lalong4;
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
                    
                    elseif handles.z4<handles.GW && handles.GW<handles.z4+Lalong4
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.GW-handles.z4)*handles.gama4+(Lalong4-(handles.GW-handles.z4))*(handles.gama4-10);
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        Qs4=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,Lalong4);
                    end
                   
                elseif handles.z4+Lalong4>20*handles.D_pile         %%%trapezoid yükleme ve rectangular yükleme%%%
                    
                    if 20*handles.D_pile<=handles.GW         %%%Bu layerda GW yok%%%
                        
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(20*handles.D_pile-handles.z4)*handles.gama4;
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        %%%%trapezoid yükleme%%%
                        Qs4_1=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,(20*handles.D_pile-handles.z4));
                        %%%%rectangular yükleme%%%
                        Qs4_2=skin_friction_cohesionless(handles.phi1,sigma_4_end,handles.D_pile,(Lalong4-(20*handles.D_pile-handles.z4)));
                        Qs4=Qs4_1+Qs4_2;
                        
                    elseif handles.z4>=handles.GW %%%%GW olma olasýlðý var 2 durumu incele%%%%
                    
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.gama4-10)*(20*handles.D_pile-handles.z4);
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                        
                        %%%%trapezoid yükleme%%%
                        Qs4_1=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,(20*handles.D_pile-handles.z4));
                        %%%%rectangular yükleme%%%
                        Qs4_2=skin_friction_cohesionless(handles.phi1,sigma_4_end,handles.D_pile,(Lalong4-(20*handles.D_pile-handles.z4)));
                        Qs4=Qs4_1+Qs4_2;
                    
                    elseif handles.z4<handles.GW && handles.GW<20*handles.D_pile
                        sigma_4_start=sigma_3_end;   %%%equal to the end of previous layer%%%
                        sigma_4_end=sigma_4_start+(handles.GW-handles.z4)*handles.gama4+(20*handles.D_pile-handles.GW)*(handles.gama4-10);
                        sigma_4=(sigma_4_start+sigma_4_end)/2;
                    
                        %%%%trapezoid yükleme%%%
                        Qs4_1=skin_friction_cohesionless(handles.phi1,sigma_4,handles.D_pile,(20*handles.D_pile-handles.z4));
                        %%%%rectangular yükleme%%%
                        Qs4_2=skin_friction_cohesionless(handles.phi1,sigma_4_end,handles.D_pile,(Lalong4-(20*handles.D_pile-handles.z4)));
                        Qs4=Qs4_1+Qs4_2;
                        
                    end
                end
            end
               Qp=end_bearing_cohesionless(handles.phi1,sigma_4_end,handles.D_pile);        
        else  %%%%%cohesive soil case%%%%%
               Qp=end_bearing_cohesive(handles.c4,handles.D_pile);
               Qs4=skin_friction_cohesive(handles.c4,handles.D_pile,Lalong4);
        end   %%%%%soil type end%%%%%
               Qs=Qs1+Qs2+Qs3+Qs4; %%% sum of all skin frictions%%%
               Qult=Qs+Qp;
                    
        else  %%%%%Pile layera girmiyor%%%%  
        end   %%%%%pile layer entrance check end%%%%     
        %%%%%%%%%%%%%SETTLEMENT CALCULATIONS%%%%%%%%%%%%
        B_pile_cap=min([a b]);
L_pile_cap=max([a b]);

%%%%Layer 1 Settlement Calculations%%%%
if handles.z1<2/3*handles.L_pile
    if handles.z1+handles.H1>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v1,handles.E1,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype1,'cohesive')
            Sc1=consolidation_settlement_pile(qstart,handles.mv1,1/3*handles.L_pile,handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc1=0;
        end
    elseif strcmp(handles.soiltype1,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc1=consolidation_settlement_pile(qstart,handles.mv1,(handles.z1+handles.H1-2/3*handles.L_pile),handles.u1,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc1=0;
    end
else 
    Si=0;
    Sc1=0;
end

%%%%Layer 2 Settlement Calculations%%%%
if handles.z2<2/3*handles.L_pile
    if handles.z2+handles.H2>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v2,handles.E2,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype2,'cohesive')
            Sc2=consolidation_settlement_pile(qstart,handles.mv2,1/3*handles.L_pile,handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc2=0;
        end
    elseif strcmp(handles.soiltype2,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc2=consolidation_settlement_pile(qstart,handles.mv2,(handles.z2+handles.H2-2/3*handles.L_pile),handles.u2,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc2=0;
    end
else 
    Si=0;
    Sc2=0;
end 

%%%%Layer 3 Settlement Calculations%%%%
if handles.z3<2/3*handles.L_pile
    if handles.z3+handles.H3>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v3,handles.E3,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype3,'cohesive')
            Sc3=consolidation_settlement_pile(qstart,handles.mv3,1/3*handles.L_pile,handles.u3,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc3=0;
        end
    elseif strcmp(handles.soiltype3,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc3=consolidation_settlement_pile(qstart,handles.mv3,(handles.z3+handles.H3-2/3*handles.L_pile),handles.u3,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc3=0;
    end
else 
    Si=0;
    Sc3=0;
end 

%%%%Layer 4 Settlement Calculations%%%%
if handles.z4<2/3*handles.L_pile
    if handles.z4+handles.H4>handles.L_pile
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Si = immediate_settlement(qstart,handles.v4,handles.E4,B_pile_cap,L_pile_cap);
        if strcmp(handles.soiltype4,'cohesive')
            Sc4=consolidation_settlement_pile(qstart,handles.mv4,1/3*handles.L_pile,handles.u4,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
        else 
            Sc4=0;
        end
    elseif strcmp(handles.soiltype4,'cohesive')
        qstart=Qpile/(B_pile_cap*L_pile_cap);
        Sc4=consolidation_settlement_pile(qstart,handles.mv4,(handles.z4+handles.H4-2/3*handles.L_pile),handles.u4,2/3*handles.L_pile,B_pile_cap,L_pile_cap);
    else
    Si=0;
    Sc4=0;
    end
else 
    Si=0;
    Sc4=0;
end 

               Stotal=Si+Sc1+Sc2+Sc3+Sc4;
               FS=FS_pile(Qpile,Qult,handles.n_pile,handles.m_pile);
               set(handles.txt_FS,'String',num2str(FS));
               set(handles.txt_settlement,'String',num2str(Stotal));
                    if FS<2
               [picdata,picmap] = imread('sorry.png'); 
               msgbox('Factor of safety with respect to shear failure in terms of ultimate bearing capacity is smaller than 2.0','Failure','custom',picdata,picmap)
                    elseif Stotal>40
               [picdata,picmap] = imread('sorry.png');
               msgbox('You have excessive settlement value (more than 40mm)','Failure','custom',picdata,picmap)
                    else
               [picdata,picmap]=imread('ok.png');
               msgbox('Great job, everything is fine!','Success','custom',picdata,picmap)
                    end
        end         
        
            
           end %%%layer control end%%%
           end %%%foundationtype end%%%
guidata(hObject, handles);



function edt_npile_Callback(hObject, eventdata, handles)
% hObject    handle to edt_npile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_npile as text
%        str2double(get(hObject,'String')) returns contents of edt_npile as a double
handles.n_pile=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_npile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_npile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_mpile_Callback(hObject, eventdata, handles)
% hObject    handle to edt_mpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_mpile as text
%        str2double(get(hObject,'String')) returns contents of edt_mpile as a double
handles.m_pile=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edt_mpile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_mpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Lpile_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Lpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Lpile as text
%        str2double(get(hObject,'String')) returns contents of edt_Lpile as a double
handles.L_pile=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_Lpile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Lpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Dpile_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Dpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Dpile as text
%        str2double(get(hObject,'String')) returns contents of edt_Dpile as a double
handles.D_pile=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edt_Dpile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Dpile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
