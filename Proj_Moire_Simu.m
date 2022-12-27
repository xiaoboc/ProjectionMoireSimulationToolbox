
function calib_gui_normal,

clear

cell_list = {};

%-------- Begin editable region -------------%
%-------- Begin editable region -------------%


fig_number = 1;

title_figure = 'Projection Moire Simulation Toolbox';

cell_list{1,1} = {'Load Setup Data','Simu_Data;'};
cell_list{1,2} = {'View Proj','Proj_size;'};
cell_list{1,3} = {'Load Object','Object_Data;'};
cell_list{1,4} = {'Figure Object','Figure_Object;'};

cell_list{2,1} = {'Moire Fringe Predict','Moire_Predict;'};
cell_list{2,2} = {'Wrapped Phase Map','Wrapped_Phase_Map;'};
cell_list{2,3} = {'Wrapped Phase Shape','Wrapped_Phase_Shape;'};
cell_list{2,4} = {'Wrapped Phase Section','Wrapped_Phase_Section;'};
cell_list{2,5} = {'Wrapped Object Shape','Wrapped_Object_Shape;'};

cell_list{3,1} = {'Unwrapped_Phase_Map','Phase_Unwrapping;'};
cell_list{3,2} = {'Unwrapped Phase Shape','Unwrapped_Phase_Shape;'};
cell_list{3,3} = {'Unwrapped Phase Section','Unwrapped_Phase_Section;'};
cell_list{3,4} = {'Unwrapped Object Shape','Unwrapped_Object_Shape;'};
cell_list{3,5} = {'Error Analysis','Height_Error;'};

cell_list{4,1} = {'Dual Frequency','Dual_Frequency;'};
cell_list{4,2} = {'Error Analysis','Dual_Error_Analysis;'};

cell_list{5,1} = {'Viewing Intensity','Viewing_Intensity;'};
cell_list{5,2} = {'Projection Intensity','Projection_Intensity;'};
cell_list{5,3} = {'Superposed Intensity','Superposed_Intensity;'};

cell_list{6,1} = {'Viewing Intensity','Viewing_Intensity1;'};
cell_list{6,2} = {'Projection Intensity','Projection_Intensity1;'};
cell_list{6,3} = {'Superposed Intensity','Superposed_Intensity1;'};


%% From point of CCD...
%% The simulated captured images....
cell_list{7,1} = {'Simulated Image','Simulated_Image;'};
% cell_list{7,2} = {'Projection Intensity','Projection_Intensity1;'};
% cell_list{7,3} = {'Superposed Intensity','Superposed_Intensity1;'};


% cell_list{6,1} = {'FFT','Viewing_Intensity;'};
% cell_list{6,2} = {'Projection Intensity','Projection_Intensity;'};
% cell_list{6,3} = {'Superposed Intensity','Superposed_Intensity;'};

% FFT to unwrap...
% systematic error compensation



show_window(cell_list,fig_number,title_figure);


%-------- End editable region -------------%
%-------- End editable region -------------%




%------- DO NOT EDIT ANYTHING BELOW THIS LINE -----------%

function show_window(cell_list,fig_number,title_figure,x_size,y_size,gap_x,font_name,font_size)


if ~exist('cell_list'),
    error('No description of the functions');
end;

if ~exist('fig_number'),
    fig_number = 1;
end;
if ~exist('title_figure'),
    title_figure = '';
end;
if ~exist('x_size'),
    x_size = 85;
end;
if ~exist('y_size'),
    y_size = 14;
end;
if ~exist('gap_x'),
    gap_x = 0;
end;
if ~exist('font_name'),
    font_name = 'clean';
end;
if ~exist('font_size'),
    font_size = 8;
end;

figure(fig_number); clf;
pos = get(fig_number,'Position');

[n_row,n_col] = size(cell_list);

fig_size_x = x_size*n_col+(n_col+1)*gap_x;
fig_size_y = y_size*n_row+(n_row+1)*gap_x;

set(fig_number,'Units','points', ...
	'BackingStore','off', ...
	'Color',[0.8 0.8 0.8], ...
	'MenuBar','none', ...
	'Resize','off', ...
	'Name',title_figure, ...
'Position',[pos(1) pos(2) fig_size_x fig_size_y], ...
'NumberTitle','off'); %,'WindowButtonMotionFcn',['figure(' num2str(fig_number) ');']);

h_mat = zeros(n_row,n_col);

posx = zeros(n_row,n_col);
posy = zeros(n_row,n_col);

for i=n_row:-1:1,
   for j = n_col:-1:1,
      posx(i,j) = gap_x+(j-1)*(x_size+gap_x);
      posy(i,j) = fig_size_y - i*(gap_x+y_size);
   end;
end;

for i=n_row:-1:1,
    for j = n_col:-1:1,
        if ~isempty(cell_list{i,j}),
            if ~isempty(cell_list{i,j}{1}) & ~isempty(cell_list{i,j}{2}),
                h_mat(i,j) = uicontrol('Parent',fig_number, ...
                    'Units','points', ...
                    'Callback',cell_list{i,j}{2}, ...
                    'ListboxTop',0, ...
                    'Position',[posx(i,j)  posy(i,j)  x_size   y_size], ...
                    'String',cell_list{i,j}{1}, ...
                    'fontsize',font_size,...
                    'fontname',font_name,...
                    'Tag','Pushbutton1');
            end;
        end;
    end;
end;

%------ END PROTECTED REGION ----------------%
