global ENGE NCREA TEL

figap=figure('Name','Dados do Engenheiro Responsável','Numbertitle','off','menubar','none');
set(figap,'units','centimeters','resize','off','position',[8 4 12 3]);

% Menu Done
u=uimenu(figap,'Label','Done');

%--------------------------------------------------------------------------
set(figap,'units','normalized');

Yspacing=.08;

% FRAME
uicontrol('style','frame','units','normalized','position',[.01 .2 .975 .77],'backgroundcolor',[.7 .7 .7]);

% Titulo do Frame
uicontrol('style','text','units','normalized','position',[.1 .70 .8 .2],'string',...
          'Dados Responsável Técnico','Backgroundcolor',[.7 .7 .7],'fontweight','bold','fontsize',12,...
          'HorizontalAlignment','Center');

Yspacing=.17;      
      
      
%--------------------------------------------------------------------------
% entrada 1 Engenheiro Naval Responsável pelo Levantamento
YL=.7-2*Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .4 .2],'String','Responsável Técnico:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YL+0.005;

YIn=YIn-Yspacing;      
TESTE = uicontrol(figap,'Style','popupmenu',...
                'String',{'Felipe Ferrari de Oliveira',' '},...
                'Position',[150 50 200 20],'value',2,...
                'Callback','if(get(TESTE,''Value'')==1), ENGE = ''Eng. Naval Felipe Ferrari de Oliveira''; NCREA = ''5069723230 SP''; TEL = ''(92)99351-3041''; end,');
            
                
 set(u,'callback',...
    'close(figap);');
