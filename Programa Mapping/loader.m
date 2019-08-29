function loader(type,direct)

global file_name
global  Vpas

if nargin == 0
    type = 'matlab';
end

allML = {'*.m;*.fig;*.mat', 'All MATLAB Files'};
if exist('simulink','builtin')
    allML(1)=strcat(allML(1), ';*.mdl');
end
if exist('stateflow')
    allML(1)=strcat(allML(1),';*.cdr');
end
if exist('rtwbuild')
    allML(1)=strcat(allML(1),';*.rtw;*.tmf;*.tlc;*.c;*.h;*.ads;*.adb');
end

switch(lower(type))
 case 'load'
      filterList = [
          {'*.mat', 'MAT-files (*.mat)'}; ...
          ];
 otherwise
  filterList = type;
end

if nargin < 2
    direct = 0;
end



if direct
    fn = type;             %fn = FILE NAME  pn = PATH NAME
else
    [fn,pn] = uigetfile(filterList,'Open Saved Project');
    file_name = fn;
    Vpas = 1;
    if all(pn == 0) || all(fn == 0)
        return;
    end
    fn = fullfile(pn,fn);
end

try
    
    ans = [];

    if strcmpi(type,'editor') % route open requests from editor back to editor
        edit(fn);
    else
        rerouted = false;
        if hdfh('ishdf', fn)
            rerouted = true;
            hdftool(fn);
        else
            open(fn);
        end
    end

    if ~(rerouted || isempty(ans))
        % this was likely a load, shove vars into calling wksp
        if isstruct(ans)
            names = fieldnames(ans);
            for i = 1:length(names)
                assignin('caller',names{i}, ans.(names{i}));
            end
        else
            assignin('caller','ans',ans);
        end
        disp('Variables created in current workspace.');
    end
catch
    errordlg(lasterr);
end