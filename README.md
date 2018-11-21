# Descrição do Geral

Fulaninho é um rapaz muito aventureiro, que nas férias viaja pelo mundo em busca de lugares afastados e
com bonitas vistas. Na sua viagem atual, Fulaninho está andando por uma escura floresta quando se depara
com um perigoso desfiladeiro. Do outro lado do desfiladeiro ele sabe que existe um acampamento onde
poderá descansar durante a noite para continuar suas aventuras no dia seguinte. Para chegar até o
acampamento, ele terá que utilizar pontes que estão suspensas sobre o desfiladeiro. As pontes foram
construídas interligando altos pilares cravados no fundo do desfiladeiro.
O piso das pontes é feita de tábuas de tamanhos iguais. Mas as pontes são velhas, e algumas tábuas caíram.
Felizmente, todas as tábuas que sobraram estão em perfeitas condições, ou seja, não existe o perigo de
Fulaninho pisar em uma delas e a tábua cair. Além disso, em nenhuma das pontes duas tábuas consecutivas
caíram, de forma que os buracos deixados pelas tábuas que caíram podem ser pulados com segurança.
No local onde Fulaninho se encontra existe uma placa mostrando as ligações entre as pontes e também
quantas tábuas estão faltando em cada uma das pontes. Pedrinho está cansado e não há muita visibilidade
durante a noite. Ele precisa, portanto, tomar muito cuidado para não cair em algum dos buracos.
Fulaninho possui um laptop na mochila, mas só o usa para comunicar-se com os amigos. Ele liga sua internet
via satélite, encontra você on-line, e pede sua ajuda.

Tarefa

Sua tarefa é escrever um programa que receba as informações sobre as pontes (as ligações entre elas e a
quantidade de tábuas faltando em cada uma) e calcule qual é o menor número de buracos que Fulaninho
precisa pular para chegar ao outro lado do desfiladeiro.
Entrada
A entrada deve ser lido do dispositivo de entrada padrão (normalmente o teclado).
A primeira linha da entrada contém dois número inteiros N e M (1 ≤ N ≤ 50, 2 ≤ M ≤ 100) representando o
número de pilares no desfiladeiro e o número de pontes, respectivamente. Cada uma das M linhas seguintes
contém 3 inteiros S, T, B (0 ≤ S ≤ N + 1, 0 ≤ T ≤ N + 1 e 0 ≤ B ≤ 50), indicando que existe uma ponte
ligando os pilares S e T , e que possui B buracos. Não existe linha representando ponte com S = T . O valor
de pilar 0 representa a borda do desfiladeiro onde Pedrinho está, e o valor de pilar N + 1 representa a borda
do desfiladeiro onde está o acampamento. Não existem duas pontes distintas ligando o mesmo par de locais
(pilares ou bordas do desfiladeiro).

Saída

Seu programa deve imprimir, na saída padrão, um número inteiro representando a menor quantidade de
buracos que Pedrinho terá que pular para conseguir chegar ao acampamento.
