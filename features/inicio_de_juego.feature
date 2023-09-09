
  # Antecedentes: El usuario ingresa al juego 

Feature: Se inicia el juego

  Scenario Outline: Se configuran los parametros iniciales
    Given que el usuario ingreso al modo de juego de <modo>
    When el usuario configura los parametros iniciales con <parametros>
    Then el tablero resultante tendra <resultante>

    Examples:
      |modo         |parametros   |resultante   |
      |antibioticos |((1,1), 2, 3)|((1,1), 2, 3)|
      |bacteriofagos|((1,6), 4, 1)|((1,6), 4, 1)|
      |bacteriofagos|((1,6), 1, 5)|((1,6), 1, 5)|


















   

# Feature: Saying Hello

#   Scenario: Run a simple test
#     Given we have flask working
#     When we hit the root path
#     Then we see the Hello World regard