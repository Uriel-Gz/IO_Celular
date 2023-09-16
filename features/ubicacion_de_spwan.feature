

Feature: Se ubican los spawns de las entidades

  Scenario Outline: Se ubica un spawn
    Given que el usuario ingreso al modo de juego de <modo>
    When el usuario configura los parametros iniciales para <ente> con <parametros> en un tablero de 6x6
    And el usuario da inicio al juego
    Then en la celda <celda> se encontrara el spawn de <ente>
    
    Examples:
      |ente         |modo         |celda|parametros   |
      |bacterias    |antibioticos |(1,1)|((1,1), 2, 3)|
      |antibioticos |antibioticos |(1,1)|((1,1), 2, 3)|
      |bacteriofagos|bacteriofagos|(1,1)|((1,1), 2, 3)|
   

# casps inecesarios
   
  # Scenario: Se ubica el spawn de antibioticos
  #   Given que el usuario ingreso al modo de juego de antibioticos
  #   When el usuario configura los parametros iniciales para antibioticos ((1,1), 2, 3) en un tablero de 6x6
  #   Y el usuario da inicio al juego
  #   Then en la celda (1,1) se encontrara el spawn de antibioticos
  #             |y        |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
   
  # Scenario: Se ubica el spawn de bacteriofagos
  #   Given que el usuario ingreso al modo de juego de bacteriofagos
  #   When el usuario configura los parametros iniciales para bacteriofagos ((1,1), 2, 3) en un tablero de 6x6
  #   Y el usuario da inicio al juego
  #   Then en la celda (1,1) se encontrara el spawn de bacteriofagos
  #             |z        |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
  #             |         |         |         |         |         |         |
