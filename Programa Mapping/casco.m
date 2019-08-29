% Características do Casco

global  LBMAX BBMAX EXPESSURA

figap=figure('Name','Características do Casco','Numbertitle','off','menubar','none');
set(figap,'units','normalized','resize','off','position',[.4 .4 .25 .22]);

% Menu Done
u=uimenu(figap,'Label','Done');
   
% Menu Help
name_help='help_apIn.html';
hVPP=uimenu(figap,'label','Help');
 uimenu(hVPP,'label','Help','callback','open(name_help)');

%--------------------------------------------------------------------------
set(figap,'units','normalized');

Yspacing=.18;

% FRAME
uicontrol('style','frame','units','normalized','position',[.01 .01 .98 .98],'backgroundcolor',[.7 .7 .7]);

% Titulo do Frame
uicontrol('style','text','units','normalized','position',[.015 .78 .97 .12],...
          'string','Carcterística do Casco','Backgroundcolor',[.7 .7 .7],...
          'fontweight','bold','fontsize',12,'HorizontalAlignment','Center'); 
      
%--------------------------------------------------------------------------
% entrada 1 Comprimento Total (m)
YL=.90-2*Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.08 YL .55 .1],'String',...
          'Comprimento Máximo da Balsa (LBMAX)','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Right');
      
YIn=YL+0.005;
LBMAXIn=uicontrol('Style','Edit','Units','normalized','Position',[.64  YIn .15 .11],...
                  'Backgroundcolor',[1 1 1],'Callback', 'LBMAX=vsave(LBMAXIn);'...
                 ,'String',num2str(LBMAX));

uicontrol('Style','text','Units','normalized','Position',[.79 YL .1 .1],'String',...
          '[m]','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');  
      
%--------------------------------------------------------------------------
% entrada 2 Boca Moldado (m)
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.08 YL .55 .1],'String','Boca Moldado no Estaleiro (BBMAX)',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Right');

YIn=YIn-Yspacing;
BBMAXIn=uicontrol('Style','Edit','Units','normalized','Position',[.64  YIn .15 .11],...
                 'Backgroundcolor',[1 1 1],'Callback', 'BBMAX=vsave(BBMAXIn);'...
                 ,'String',num2str(BBMAX));
             
uicontrol('Style','text','Units','normalized','Position',[.79 YL .1 .1],'String',...
          '[m]','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      
%--------------------------------------------------------------------------
% entrada 3 Calado a Vante (deg)
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.08 YL .55 .1],'String','Expessura do Casco',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Right');
      
YIn=YIn-Yspacing;
EXPESSURAIn=uicontrol('Style','Edit','Units','normalized','Position',[.64  YIn .15 .11],...
                  'Backgroundcolor',[1 1 1],'Callback', 'EXPESSURA=vsave(EXPESSURAIn);'...
                 ,'String',num2str(EXPESSURA));

uicontrol('Style','text','Units','normalized','Position',[.79 YL .1 .1],'String',...
          '[mm]','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      
%--------------------------------------------------------------------------
set(u,'callback',...
    'LBMAX=vsave(LBMAXIn);BBMAX=vsave(BBMAXIn);EXPESSURA=vsave(EXPESSURAIn);close(figap);');