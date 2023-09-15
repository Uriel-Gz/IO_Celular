

Feature: Se hubican los spawns de las entidades

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
   
