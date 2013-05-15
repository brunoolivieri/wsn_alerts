# Sistemas Distribuidos --- 2012/1
# Lab1: Introducao ao ambiente de programacao nesC/TinyOS
# Codigo Python para usar o simulador TOSSIM

import sys                      #importa o pacote de I/O do Python
from TOSSIM import *            #importa o modulo que implementa o Tossim

t = Tossim([])                  #cria um objeto Tossim (sem argumentos)

m = t.getNode(171)



                #cria um no com ID 1
m.bootAtTime(45654)             #inicia o no 1 apos 45654 ticks do simulador
t.addChannel("alarmGroupAppC", sys.stdout) #associa o canal "BlinkC" aa saida padrao
t.runNextEvent()                #executa o proximo evento (inicia o mote 1)


while (m.isOn()):       #entra no loop de execucao de eventos do simulador
   t.runNextEvent()     #executa o proximo evento
