# language: es

Característica: Colisión de entidades

# Bacterias y antibioticos
#9
Escenario: Los antibioticos desaparecen al tener contacto con cualquier tipo de bacteria
    Dado que hay un antibiotico en <apos>
    Y una bacteria <tipo> en <bpos>
    Cuando ambos de mueven a la posicion <crash>
    Entonces el antibiotico desaparece

    Ejemplos:
    |apos  |bpos  |tipo  |crash |
    |(2,2) |(2,4) |debil |(2,3) |
    |(1,32)|(2,34)|normal|(1,33)|
    |(22,1)|(23,3)|fuerte|(22,2)|

#10
Escenario: Una bacteria que no sea fuerte muere al encontrarse con un antibiótico
    Dado que hay un antibiotico en la celda <apos>
    Y hay bacteria <tipo> en la celda <bpos>
    Cuando el antibiotico se mueve a la celda <crash>
    Y la bacteria se mueve a la celda <crash>
    Entonces el antibiotico desaparece y la bacteria muere

    Ejemplos:
    |apos  |bpos  |tipo  |crash |
    |(3,2) |(3,4) |debil |(3,3) |
    |(1,32)|(2,34)|normal|(1,33)|
  
#11
#12
Escenario: Una bacteria fuerte se debilita al tener contacto con un antibiotico
    Dado que hay un antibiotico en la celda <apos>
    Y hay bacteria fuerte en la celda <bpos>
    Cuando el antibiotico se mueve a la celda <crash>
    Y la bacteria se mueve a la celda <crash>
    Entonces el antibiotico desaparece y queda una bacteria debil

    Ejemplos:
    |apos   |bpos   |crash  |
    |(3,2)  |(3,4)  |(3,3)  |
    |(1,32) |(2,34) |(1,33) |
    |(12,12)|(12,14)|(12,13)|
    |(34,8) |(35,8) |(35,7) |
    |(22,8) |(23,9) |(22,9) |


#13
Escenario: El numero de antibioticos es menor o igual al numero de bacterias en una celda
    Dado que hay una antibiotico en la celda <apos>
    Y hay una bacteria normal en la celda <bpos>
    Y hay una bacteria debil en la celda <bpos>
    Y hay una bacteria fuerte en la celda <bpos>
    Cuando el antibiotico se mueva a la celda <crash>
    Y la bacteria normal se mueva a la celda <crash>
    #podria acortarlo a una linea de bacterias
    Y la bacteria debil se mueva a la celda <crash>
    Y la bacteria fuerte se mueva a la celda <crash>
    Entonces deberia quedar una bacteria debil en la celda <crash>

    Ejemplos:
    |apos   |bpos   |crash  |
    |(3,2)  |(3,4)  |(3,3)  |
    |(1,32) |(2,34) |(1,33) |
    |(12,12)|(12,14)|(12,13)|
    |(34,8) |(35,8) |(35,7) |
    |(22,8) |(23,9) |(22,9) |


#15
Escenario: Las bacterias mueren cuando hay mas antibioticos que bacterias en la misma celda
    Dado que hay un antibiotico en la celda <apos>
    Y hay un antibiotico en la celda <apos2>
    Y hay un antibiotico en la celda <apos3>
    Y hay un antibiotico en la celda <apos4>
    Y hay una bacteria normal en la celda <bpos>
    Y hay una bacteria debil en la celda <bpos2>
    Y hay una bacteria fuerte en la celda <bpos3>
    Cuando los antibioticos se mueven a <crash>
    Y las bacterias se mueven a <crash>
    Entonces la celda <crash> queda vacia por sobredosis

    Ejemplos:
    |apos  |apos2 |apos3 |apos4 |bpos  |bpos2 |bpos3 |crash |
    |(3,1) |(3,3) |(4,2) |(2,2) |(2,3) |(2,3) |(2,1) |(3,2) |
    |(3,10)|(3,12)|(4,11)|(2,11)|(2,10)|(2,12)|(2,12)|(3,11)|
    |(25,7)|(25,9)|(26,8)|(24,8)|(24,7)|(26,9)|(24,7)|(25,8)|


#14
# Escenario: Cruce de antibioticos con bacterias en una celda y no hay bacterias fuertes
#     Dado que hay una antibiotico en la celda (3,3)
#     Y hay una bacteria normal en la celda (3,2)
#     Y hay una bacteria debil en la celda (3,2)
#     Cuando el antibiotico se mueva a la celda (3,2)
#     Entonces la celda (3,2) queda vacia




# Bacterias y bacteriófagos    
#22
Escenario: Una bacteria se cruza con un bacteriófago                            
    Dado que hay una bacteria <type> en la celda <bpos>
    Y un bacteriofago en la celda <bfpos> con poder de infeccion <power> 
    Cuando la bacteria y el bacteriofago se mueven a la posición <crash>
    Entonces el tablero deberia contener una bacteria infectada de grado <grade>

    Ejemplos:
    |bfpos  |bpos   |crash  |power|grade|type  |
    |(3,2)  |(3,4)  |(3,3)  |4    |3    |normal|
    |(1,32) |(2,34) |(1,33) |3    |2    |normal|
    |(12,12)|(12,14)|(12,13)|2    |1    |normal|
    |(34,8) |(35,8) |(35,7) |4    |3    |fuerte|
    |(22,8) |(23,9) |(22,9) |3    |2    |fuerte|
    |(20,1) |(22,1) |(21,1) |2    |1    |fuerte|


#23
Escenario: Una bacteria infectada no le ocurre nada cuando se cruza con un bacteriófago
    Dado que hay una bacteria infectada en la celda <bpos> con grado de infeccion <grade>
    Y un bacteriofago en la celda <bfpos> con poder de infeccion <power> 
    Cuando la bacteria y el bacteriofago se mueven a la celda <crash>
    Entonces en el tablero queda un bacteria infectada con grado <gradeUp>
    Y un bacteriófago con poder de infección <powerLess>

    Ejemplos:
    |bfpos  |bpos   |crash  |power|powerLess|grade|gradeUp|
    |(3,2)  |(3,4)  |(3,3)  |4    |3        |1    |2      |
    |(1,32) |(2,34) |(1,33) |3    |2        |2    |3      |
    |(12,12)|(12,14)|(12,13)|2    |1        |2    |3      |

#24
Escenario: Una bacteria es infectada por dos bacteriófagos                                    
    Dado que hay una bacteria <type> en la celda <bpos>
    Y un bacteriofago en la celda <bfpos> con poder de infeccion <power>
    Y un bacteriofago en la celda <bfpos2> con poder de infeccion <power2>
    Cuando la bacteria y los bacteriofagos se mueven a la posición <crash>
    Entonces el tablero deberia contener una bacteria infectada de grado <grade>

    Ejemplos:
    |bfpos  |bfpos2 |bpos   |crash  |power|power2|grade|type  |
    |(3,2)  |(4,3)  |(3,4)  |(3,3)  |3    |2     |3    |normal|
    |(34,8) |(35,7) |(35,8) |(34,7) |4    |1     |3    |fuerte|
    |(1,32) |(2,34) |(2,33) |(1,33) |2    |2     |2    |normal|
    |(12,12)|(12,14)|(13,13)|(12,13)|1    |2     |1    |fuerte|


#25
Escenario: Sobrepoblación de bacterias se cruzan al mismo tiempo con un bacteriofago                
    Dado que hay una bacteria <type> en la celda <bpos>
    Y hay una bacteria <type> en la celda <bpos2>
    Y hay una bacteria <type> en la celda <bpos3>
    Y hay una bacteria <type> en la celda <bpos4>
    Y un bacteriofago en la celda <bfpos> con poder de infeccion <power>
    Cuando las bacteria y el bacteriofago se mueven a la posición <crash>
    Entonces el tablero deberia contener una bacteria infectada de grado <grade>

    Ejemplos:
    |bfpos  |bpos  |bpos2  |bpos3 |bpos4  |crash  |power|grade|type  |
    |(3,2)  |(2,2) |(4,3)  |(2,4) |(3,4)  |(3,3)  |3    |2    |normal|
    |(19,5) |(18,5)|(20,6) |(18,7)|(19,7) |(19,6) |2    |1    |fuerte|
    |(10,20)|(9,20)|(11,21)|(9,22)|(10,22)|(10,21)|4    |3    |normal|
