# language: es

Característica: Movimientos de una entidad                                                                          
#1
Esquema del escenario: Un ente se mueve de posicion a un casillero contiguo              
    Dado que hay 1 <ente> en la celda <x>
    Y tiene 8 posibilidades de movimiento <a>, <b>, <c>, <d>, <e>, <f>, <g> y <h>
    Cuando se mueve 1 <ente> de la celda <x> a <d> 
    Entonces el tablero tiene 1 <ente> en <d> 
    Y el tablero no tiene <ente>s en <x>

    Ejemplos:      
      |ente         |a    |b    |c    |d    |e    |f    |g    |h    |x    |
      |bacterias    |(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|
      |antibioticos |(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|
      |bacteriofagos|(1,2)|(1,3)|(1,4)|(2,2)|(2,4)|(3,2)|(3,3)|(3,4)|(2,3)|

#2
Esquema del escenario: Un ente se mueve de algun borde a un casillero valido
    Dado que hay 1 <ente> en la celda <x>
    Y tiene 5 posibilidades de movimiento <a>, <b>, <c>, <d> y <e>
    Cuando se mueve 1 <ente> de la celda <x> a <d>
    Entonces el tablero tiene 1 <ente> en <d>
    Y el tablero no tiene <ente>s en <x>

# en caso de los bateriofagos, usaremos poder de infeccion dentro del test
    Ejemplos:
      |ente         |modo         |x    |a    |b    |c    |d    |e    |pwr|res|
      |bacteria     |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|   |   |
      |antibiotico  |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|   |   |
      |bacteriofago |antibioticos |(1,5)|(1,6)|(1,4)|(2,6)|(2,4)|(2,5)|3  |2  |

#3
Esquema del escenario: Un ente se mueve de una esquina a un casillero valido
    Dado que hay 1 <ente> en la celda <a>
    Y tiene 3 posibilidades de movimiento <b>, <c> y <d>
    Cuando se mueve 1 <ente> de la celda <a> a <d>
    Entonces el tablero tiene 1 <ente> en <d>
    Y el tablero no tiene <ente>s en <a>

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
    Y que hay 1 <ente> en la celda <b>
    Y que hay 1 <ente> en la celda <c>
    Cuando se mueve 1 <ente> de la celda <a> a <d>
    Y se mueve 1 <ente> de la celda <b> a <d>
    Y se mueve 1 <ente> de la celda <c> a <d>
    Entonces el tablero tiene 3 <ente>s en <d>

    Ejemplos:
      |ente         |a    |b    |c    |d    |
      |bacteria     |(3,1)|(3,3)|(4,2)|(3,2)|
      |antibiotico  |(3,1)|(3,3)|(4,2)|(3,2)|
      |bacteriofago |(3,1)|(3,3)|(4,2)|(3,2)|
