Dicas de compilação e execução:
===============================

1) Mote <--> Mote
Para o teste "mote x mote", deve-se gerar o "serverAppC" e o "clientAppC".
Tem um arquivo Makefile para cada um: MakefileC e MakefileS (C de cliente e S de servidor)
É só utilizar o comando: make -f MakefileS micaz ....
O sensor default, o ID do server e os AM_IDs estão definidos dentro do arquivo "simpleCS.h". Os valores defaults são o sensor de luminosidade e o server_id 10.
Lembre-se de instalar o server com o id 10.

Então os comandos serão:
$ make -f MakefileS micaz install.10 mib510,/dev/ttyUSB0
$ make -f MakefileC micaz install.2 mib510,/dev/ttyUSB0

Para executar, basta conectar um sensor no mote servidor e ligar os dois motes.
O cliente mostra nos leds os 3 bits mais baixos do valor recebido dividido por 200.
Se o cliente receber um timeout, vai piscar rapidamente o led vermelho.

2) PC <--> Mote
O servidor deverá ser é o mesmo.
O makefile do servidor gera as classes java das mensagens, atenção para utilizar a mesma estrutura de mensagem definida em "simpleCS.h"
O cliente java é o programa jClient.java. Ele envia uma requisição e imprime o valor recebido.

Para compilar o cliente basta digitar: $ javac jClient.java
Para executar o cliente, basta digitar: $ java jClient <client_id> <server_id> <sensor_type>
  onde <client_id> deve ser o ID do cliente java, utilizar valores >= 100
       <server_id> deve ser o ID de um mote servidor ou 0xffff para broadcast.
       <sensor_type> só aceita T para temperatura e P para luminosidade.

O cliente java vai conectar na porta 9002 do localhost, então será necessário disparar um SerialForward.
$ java net.tinyos.sf.SerialForwarder -comm serial@/dev/ttyUSB1:micaz

Para acessar o mote servidor, também será necessário utilizar um mote BaseStation ligado na USB.
Pode-se utilizar o apps/BaseStation. Se for usar mica2, tem que alterar o makefile para incluir a frequência do rádio do mica2.
A aplicação BaseStation está no diretório: /opt/tinyos-2.1.1/apps/BaseStation

Quando alterar algum AM_IDs, tem que recompilar tudo!

Por último, eu tive problemas para ler o sensor de temperatura da MTS310. Achei uma dica na internet para alterar um arquivo interno do componente do sensor (PhotoTempDeviceC.nc). Para não alterar o arquivo da instalação original, eu fiz uma cópia para o diretório do programa. 
 
