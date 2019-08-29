% Função usada para calcular a velocidade da embarcação
%e a distancia percorrida pela carga
%
%node é o vetor com todos os nós 
%origem é o indice da cidade de origem
%destino é o indice da cidade de destino
%distycity é o vetor de distâncias na localização dos rios
%nviagens é o número de viagens a serem realizadas
%tempo é o tempo para o escoamento da carga
%
%nodeorigem é o vetor de duas variaveis com valor do nó e da localização
%do serviço de origem
%nodedestino é o vetor de duas variaveis com valor do nó e da localização
%do serviço de destino
%
%Tamanho rio solimões = 1500km
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


