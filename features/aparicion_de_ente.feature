# language: es

Característica: Sale una entidad de un spawn

  Esquema del escenario: Aparece un ente del spawn
    Dado que el usuario esta en el modo de juego de <modo>
    Y el usuario ya configuro los parametros iniciales con <parametros>
    Y el spawn esta en la posicion <celdaI>
    Cuando el usuario da inicio al juego
    Entonces en la posicion <celdaF> aparece la primera bacteria
    
    Ejemplos:
      |modo         |celdaI|celdaF|parametros   |
      |antibioticos |(1,1) |(2,2) |((1,1), 2, 3)|
      |antibioticos |(1,1) |(2,2) |((1,1), 2, 3)|
      |bacteriofagos|(1,1) |(2,2) |((1,1), 2, 3)|

