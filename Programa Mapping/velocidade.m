% Fun��o usada para calcular a velocidade da embarca��o
%e a distancia percorrida pela carga
%
%node � o vetor com todos os n�s 
%origem � o indice da cidade de origem
%destino � o indice da cidade de destino
%distycity � o vetor de dist�ncias na localiza��o dos rios
%nviagens � o n�mero de viagens a serem realizadas
%tempo � o tempo para o escoamento da carga
%
%nodeorigem � o vetor de duas variaveis com valor do n� e da localiza��o
%do servi�o de origem
%nodedestino � o vetor de duas variaveis com valor do n� e da localiza��o
%do servi�o de destino
%
%Tamanho rio solim�es = 1500km
%Tamanho amazonas (entre Santa e Manaus) = 1256km
%Tamanho madeira = 1020km
%Tamanho tocantins = 803km

function v = velocidade(node,origem,destino,distcity,nviagens,tempo)

nodeorigem = [node(origem) distcity(origem)];

if nodeorigem(1) <= node(destino)
    nodedestino = [node(destino) distcity(destino)];
else
    nodeorigem = [node(destino) distcity(destino)];
    nodedestino = [node(origem) distcity(origem)];
end

if nodeorigem(1) == nodedestino(1)
    distancia = abs(nodedestino(2)-nodeorigem(2));

else

if (nodeorigem(1)==1)
    if (nodedestino(1)==2)
        distancia = nodedestino(2)-nodeorigem(2)+1500;
    end
    
    if (nodedestino(1)==3)
        distancia = -nodedestino(2)-nodeorigem(2)+1500+103+1020;
    end

    if (nodedestino(1)==4)
        distancia = -nodedestino(2)-nodeorigem(2)+1500+1256+803;
    end
end

if (nodeorigem(1)==2)
    if (nodedestino(1)==3)
        distancia = nodedestino(2)-nodeorigem(2)+1020-103;
    end
    
    if (nodedestino(1)==3)
        distancia = -nodedestino(2)-nodeorigem(2)+1256+803;
    end
end

if (nodeorigem(1)==3)
    distancia = -nodedestino(2)-nodeorigem(1)+1020+1256-103+803;
end
end

v=0.539*distancia*nviagens/(tempo*24);


