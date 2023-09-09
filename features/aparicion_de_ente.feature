Feature: Sale una entidad de un spawn

  Scenario Outline: Aparece un ente del spawn
    Given que el usuario esta en el modo de juego de <modo>
    And el usuario ya configuro los parametros iniciales con <parametros>
    And el spawn esta en la posicion <celdaI>
    When el usuario da inicio al juego
    Then en la posicion <celdaF> aparece la primera bacteria
    
    Examples:
      |modo         |celdaI|celdaF|parametros   |
      |bacterias    |(1,1) |(2,2) |((1,1), 2, 3)|
      |antibioticos |(1,1) |(2,2) |((1,1), 2, 3)|
      |bacteriofagos|(1,1) |(2,2) |((1,1), 2, 3)|






# casos inecesarios:

  # Scenario: Aparece del spawn una antibioticos
  #   Given que el usuario ingreso al modo de juego de antibioticos
  #   Y que el usuario ya configuro los parametros iniciales
  #   Y que el spawn esta en la posicion (1,1)
  #   When el usuario da inicio al juego
  #   Then en la posicion (1,2) aparece el primer antibiotico
  #             |y        |1a       |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |

  # Scenario: Aparece del spawn una bacteriofagos
  #   Given que el usuario ingreso al modo de juego de bacteriofagos
  #   Y que el usuario ya configuro los parametros iniciales
  #   Y que el spawn esta en la posicion (1,1)
  #   When el usuario da inicio al juego
  #   Then en la posicion (2,1) aparece el primer bacteriofago
  #             |z        |         |         |         |         |         |
  #             |1v       |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |