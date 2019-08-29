% Características do Gerais da Embarcação

global  NOMEMB ARMADOR ENDERECO CEP CPF ESTALEIRO NCASCO LOCONSTRUCAO ANOCON MATCASCO TIPOEMB PORTO CLASSIFICACAO TBL ANAV NINSCRICAO INCHAMADA AB AL

figap=figure('Name','Embarcação','Numbertitle','off','menubar','none');
set(figap,'units','centimeters','resize','off','position',[1.5 2 20 12]);

% Menu Done
u=uimenu(figap,'Label','Done');
   
% Menu Help
name_help='help_apIn.html';
hVPP=uimenu(figap,'label','Help');
 uimenu(hVPP,'label','Help','callback','open(name_help)');

%--------------------------------------------------------------------------
set(figap,'units','normalized');

Yspacing=.065;

% FRAME
uicontrol('style','frame','units','normalized','position',[.01 .2 .975 .77],'backgroundcolor',[.7 .7 .7]);

% Titulo do Frame
uicontrol('style','text','units','normalized','position',[.35 .82 .3 .12],'string',...
          'Carcterística da Embarcação','Backgroundcolor',[.7 .7 .7],'fontweight','bold','fontsize',12,...
          'HorizontalAlignment','Center');
%--------------------------------------------------------------------------
% entrada 1-1 Nome da Embarcacao
YL=.94-2*Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String',...
          'Nome da Embarcação:','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      
YIn=YL+0.005;
NOMEMBIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .25 .03],...
                  'Backgroundcolor',[1 1 1],'Callback', 'NOMEMB=vsavechar(NOMEMBIn);',...
                  'String',num2str(NOMEMB),'HorizontalAlignment','Left');

%--------------------------------------------------------------------------
% entrada 2-1 Armador
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Armador:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ARMADORIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'ARMADOR=vsavechar(ARMADORIn);',...
                 'String',num2str(ARMADOR),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 3-1 Endereco
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Endereço:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ENDERECOIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'ENDERECO=vsavechar(ENDERECOIn);',...
                 'String',num2str(ENDERECO),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 4-1 CEP
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','CEP:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
CEPIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'CEP=vsavechar(CEPIn);',...
                 'String',num2str(CEP),'HorizontalAlignment','Left');

%--------------------------------------------------------------------------
% entrada 5-1 CPF do Armador
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','CPF do Armador:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
CPFIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'CPF=vsavechar(CPFIn);',...
                 'String',num2str(CPF),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 6-1 Estaleiro de Construcao
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Estaleiro de Construção:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ESTALEIROIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'ESTALEIRO=vsavechar(ESTALEIROIn);',...
                 'String',num2str(ESTALEIRO),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 7-1 Numero do Casco
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Número do Casco:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
NCASCOIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'NCASCO=vsavechar(NCASCOIn);',...
                 'String',num2str(NCASCO),'HorizontalAlignment','Left');

%--------------------------------------------------------------------------
% entrada 8-1 Local de Construcao
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Local de Construção:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
LOCONSTRUCAOIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'LOCONSTRUCAO=vsavechar(LOCONSTRUCAOIn);',...
                 'String',num2str(LOCONSTRUCAO),'HorizontalAlignment','Left');         

%--------------------------------------------------------------------------
% entrada 9-1 Ano de Construcao
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Ano de Construção:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ANOCONIn=uicontrol('Style','Edit','Units','normalized','Position',[.22 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'ANOCON=vsavechar(ANOCONIn);',...
                 'String',num2str(ANOCON),'HorizontalAlignment','Left');         

%--------------------------------------------------------------------------
% entrada 10-1 Material do Casco
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.05 YL .2 .03],'String','Material do Casco:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
TESTE1=uicontrol(figap,'Style','popupmenu',...
                'String',{'Aço','Madeira','Alumínio',''},...
                'Position',[167 100 70 20],'value',4,...
                'Callback','if(get(TESTE1,''Value'')==1), MATCASCO = ''Aço''; end, if(get(TESTE1,''Value'')==2), MATCASCO = ''Madeira''; end, if(get(TESTE1,''Value'')==3), MATCASCO = ''Alumínio''; end,');
             
%--------------------------------------------------------------------------

Yspacing=.065;

%--------------------------------------------------------------------------
% entrada 1-2 Tipo de Embarcacao
YL=.94-2*Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String',...
          'Tipo de Embarcação:','Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      
YIn=YL+0.005;
TIPOEMBIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .25 .03],...
                  'Backgroundcolor',[1 1 1],'Callback', 'TIPOEMB=vsavechar(TIPOEMBIn);',...
                  'String',num2str(TIPOEMB),'HorizontalAlignment','Left');

%--------------------------------------------------------------------------
% entrada 2-2 Porto de Inscrição
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Porto de Inscrição:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
PORTOIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'PORTO=vsavechar(PORTOIn);',...
                 'String',num2str(PORTO),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 3-2 Classificacao
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Classificação:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
CLASSIFICACAOIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'CLASSIFICACAO=vsavechar(CLASSIFICACAOIn);',...
                 'String',num2str(CLASSIFICACAO),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 4-2 tipo de BL
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Tipo BL:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
TBLIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'TBL=vsavechar(TBLIn);',...
                 'String',num2str(TBL),'HorizontalAlignment','Left');

%--------------------------------------------------------------------------
% entrada 5-2 Área de Navegação
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Área de Navegação:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
TESTE2=uicontrol(figap,'Style','popupmenu',...
                'String',{'Área 1 - Interior','Área 2 - Interior','Área 3 - Mar Aberto',''},...
                'Position',[546 252 120 20],'value',4,...
                'Callback','if(get(TESTE2,''Value'')==1), ANAV = ''Área 1 - Interior''; end, if(get(TESTE2,''Value'')==2), ANAV = ''Área 2 - Interior''; end, if(get(TESTE2,''Value'')==3), ANAV = ''Área 3 - Mar Aberto''; end,');

%--------------------------------------------------------------------------
% entrada 6-2 Número de Inscrição
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Número de Inscrição:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
NINSCRICAOIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'NINSCRICAO=vsavechar(NINSCRICAOIn);',...
                 'String',num2str(NINSCRICAO),'HorizontalAlignment','Left');
             
%--------------------------------------------------------------------------
% entrada 7-2 Indicativo de Chamada
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Indicativo de chamada:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
INCHAMADAIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .25 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'INCHAMADA=vsavechar(INCHAMADAIn);',...
                 'String',num2str(INCHAMADA),'HorizontalAlignment','Left');
   
%--------------------------------------------------------------------------
% entrada 9-2 Arqueacao Bruta
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Arqueação Bruta:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ABIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'AB=vsavechar(ABIn);',...
                 'String',num2str(AB),'HorizontalAlignment','Left');         

%--------------------------------------------------------------------------
% entrada 10-2 Arqueação Liquida
YL=YL-Yspacing;
uicontrol('Style','text','Units','normalized','Position',[.55 YL .2 .03],'String','Arqueação Líquida:',...
          'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');

YIn=YIn-Yspacing;
ALIn=uicontrol('Style','Edit','Units','normalized','Position',[.72 YIn .1 .03],...
                 'Backgroundcolor',[1 1 1],'Callback', 'AL=vsavechar(ALIn);',...
                 'String',num2str(AL),'HorizontalAlignment','Left');         
             
%--------------------------------------------------------------------------
      

set(u,'callback',...
    'NOMEMB=vsavechar(NOMEMBIn);ARMADOR=vsavechar(ARMADORIn);ENDERECO=vsavechar(ENDERECOIn);CEP=vsavechar(CEPIn);CPF=vsavechar(CPFIn);NCASCO=vsavechar(NCASCOIn);LOCONSTRUCAO=vsavechar(LOCONSTRUCAOIn);ANOCON=vsavechar(ANOCONIn);TIPOEMB=vsavechar(TIPOEMBIn);PORTO=vsavechar(PORTOIn);CLASSIFICACAO=vsavechar(CLASSIFICACAOIn);TBL=vsavechar(TBLIn);NINSCRICAO=vsavechar(NINSCRICAOIn);INCHAMADA=vsavechar(INCHAMADAIn);AB=vsavechar(ABIn);AL=vsavechar(ALIn);close(figap);')