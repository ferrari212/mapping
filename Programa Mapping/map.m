global NODE DIST

% Test 1: Creation of brazil land with its rivers
ax = worldmap('world');
load coast;
usamap([-9 -.9], [-67 -46]);

% Coloca topografia no mapa
% geoshow(topo, topolegend, 'DisplayType', 'texturemap');
% demcmap(topo) 

%Colocando os continentes
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', [.5 .7 .5])

%Colocando Lagos
% lakes = shaperead('worldlakes', 'UseGeoCoords', true);
% geoshow(lakes, 'FaceColor', 'blue')

% Colocando Rios
rivers = shaperead('worldrivers', 'UseGeoCoords', true);
rivers(118)=[];
rivers(112)=[];
rivers(111)=[];
[rivers(126).Lat,rivers(126).Lon] = textread('rio_solimoes.txt','%f %f');
rivers(126).Name = 'Solimoes';
[rivers(127).Lat,rivers(127).Lon] = textread('rio_amazonas.txt','%f %f');
rivers(127).Name = 'Amazonas';
[rivers(129).Lat,rivers(129).Lon] = textread('rio_madeira.txt','%f %f');
rivers(129).Name = 'Rio Madeira';
[rivers(130).Lat,rivers(130).Lon] = textread('rio_tapajos.txt','%f %f');
rivers(130).Name = 'Rio Tapajós';
geoshow(rivers, 'Color', 'blue');
% plotm (rivers(111).Lat,rivers(111).Lon,'red');
% clear rivers(11)

%Colocando Cidades
cities = shaperead('worldcities', 'UseGeoCoords', true);
geoshow(cities, 'Marker', '*', 'Color', 'red')
textm(extractfield(cities,'Lat'),extractfield(cities,'Lon'),extractfield(cities,'Name'),...
    'FontSize',12,'HorizontalAlignment','left','VerticalAlignment','bottom');
[NODE,DIST,LatCity,LonCity,NameCity] = textread('cidades.txt','%f %f %f %f %s','delimiter',';');
% geoshow(LatCity,LonCity, 'Marker', 'r*', 'Color', 'red')
plotm(LatCity,LonCity,'.', 'Color', 'red')
textm(LatCity,LonCity,NameCity,...
    'FontSize',8,'HorizontalAlignment','left','VerticalAlignment','bottom');
NODE (21) = 1;
DIST (21) = 0;
NameCity(21) = {'Manaus'};

%Colocando Cidades
oceanColor = [.5 .7 .9];
setm(ax, 'FFaceColor', oceanColor);
northarrow('Latitude', -6.2, 'Longitude', -48.2);

%Colocando os Rulers
xLoc = 0.80e+06;
yLoc = -750000;
scaleruler('Units', 'km', 'RulerStyle', 'patches',  ...
    'XLoc', xLoc, 'YLoc', yLoc, 'MajorTick',0:100:300, ...
    'MinorTick',0:10:50,'TickDir', 'down');

%Colocando os Mapa secundario
h1 = axes('pos',[.55 .23 .25 .38],'Visible', 'on');
bx = worldmap('south america');
load coast;
geoshow(bx, land, 'FaceColor', [.5 .7 .5])
geoshow(rivers, 'Color', 'blue')
setm(bx, 'FFaceColor', oceanColor);
plotm([-9 -9 -.9 -.9 -9], [-67 -45 -45 -67 -67], ...
    'Color', 'red', 'LineWidth', 2)

plabel off;
mlabel off;


  % Texto
uicontrol('style','text','fontsize',12,'string','Prog. v2 - projeto v1.1',...
    'units','normalized','position',[.3 .02 1 .05],'background',[.7 .7 .7]); 