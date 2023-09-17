# language: es

Característica: Se ubican los spawns de las entidades

Esquema del Escenario: Se ubica un spawn
    Dado que el usuario ingreso al modo de juego de <modo>
    Cuando el usuario configura los parametros iniciales para <ente> con <parametros> en un tablero de 6x6
    Y el usuario da inicio al juego
    Entonces en la celda <celda> se encontrara el spawn de <ente>
    
    Ejemplos:
      |ente         |modo         |celda|parametros   |
      |bacterias    |antibioticos |(1,1)|((1,1), 2, 3)|
      |antibioticos |antibioticos |(1,1)|((1,1), 2, 3)|
      |bacteriofagos|bacteriofagos|(1,1)|((1,1), 2, 3)|
   
