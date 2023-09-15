# language: es

Característica: Movimientos de una entidad                                                                          
#1
Esquema del escenario: Un ente se mueve de posicion a un casillero contiguo              
    Dado que el estado del juego tiene un <ente> en <x>
    Y tiene 8 posibilidades de movimiento <a>, <b>, <c>, <d>, <e>, <f>, <g> y <h>
    Cuando se mueve a la celda <d>
    Entonces el tablero deberia albergar un <ente> en <d>

    Ejemplos:      
      |ente         |a    |b    |c    |d    |e    |f    |g    |h    |x    |
      |bacterias    |(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|
      |antibioticos |(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|
      |bacteriofagos|(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|

#2
Esquema del escenario: Un ente se mueve de algun borde a un casillero valido
    Dado que hay 1 <ente> en la posicion <x>
    Y tiene 5 posibilidades de movimiento <a>, <b>, <c>, <d> y <e>
    Cuando se mueva a algun vecino, se moverá a una posicion valida, en este caso <d>
    Entonces su nueva posicion será <d>, con lo cual permanecera en los limites del tablero
# en caso de los bateriofagos, usaremos poder de infeccion dentro del test
    Ejemplos:
      |ente         |modo         |x    |a    |b    |c    |d    |e    |pwr|res|
      |bacteria     |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|   |   |
      |antibiotico  |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|   |   |
      |bacteriofago |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|3  |2  |

#3
Esquema del escenario: Un ente se mueve de una esquina a un casillero valido
    Dado que hay 1 <ente> en la posicion <a>
    Y tiene 3 posibilidades de movimiento <b>, <c> y <d>
    Cuando se mueva a un casillero aleatorio, se moverá a una posicion valida, en este caso <d>
    Entonces su nueva posicion será <d>, permaneciendo asi en los limites del tablero

    Ejemplos:      
      |ente         |a      |b      |c      |d      |
      |bacterias    |(1,50) |(2,49) |(1,49) |(2,50) |
      |bacterias    |(50,50)|(50,49)|(49,49)|(49,50)|
      |bacterias    |(50,1) |(50,2) |(49,2) |(49,1) |
      |bacterias    |(1,1)  |(1,2)  |(2,2)  |(2,1)  |
      |antibioticos |(1,50) |(2,49) |(1,49) |(2,50) |
      |antibioticos |(50,50)|(50,49)|(49,49)|(49,50)|
      |antibioticos |(50,1) |(50,2) |(49,2) |(49,1) |
      |antibioticos |(1,1)  |(1,2)  |(2,2)  |(2,1)  |
      |bacteriofagos|(1,50) |(2,49) |(1,49) |(2,50) |
      |bacteriofagos|(50,50)|(50,49)|(49,49)|(49,50)|
      |bacteriofagos|(50,1) |(50,2) |(49,2) |(49,1) |
      |bacteriofagos|(1,1)  |(1,2)  |(2,2)  |(2,1)  |

#4
Esquema del escenario: Las entidades no interactuan entre si
    Dado que hay 1 <ente> en la celda <a>
    Y hay 1 <ente> en la celda <b>
    Y hay 1 <ente> en la celda <c>
    Cuando se mueven a la celdad <d>
    Entonces hay tres <ente>s en la celda <d>

    Ejemplos:
      |ente         |a    |b    |c    |d    |
      |bacteria     |(3,1)|(3,3)|(4,2)|(3,2)|
      |antibiotico  |(3,1)|(3,3)|(4,2)|(3,2)|
      |bacteriofago |(3,1)|(3,3)|(4,2)|(3,2)|
