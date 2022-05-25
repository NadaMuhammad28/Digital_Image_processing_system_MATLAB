function varargout = DIM_project(varargin)
% DIM_PROJECT MATLAB code for DIM_project.fig
%      DIM_PROJECT, by itself, creates a new DIM_PROJECT or raises the existing
%      singleton*.
%
%      H = DIM_PROJECT returns the handle to a new DIM_PROJECT or the handle to
%      the existing singleton*.
%
%      DIM_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIM_PROJECT.M with the given input arguments.
%
%      DIM_PROJECT('Property','Value',...) creates a new DIM_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIM_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIM_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIM_project

% Last Modified by GUIDE v2.5 21-May-2022 14:27:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIM_project_OpeningFcn, ...
                   'gui_OutputFcn',  @DIM_project_OutputFcn, ...
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

%_______________________________________________________________________________________________________________________________
% --- Executes just before DIM_project is made visible.
function DIM_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIM_project (see VARARGIN)

% Choose default command line output for DIM_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIM_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIM_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%__________________________________________________________________________________________
%--------------------------CALLBACKS-------------------------------------------------------
%__________________________________________________________________________________________

%--------------------BASIC OPERATION PANEL---------------------------------


% --- Executes on button press in imageloader.
%upload an image pushbutton
function imageloader_Callback(hObject, eventdata, handles)
% hObject    handle to imageloader (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% type help uigetfile in the command window
global a;
[filename, pathname] = uigetfile('*.*', 'select an image');
%filename--> image name ex untiteld.png
%patname--> the directory D:\project\'
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       imagepath= strcat(pathname,filename);
       a=imread(imagepath);
       axes(handles.axes1);
       imshow(a);
       %save this as a handle, because we want to call this image when
       %reset button is pressed
        handles.a = a;
       % Update handles structure
       guidata(hObject, handles);
    end


%RGB to gray scale pushbutton cllabck

% --- Executes on button press in RGB_to_gray.
function RGB_to_gray_Callback(hObject, eventdata, handles)
% hObject    handle to RGB_to_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input= getimage(handles.axes1);
output= rgb2gray(input);
axes(handles.axes1);
imshow(output);


%noise pushbutton cllabck

% --- Executes on button press in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input= getimage(handles.axes1) ; 
output= imnoise(input, 'salt & pepper', 0.02);
axes(handles.axes1);
imshow(output);


%reset pushbutton cllabck

% --- Executes on button press in RESET.
function RESET_Callback(hObject, eventdata, handles)
% hObject    handle to RESET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset= handles.a ; 
axes(handles.axes1);
imshow(reset);



% --- Executes on button press in ishist.
function ishist_Callback(hObject, eventdata, handles)
% hObject    handle to ishist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ishist
input = getimage(handles.axes1) ; 

if get(handles.ishist, 'value') ==1
   %output = imhist(input);
   figure;
  imhist(input);
end

%_______________________________________________________________________
%-------------------EQUALIZATION PANEL---------------------------------
%_______________________________________________________________________

% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu

%step1: get the input which is axis1

input= getimage(handles.axes1) ; 

%step2: get the pop-menu selcted choice 

contents = cellstr(get(hObject,'String')) ;
menu_choice= contents{get(hObject,'Value')} ; 
menu_choice 
% step2: create if statements for all the pop-menu choices

if (strcmp(menu_choice, 'Contrast Stretching'))   %compare strings
    %do
    output= imadjust(input) ;
    
elseif (strcmp(menu_choice, 'Histogram Equalization'))
    %do
    output= histeq(input) ;

end
axes(handles.axes1);
imshow(output);



% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%__________________________________________________________________________________________









 
%__________________________________________________________________________
%-------------------FILTERING--------------------------------------------
%__________________________________________________________________________

% --- Executes on selection change in listbox.
function listbox_Callback(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox


%step1: get the input which is axis1

input= getimage(handles.axes1) ; 

%step2: get thelistbox selcted choice 

contents = cellstr(get(hObject,'String')) ;
list_choice= contents{get(hObject,'Value')} ; 
list_choice 
% step2: create if statements for all the pop-menu choices

if (strcmp(list_choice, 'Minimum Filter'))   %compare strings
    %do
     minf=@ (x) min(x(:));
     output=nlfilter(input, [3 3], minf);
% x(:) reshapes x into an Nx1 vector
% then the min operation scans from the first element to the last element of the N element vector ooking for the minimum.
%minf is a function handle, then the pointer construct breaks down as the functions that would call at @fun,
elseif (strcmp(list_choice, 'Maximum Filter'))
    %do
    
       maxf=@ (x) max(x(:));
       output=nlfilter(input, [3 3], maxf);


elseif (strcmp(list_choice, 'Median Filter'))
    %removes salt and paper noise
      % mF= @(x) median(x(:));
      % output= nlfilter(input,[3 3],mF);
      output= medfilt2(input, [3 3], 'symmetric');


elseif (strcmp(list_choice, 'Smoothing Filter'))
    %here we are applying 3*3 mask, and for padding --> 'replicate'
    %(default is zero padding)
    %shows gross details
    mask= fspecial('average', [3 3]); 
    output= imfilter(input,mask,'replicate');

 elseif (strcmp(list_choice, 'Weighted Smoothing Filter'))
    %for padding --> 'replicate'
    %(default is zero padding)
    % for weighted filter we need to define weights first
    
    weights= [1 2 1; 2 4 2; 1 2 1]*(1/16);
    output= imfilter(input,weights,'replicate');


  elseif (strcmp(list_choice, 'Laplacian Filter'))
    mask= fspecial('laplacian',0);
    output= imfilter(input,mask,'replicate');
    
elseif (strcmp(list_choice, 'Sharpening Filter'))
    %here we are applying 3*3 mask, and for padding --> 'replicate'
    %(default is zero padding)
    %shows gross details
    mask= fspecial('laplacian',0);
    laplacian= imfilter(input,mask,'replicate');
    output= input-laplacian;

 
elseif (strcmp(list_choice, 'Contraharmonic mean filter'))
 % here we take q value as an input from the user
 % to get the i/p take it from the editbpx, covert it into num
 %this how you doi it notice: handles.q is the tag of the editbox
 Q= get(handles.Q, 'string');
 Q= str2num(Q);
 %after that, pass this value to the filter 
 output= imrest(input,'chmean',3,3,Q);

end
axes(handles.axes1);
imshow(output);




function Q_Callback(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q as text
%        str2double(get(hObject,'String')) returns contents of Q as a double

% --- Executes during object creation, after setting all properties.
function Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




%__________________________________________________________________________
%-----------------------EDGE DETECTION PANEL-------------------------------
%__________________________________________________________________________


% --- Executes on selection change in edge_detection.
function edge_detection_Callback(hObject, eventdata, handles)
% hObject    handle to edge_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edge_detection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edge_detection


%step1: get the input which is axis1

input= getimage(handles.axes1) ; 

%step2: prepare H and V masks
hmask=fspecial('sobel'); %horizontal mask for H edges
vmask=hmask';  %transpose the mask to detect vertical edges


%detect H edges only, use replicate padding
    H_edges=imfilter(input,hmask,'replicate');
%detect V edges only, use replicate padding
  V_edges=imfilter(input,vmask,'replicate');

%step3: get the pop-menu selcted choice 

contents = cellstr(get(hObject,'String')) ;
edge_choice= contents{get(hObject,'Value')} ;  
edge_choice
% step4: create if statements for all the pop-menu choices

if (strcmp(edge_choice, 'Horizontal Edges'))   %compare strings
    %detect H edges only, use replicate padding
    output=H_edges;
    
elseif (strcmp(edge_choice, 'Vertical Edges'))
    %detect V edges only, use replicate padding
   output=V_edges;

elseif (strcmp(edge_choice, 'Both'))
    %detect Both edges, add them
       output= abs(H_edges)+ abs(V_edges);

end
axes(handles.axes1);
imshow(output);


% --- Executes during object creation, after setting all properties.
function edge_detection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edge_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%_______________________________________________________________________
%-------------------NOISE PANEL---------------------------------
%_______________________________________________________________________


% --- Executes on button press in exponential.
function expo_Callback(hObject, eventdata, handles)
% hObject    handle to expo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of expo
input= getimage(handles.axes1) ; 
imwrite(input,'input_for_enoise.tif') ;
if get(handles.expo, 'value') ==1
output= noise('input_for_enoise.tif', 'exponential',.1, 0.002);
axes(handles.axes1);
imshow(output);

end


% --- Executes on button press in salt.
function salt_Callback(hObject, eventdata, handles)
input= getimage(handles.axes1) ; 
imwrite(input,'input_for_snoise.tif') ;
if get(handles.salt, 'value') ==1
output= noise('input_for_snoise.tif', 'salt & pepper',0,.05);
axes(handles.axes1);
imshow(output);
end



% --- Executes on button press in Pepper.
function Pepper_Callback(hObject, eventdata, handles)
input= getimage(handles.axes1) ; 
imwrite(input,'input_for_pnoise.tif') ;
if get(handles.Pepper, 'value') ==1
output= noise('input_for_pnoise.tif', 'salt & pepper',0.05,0);
axes(handles.axes1);
imshow(output);
end


% --- Executes on button press in gaussian.
function gaussian_Callback(hObject, eventdata, handles)
input= getimage(handles.axes1) ; 
if get(handles.gaussian, 'value') ==1
 output= imnoise(input, 'gaussian');
    axes(handles.axes1);
    imshow(output);
end


% --- Executes on button press in Speckle.
function Speckle_Callback(hObject, eventdata, handles)
input= getimage(handles.axes1) ; 
if get(handles.Speckle, 'value') ==1
    output= imnoise(input, 'speckle');
    axes(handles.axes1);
    imshow(output);
end


%_______________________________________________________________________
%-------------------RESTORATION PANEL---------------------------------
%_______________________________________________________________________

% --- Executes on selection change in restore.
function restore_Callback(hObject, eventdata, handles)

%step1: get the input which is axis1

input= getimage(handles.axes1) ; 

%step2: get the pop-menu selcted choice 

contents = cellstr(get(hObject,'String')) ;
menu_choice= contents{get(hObject,'Value')} ; 
menu_choice 
% step2: create if statements for all the pop-menu choices

if (strcmp(menu_choice, 'Restore an image deformed by speckle noise using Harmonic mean filter'))   %compare strings
    %do
    output= imrest(input,'hmean',3,3);
    
elseif (strcmp(menu_choice, 'Restore an image deformed by pepper noise  using Contraharmonic mean filter'))
    %do
    output= imrest(input,'chmean',3,3,3);
elseif (strcmp(menu_choice, 'Restore an image deformed by gaussian noise using Harmonic mean filter'))
    %do
    output= imrest(input,'hmean',3,3);

elseif (strcmp(menu_choice, 'Restore  an image deformed by gaussian noise using midpoint filter'))
    %do
    output= imrest(input,'midpoint',3,3);
 
 elseif (strcmp(menu_choice, 'Restore an image deformed by salt noise  using Contraharmonic mean filter'))
    %do
    output= imrest(input,'chmean',3,3,-3);
end
axes(handles.axes1);
imshow(output);





% --- Executes during object creation, after setting all properties.
function restore_CreateFcn(hObject, eventdata, handles)
% hObject    handle to restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in adding.
function adding_Callback(hObject, eventdata, handles)

input= getimage(handles.axes1) ; 
if get(handles.adding, 'value') ==1
output= linesdetect2(input);

axes(handles.axes1);
imshow(output);
end









% --- Executes on button press in comparing.
function comparing_Callback(hObject, eventdata, handles)


input= getimage(handles.axes1) ; 
if get(handles.comparing, 'value') ==1
output= linesdetect1(input);


axes(handles.axes1);
imshow(output);
end




% --- Executes on button press in S_Sholding.
function S_Sholding_Callback(hObject, eventdata, handles)
% hObject    handle to S_Sholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of S_Sholding


input= getimage(handles.axes1) ; 
if get(handles.S_Sholding, 'value') ==1
output= globalthreshold(input);


axes(handles.axes1);
imshow(output);
h=imhist(input);
figure, plot(h)
end






% --- Executes on button press in D_Sholding.
function D_Sholding_Callback(hObject, eventdata, handles)
% hObject    handle to D_Sholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of D_Sholding


input= getimage(handles.axes1) ; 


if get(handles.D_Sholding, 'value') ==1
    
t1 = 30;
t2 = 220;
g=input;
g(find(input < t1)) = 0;  %bg
g(find(input >= t1 & input < t2)) = 100;  %liquid 
g(find(input >= t2)) = 255; % empty part of the bottles


axes(handles.axes1);
imshow(g);
%h=imhist(input);
%figure, plot(h)
end




% --- Executes on button press in Adap_Th_Sholding.
function Adap_Th_Sholding_Callback(hObject, eventdata, handles)
% hObject    handle to Adap_Th_Sholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Adap_Th_Sholding


input= getimage(handles.axes1) ; 


if get(handles.Adap_Th_Sholding, 'value') ==1
    
p1 = input(1:324,1:203);
p2 = input(1:324,204:406);
p3 = input(1:324,407:609);
p4 = input(1:324,610:812);
p5 = input(325:648,1:203);
p6 = input(325:648,204:406);
p7 = input(325:648,407:609);
p8 = input(325:648,610:812);

g1 = globalthreshold(p1);
g2 = globalthreshold(p2);
g3 = globalthreshold(p3);
g4 = globalthreshold(p4);
g5 = globalthreshold(p5);
g6 = globalthreshold(p6);
g7 = globalthreshold(p7);
g8 = globalthreshold(p8);
g= [g1 g2 g3 g4 ; g5 g6 g7 g8];

axes(handles.axes1);
imshow(g);
%h=imhist(input);
%figure, plot(h)
end
