function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
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
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 12-Dec-2020 16:13:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
% --- Open Image ---
function pushbutton1_Callback(hObject, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global G;
global load;
handles.output = hObject;
[fn, pn] = uigetfile({'*.jpg;*.png'},'Select Image File');
complete = strcat('Path: ',pn,fn);
set(handles.text5,'string',complete);
I = imread([pn,fn]);
axes(handles.axes1);
imshow(I,[]);
G = I;
load = imread('loadingPic.jpg');
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
% --- Reset ---
function pushbutton2_Callback(~, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global G;
axes(handles.axes1);
imshow(I,[]);
axes(handles.axes2);
cla;
G = I;

% --- Executes on button press in pushbutton3.
% --- Save Image ---
function pushbutton3_Callback(~, ~, ~)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
[name, path] = uiputfile({'*.png','PNG (*.PNG)';'*.jpg','JPG (*.jpg)'},'Save Image');
imwrite(G,fullfile(path,name));


function edit1_Callback(~, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grayscale.
% --- Grayscale ---
function grayscale_Callback(~, ~, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = grayscale(G);
G = HistGray(x);
imshow(G,[]);


% --- Executes on button press in brightnessgelap.
% --- Brightness <<---
function brightnessgelap_Callback(~, ~, handles)
% hObject    handle to brightnessgelap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
G = G-10;
imshow(G,[]);

% --- Executes on button press in brightnessterang.
% --- Brightness >> ---
function brightnessterang_Callback(~, ~, handles)
% hObject    handle to brightnessterang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
G = G+10;
imshow(G,[]);


% --- Executes on button press in flipvertical.
% --- Flip Vertical ---
function flipvertical_Callback(~, ~, handles)
% hObject    handle to flipvertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
G = flipVer(G);
imshow(G,[]);


% --- Executes on button press in fliphorizontal.
% --- Flip Horizontal ---
function fliphorizontal_Callback(~, ~, handles)
% hObject    handle to fliphorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
G = flipHor(G);
imshow(G,[]);


% --- Executes on button press in rotate.
% --- Rotate ---
function rotate_Callback(~, ~, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = get(handles.popupmenu3,'Value');
switch x
    case 1
        G = imrotate(G,15,'bilinear','crop');
    case 2
        G = imrotate(G,30,'bilinear','crop');
    case 3
        G = imrotate(G,45,'bilinear','crop');
    case 4
        G = imrotate(G,60,'bilinear','crop');
    case 5
        G = imrotate(G,75,'bilinear','crop');
    case 6
        G = rotate90(G);
    case 7
        G = rotate90(G);
        G = rotate90(G);
    otherwise
        G = rotate90(G);
        G = rotate90(G);
        G = rotate90(G);
end
imshow(G,[]);

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(~, ~, ~)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(~, ~, ~)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dilation.
% --- Dilation ---
function dilation_Callback(~, ~, handles)
% hObject    handle to dilation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = get(handles.popupmenu4,'Value');
switch x
    case 1
        n = 3;
    case 2
        n = 5;
    case 3
        n = 7;
end
G = imdilate(im2bw(G),ones(n));
imshow(G,[]);


% --- Executes on button press in erosion.
% --- Erosion ---
function erosion_Callback(~, ~, handles)
% hObject    handle to erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = get(handles.popupmenu4,'Value');
switch x
    case 1
        n = 3;
    case 2
        n = 5;
    case 3
        n = 7;
end
G = imerode(im2bw(G),ones(n));
imshow(G,[]);


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(~, ~, ~)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu13


% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in modusfiltering.
% --- Modus Filtering ---
function modusfiltering_Callback(~, ~, handles)
% hObject    handle to modusfiltering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = get(handles.popupmenu13,'Value');
G = imnoise(G,'salt & pepper',0.02);
switch x
    case 1
        G = moduss(G,3);
    case 2
        G = moduss(G,5);
end
imshow(G, []);

% --- Executes on button press in medianfiltering.
% --- Median Filtering ---
function medianfiltering_Callback(~, ~, handles)
% hObject    handle to medianfiltering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global load;
axes(handles.axes2);
imshow(load,[]); pause(0.05);
x = get(handles.popupmenu12,'Value');
G = imnoise(G,'salt & pepper',0.02);
switch x
    case 1
        G = medianfiltering(G,3);
    case 2
        G = medianfiltering(G,5);
end
imshow(G, []);

% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(~, ~, ~)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu14.
function popupmenu14_Callback(~, ~, ~)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu14 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu14


% --- Executes during object creation, after setting all properties.
function popupmenu14_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu15.
function popupmenu15_Callback(~, ~, ~)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu15 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu15


% --- Executes during object creation, after setting all properties.
function popupmenu15_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu16.
function popupmenu16_Callback(~, ~, ~)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu16


% --- Executes during object creation, after setting all properties.
function popupmenu16_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(~, ~, ~)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu18.
function popupmenu18_Callback(~, ~, ~)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu18 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu18


% --- Executes during object creation, after setting all properties.
function popupmenu18_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
