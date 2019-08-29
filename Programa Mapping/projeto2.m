clc 
close all 
clear all

global  ORIGEM DESTINO COMODITE DCARGA CARREGAMENTO CALADO PRAZO
global  NODE DIST
global  NOMEMB ARMADOR ENDERECO CEP ESTALEIRO NCASCO LOCONSTRUCAO ANOCON MATCASCO TIPOEMB PORTO CLASSIFICACAO TBL ANAV NINSCRICAO INCHAMADA AB AL
global  LBMAX BBMAX EXPESSURA
global  ENGE NCREA TEL
global  LB BB HB


% Variáveis de Volume

% global  Vpas
% global  VINOME VINOMEI VINOMEII VINOMEIII VINOMEIV VINOMEV VINOMEVI VINOMEVII VINOMEVIII VINOMEIIX VINOMEX
% global  VI VII VIII VIIII VIIV VIV VIVI VIVII VIVIII VIIX VIX
% global  VENOME VENOMEI VENOMEII VENOMEIII VENOMEIV VENOMEV VENOMEVI VENOMEVII VENOMEVIII VENOMEIX VENOMEX
% global  VE VEI VEII VEIII VEIV VEV VEVI VEVII VEVIII VEIX VEX
% global  VCNOME VCNOMEI VCNOMEII VCNOMEIII VCNOMEIV VCNOMEV VCNOMEVI VCNOMEVII VCNOMEVIII VCNOMEIX VCNOMEX
% global  VC VCI VCII VCIII VCIV VCV VCVI VCVII VCVIII VCIX VCX

LB = 50;
BB = 4;
HB = 1;

figprojeto=figure('Name',' Aveiro Projeto ','Numbertitle','off','Units','normalized',...
    'menubar','none','resize','off','color',[.7 .7 .7],'Position',[0 .07 1 .85]);

% Menu File 
f=uimenu(figprojeto,'label','Arquivo');
 uimenu(f,'label','Novo','callback','cleaner;tala=0;file_name=''0'';');
 uimenu(f,'label','Importar Dados','callback','loader(''LOAD'')');
 uimenu(f,'label','Salvar como...','callback','saver');
 uimenu(f,'label','Fechar Projeto','callback','close all;clear all;clc','accelerator','Q','separator','on');
 
 % Menu Inputs
inpt=uimenu(figprojeto,'label','Dados Gerais');
 uimenu(inpt,'label','Característica da Embarcação','callback','gerais');
 uimenu(inpt,'label','Restrições do Estaleiro','callback','casco');
 uimenu(inpt,'label','Engenheiro','callback','engenheiro');
  
  % Menu Button
 uicontrol('Style', 'pushbutton', 'String', 'Calcular','Units','normalized',...
        'FontSize',16,'Position', [.60 .11 .1 .05],'callback','rotinav2'); 
 
 uicontrol('Style', 'pushbutton', 'String', 'Gerar Relatório','Units','normalized',...
        'FontSize',16,'Position', [.75 .11 .15 .05],'callback','rotinav2');

%--------------------------------------------------------------------------
% Imagem de entrada

map; %Colocar o mapa 
    
%--------------------------------------------------------------------------    
  % Insert Entry
uicontrol('Style','text','Units','normalized','Position',[.18 .1 .15 .1],'String','Cidade de Origem:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
uicontrol('Style','text','Units','normalized','Position',[.18 .05 .15 .1],'String','Cidade de Destino:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
uicontrol('Style','text','Units','normalized','Position',[.18 .0 .15 .1],'String','Tipo de Comodite:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      ORIGEM = uicontrol('Style','popupmenu',...
          'Units','normalized','Position',[.29 .1 .07 .1],...
          'String',NameCity);
      DESTINO = uicontrol('Style','popupmenu',...
          'Units','normalized','Position',[.29 .05 .07 .1],...
          'String',NameCity);
      COMODITE = uicontrol('Style','popupmenu',...
          'Units','normalized','Position',[.29 .0 .07 .1],...
          'String',{'','Soja (Grão)','Minério de Ferro','Milho (Grão)','Petróleo','Areia'},...
          'Callback','if(get(COMODITE,''Value'')==2), DCARGA = 0.75;  end, if(get(COMODITE,''Value'')==3), DCARGA = 0.75;  end,  if(get(COMODITE,''Value'')==4), DCARGA = 0.9;  end, if(get(COMODITE,''Value'')==5), DCARGA = 1.8;  end,');

uicontrol('Style','text','Units','normalized','Position',[.38 .1 .15 .1],'String','Peso da Carga:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      CARREGAMENTOIn=uicontrol('Style','Edit','Units','normalized','Position',[.48 .17 .05 .03],...
                  'Backgroundcolor',[1 1 1],'Callback', 'CARREGAMENTO=vsave(CARREGAMENTOIn);',...
                  'String',num2str(CARREGAMENTO));              
uicontrol('Style','text','Units','normalized','Position',[.535 .1 .04 .1],'String','t',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      
      
 uicontrol('Style','text','Units','normalized','Position',[.38 .05 .15 .1],'String','Calado do Porto:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      CALADOIn=uicontrol('Style','Edit','Units','normalized','Position',[.48 .12 .05 .03],...
                  'Backgroundcolor',[1 1 1],'Callback', 'CALADO=vsave(CALADOIn);',...
                  'String',num2str(CALADO));              
uicontrol('Style','text','Units','normalized','Position',[.535 .05 .04 .1],'String','m',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
  
      
 uicontrol('Style','text','Units','normalized','Position',[.435 .0 .15 .1],'String','Prazo:',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');
      PRAZOIn=uicontrol('Style','Edit','Units','normalized','Position',[.48 .07 .05 .03],...
                  'Backgroundcolor',[1 1 1],'Callback', 'PRAZO=vsave(PRAZOIn);',...
                  'String',num2str(PRAZO));              
uicontrol('Style','text','Units','normalized','Position',[.535 .0 .04 .1],'String','dias',...
          'FontSize',12,'Backgroundcolor',[.7 .7 .7],'HorizontalAlignment','Left');