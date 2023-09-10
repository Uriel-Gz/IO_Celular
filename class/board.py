# class board is a implementation of game's board

from bacterium import Type_Bacterium, Bacterium

class Mescolanza:

	def __init__(self):
		self.bacterias = []
		self.cant_antibiotic = 0
		self.virus = []

	def get_bacterias(self):
		return self.bacterias

	def set_bacterias(self, state:Type_Bacterium):
		self.bacterias.append([Bacterium(state)])

	def set_bacterias(self, state:Type_Bacterium, moves:int):
		self.bacterias.append([Bacterium(state, moves)])

	def get_cant_antibiotic(self):
		return self.cant_antibiotic

	def set_cant_antibiotic(self, value):
		self.cant_antibiotic = value

	def get_virus(self):
		return self.virus

	def set_virus(self, value):
		self.virus = value


class Board:

	def	 __init__(self, rows, columns):
		self.board = Mescolanza[rows][columns]
		self.rows = rows
		self.columns = columns
		self.position_spawn_other = (0,0)
		self.position_spawn_bacterium = (0,0)
		self.cantBacterias = 0
		self.cantResistentes = 0
		self.cantNormales = 0
		self.cantInfectadas = 0
		self.cantAntibioticos = 0
		self.cantBacteriofagos = 0

	def get_board(self):
		return self.board

	def set_board(self, value):
		self.board = value

	def get_position_spawn_other(self):
		return self.position_spawn_other

	def set_position_spawn_other(self, value):
		self.position_spawn_other = value

	def get_position_spawn_bacterium(self):
		return self.position_spawn_bacterium

	def set_position_spawn_bacterium(self, value):
		self.position_spawn_bacterium = value

	def get_cantBacterias(self):
		return self.cantBacterias

	def set_cantBacterias(self, value):
		self.cantBacterias = value

	def get_cantResistentes(self):
		return self.cantResistentes

	def set_cantResistentes(self, value):
		self.cantResistentes = value

	def get_cantNormales(self):
		return self.cantNormales

	def set_cantNormales(self, value):
		self.cantNormales = value

	def get_cantInfectadas(self):
		return self.cantInfectadas

	def set_cantInfectadas(self, value):
		self.cantInfectadas = value

	def get_cantAntibioticos(self):
		return self.cantAntibioticos

	def set_cantAntibioticos(self, value):
		self.cantAntibioticos = value

	def get_cantBacteriofagos(self):
		return self.cantBacteriofagos

	def set_cantBacteriofagos(self, value):
		self.cantBacteriofagos = value

	def set_Bacteria(self, xCelda:int, yCelda:int, estado:Type_Bacterium, movimientos:int):
		self.board[xCelda][yCelda].set_bacterias(estado)

	def set_Antibiotico(self, xCelda:int, yCelda:int, cantidad:int):
		self.board[xCelda][yCelda].set_cant_antibiotic(cantidad)

	def add_Bacteria(self, xCelda:int, yCelda:int, state:Type_Bacterium, moves:int):
		self.board[xCelda][yCelda].set_bacterias(state, moves)
		self.cantBacterias += 1

	def add_Antibiotico(self, xCelda:int, yCelda:int, cant:int):
		self.board[xCelda][yCelda].cant_antibiotic += 1
		self.cantAntibioticos += 1
  
	def set_Bacteriofago(self, xCelda:int, yCelda:int, poderInfeccion:int):
		self.board[xCelda][yCelda].set_virus(poderInfeccion)

	def actualizar_tablero(self):
		new_board = Mescolanza[self.rows][self.columns]

		for x in range(self.rows):
			for y in range(self.columns):
				self.actualizar_celda(x,y)
				#metodo que pasa todo lo que queda en una celda, a las celdas vecinas en un tablero nuevo
				self.mover_a_vecinos(x,y, new_board)

		self.board = new_board
	
		
	def actualizar_celda(self, x, y):

		#si existen bacterias y antibioticos en la misma celda, aplico las reglas de cruzamiento 
		if self.board[x][y].cant_antibiotic > 0 and self.board[x][y].bacterias.__len__ > 0:

			if self.board[x][y].cant_antibiotic > self.board[x][y].bacterias.__len__ :
				self.high_dose_antibiotic(x,y)
			else:
				self.low_dose_antibiotic(x,y)
			
		#aplico regla de sobrepoblación
		if self.board[x][y].bacterias.__len__ >= 4:
			self.overpopulation(x,y)

		#una vez aplicadas todas las reglas de cruzamiento, le resto un movimiento a todo lo que quedo
		self.count_move(x,y)


	#para que este metodo quede bien implementado hace falta una funcion
	#que devuelva una posicion vecina random
	def mover_a_vecinos(self, x, y, new_board):
		new_x = 0
		new_y = 0

		for bacteria in self.board[x][y].bacterias:
			#obtener una posicion vecina random
			#obtengo los valores del 'x' e 'y' vecino
			new_board[new_x][new_y].bacterias.append(bacteria)

		for i in range(self.board[x][y].cant_antibiotic):
			#obtengo nuevas coordenadas random
			new_board[new_x][new_y].cant_antibiotic += 1

	def high_dose_antibiotic(self, x, y):
		total_bacterias = self.board[x][y].bacterias.__len__
		total_antibioticos = self.board[x][y].cant_antibiotic
		
		#esa celda se queda sin bacterias y sin antibioticos
		self.board[x][y].bacterias = []
		self.board[x][y].cant_antibiotic = 0
			 
		#actualizo la cantidad de bacterias en el tablero
		self.cantBacterias -= total_bacterias
		self.cantAntibioticos -= total_antibioticos

	def low_dose_antibiotic(self, x, y):
		total_antibioticos = self.board[x][y].cant_antibiotic
		new_bacterias = []

		for bacteria in self.board[x][y].bacterias:
			if bacteria._state == Type_Bacterium.FUERTE:
				new_bacterias.append(bacteria.debilitar())
			else:
				#las bacterias que no son fuertes, terminan desapareciendo
				self.cantBacterias -= 1
		
		self.board[x][y].bacterias = new_bacterias
		self.board[x][y].cant_antibiotic = 0

		self.cantAntibioticos -= total_antibioticos


	def overpopulation(self,x,y):
		strongest = None
		total_en_celda = self.board[x][y].bacterias

		#ciclo para quedarme con la bacteria más fuerte de la celda
		for bacteria in self.board[x][y].bacterias:
			if bacteria._state == Type_Bacterium.FUERTE:
				strongest = bacteria
				break
			else:
				if bacteria._state == Type_Bacterium.NORMAL:
					strongest = bacteria

		#si no encontre ninguno fuerte ni normal, es porque tengo todos debiles
		#asigno cualquiera, en este caso el primero
		if strongest == None:
			strongest = self.board[x][y].bacterias[0]
 
		self.board[x][y].bacterias = [strongest]

		#actualizo la cantidad de bacterias del tablero
		self.cantBacterias = self.cantBacterias - total_en_celda + 1

	def count_move(self, x, y):
		new_bacterias = []

		for bacteria in self.board[x][y].bacterias:
			#chequeo las bacterias que están en condiciones de reproducirse
			if(bacteria._state != Type_Bacterium.DEBIL and bacteria._moves == 3):
				new_bacterias.append(bacteria.reproducir())

			#chequeo las bacterias que están en condiciones de recuperarse
			if(bacteria._state == Type_Bacterium.DEBIL and bacteria._moves == 6):
				bacteria.recuperar()

		#agrego a la lista original, las bacterias que provienen de la reproduccion
		self.board[x][y].bacterias.extend(new_bacterias)
		self.cantBacterias += new_bacterias.__len__

		#le sumo 1 a todas las bacterias, sería como contar el proximo paso
		for bacteria in self.board[x][y].bacterias:
			bacteria.add_move()
			
				

		