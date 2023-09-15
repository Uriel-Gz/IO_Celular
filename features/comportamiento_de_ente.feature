# language: es

Característica: Comportamiento de las entidades
#10
  Escenario: Una bacteria normal o fuerte se reproduce
    Dado que hay una bacteria <type-s> en la posicion <pos>
    Y ya se movio 3 veces
    Cuando la bacteria <type-s> se mueve a la celda <end>
    Entonces el tablero deberia quedar con bacterias <type-p> en <end> y en <end2>

    Ejemplos:
      |pos   |end   |end2  |type-s | type-p |
      |(1,2) |(1,3) |(2,2) |normal |normales|
      |(6,9) |(6,10)|(5,11)|normal |normales|
      |(30,7)|(29,7)|(29,6)|normal |normales|
      |(1,2) |(1,3) |(2,2) |fuerte |fuertes |
      |(6,9) |(6,10)|(5,11)|fuerte |fuertes |
      |(30,7)|(29,7)|(29,6)|fuerte |fuertes |

#11
  Escenario: La bacteria normal se reproduce con una mutación y produce una bacteria fuerte
     Dado que hay una bacteria en la posicion <pos>
    Y ya se movio 3 veces
    Cuando las bacteria se mueve a la celda <end>
    Y por 1% de probabilidad sufre una mutacion
    Entonces el tablero deberia quedar con bacterias en <end> y en <end2>

    Ejemplos:
      |pos   |end   |end2  |
      |(3,4) |(4,4) |(4,5) |
      |(23,2)|(24,3)|(25,4)|
      |(30,7)|(29,7)|(29,6)|

#12
#13
Escenario: Una bacteria debiles no se reproduce
    Dado que hay una bacteria debilitada en la posicion <pos>
    Y ya se movio 3 veces
    Cuando la bacteria debilitada se mueva a la celda <end>
    Entonces el tablero deberia quedar con una bacteria debilitada en <end>
    Y las posiciones adyacetes deberian estar libres

    Ejemplos:
      |pos   |end   |
      |(1,2) |(1,3) |
      |(6,9) |(6,10)|
      |(30,7)|(29,7)|
      |(8,48)|(9,49)|
      |(29,1)|(29,2)|


#14 Ver escritura y ver que pasa con las variantes de tiempo para permane
Escenario: Se produce sobrepoblacion de bacterias y sobrevive la más apta
    Dado que hay una bacteria <type-s> en la posicion <pos>
    Y 3 bacterias <type-p> en  <pos1>, <pos2> y <pos3>
    Cuando todas la bacterias se mueven a la celda <end>
    Entonces solo deberia permanecer la bacteria <type-s>

    Ejemplos:
      |pos   |pos1  |pos2  |pos3  |end   |type-s | type-p |
      |(1,2) |(1,4) |(3,2) |(3,4) |(2,3) |fuerte |normales|
      |(6,9) |(6,11)|(8,9) |(8,11)|(7,10)|fuerte |debiles |
      |(30,7)|(30,9)|(32,7)|(32,9)|(31,8)|normal |debiles |
      |(21,7)|(21,9)|(23,7)|(23,9)|(22,8)|normal |normales|
      |(11,7)|(11,9)|(13,7)|(13,9)|(12,8)|debil  |debiles |


#15
#16
#17
  Escenario: Bacterias se vuelven fuertes despues de un tiempo
    Dado que hay una bacteria debil en la posicion <pos>
    Y la bacteria ya se movio 5 veces
    Cuando la bacteria debil se mueve a la celda <end>
    Entonces el tablero deberia contener una bacteria fuerte en <end>

    Ejemplos:
      |pos   |end   |
      |(5,0) |(5,1) |
      |(1,2) |(2,3) |
      |(6,9) |(7,10)|
      |(30,7)|(31,8)|
      |(21,7)|(22,8)|
      |(11,7)|(12,8)|




#  Comportamiento de las bacterias en modo bacteriofago
#18
  Escenario: Varia la cualidad de infección de en los entes
    Dado que hay <entity> en la posicion <pos>
    Y un <cuality> de infeccion <grade-c>
    Cuando se mueve a la celda <end>
    Entonces el tablero deberia contener <entity> en <end>
    Y deberia tener un <cuality> de infeccion de <grade-p> 

    Ejemplos:
      |pos   |end   |grade-c|grade-p|entity                |cuality|
      |(5,0) |(5,1) |1      |2      |una bacteria infectada|grado  |
      |(1,2) |(2,3) |2      |3      |una bacteria infectada|grado  |
      |(5,0) |(5,1) |4      |3      |un bacteriofago       |poder  |
      |(1,2) |(2,3) |3      |2      |un bacteriofago       |poder  |
      |(9,33)|(9,34)|2      |1      |un bacteriofago       |poder  |

# ??????
# 21
# Escenario: Disminucion de poder de bacteriofago                               
#     Dado que el estado del juego es
#     Y el bacteriofago tiene poder de infeccion 3
#     Cuando el bacteriofago se mueva a la celda (3,3)  
#     Y el bacteriofago deberia tener poder de infeccion 2
# #


#19
  Escenario: Una bacteria infectada explota generando bacteriofagos
    Dado que hay una bacteria infectada en la posicion <pos>
    Y la bacteria tiene grado de infeccion <grade-c>
    Cuando la bacteria se mueve a la celda <end>
    Entonces el tablero deberia contener 4 bacteriofagos en <f1>, <f2>, <f3> y <f4> 
    Y los cuatro bacteriofagos deberian tener poder de infeccion <garde-p>
 
    Ejemplos:
      |pos    |end    |grade-c|grade-p|f1     |f2     |f3     |f4     |
      |(5,0)  |(5,1)  |3      |4      |(4,0)  |(4,2)  |(6,0)  |(6,2)  |
      |(12,10)|(12,11)|3      |4      |(11,10)|(11,12)|(13,10)|(13,12)|
      |(27,3) |(27,4) |3      |4      |(26,3) |(26,5) |(28,3) |(28,5) |



#  Comportamiento de bacteriofagos
#20
Escenario: Un bacteriofago desaparece tras cierto tiempo
    Dado que hay un bacteriofago en la posicion <pos>
    Y el bacteriofago tiene poder de infeccion 1
    Cuando el bacteriofago se mueva a la celda <end>  
    Entonces el bacteriofago de saparece del tablero, dejando la celda <end> vacia

    Ejemplos:
      |pos   |end   |
      |(5,0) |(5,1) |
      |(1,2) |(2,3) |
      |(6,9) |(7,10)|
      |(30,7)|(31,8)|
      |(21,7)|(22,8)|
      |(11,7)|(12,8)|

