# language: es

Característica: Se inicia el juego

  Esquema del escenario: Se configuran los parametros iniciales
    Dado que el usuario ingreso al modo de juego de <modo>
    Cuando el usuario configura los parametros iniciales con <parametros>
    Entonces el tablero resultante tendra <resultante>

    Ejemplos:
      |modo         |parametros   |resultante   |
      |antibioticos |((1,1), 2, 3)|((1,1), 2, 3)|
      |bacteriofagos|((1,5), 4, 1)|((1,5), 4, 1)|
      |bacteriofagos|((1,5), 1, 5)|((1,5), 1, 5)|

