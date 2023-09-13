# class board is a implementation of game's board

from bacterium import Type_Bacterium, Bacterium
from celda import Celda

class Board:

	def	 __init__(self, rows, columns):
		self.board = Celda[rows][columns]
		self.rows = rows
		self.columns = columns
		self.position_spawn_other = (0,0)
		self.position_spawn_bacterium = (0,0)
		self.cantBacterias = 0
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
		sefl.board.cantBacterias += 1

	def set_Antibiotico(self, xCelda:int, yCelda:int, cantidad:int):
		self.board[xCelda][yCelda].set_cant_antibiotic(cantidad)
		sefl.board.cant_antibiotic += cantidad

	def add_Bacteria(self, xCelda:int, yCelda:int, state:Type_Bacterium, moves:int):
		self.board[xCelda][yCelda].set_bacterias(state, moves)
		self.cantBacterias += 1

	def add_Antibiotico(self, xCelda:int, yCelda:int, cant:int):
		self.board[xCelda][yCelda].cant_antibiotic += 1
		self.cantAntibioticos += 1
  
	def set_Bacteriofago(self, xCelda:int, yCelda:int, poderInfeccion:int):
		self.board[xCelda][yCelda].set_virus(poderInfeccion)

	def actualizar_tablero(self):
		new_board = Celda[C.rows][self.columns]

		for x in range(self.rows):
			for y in range(self.columns):
				total_bacterias = self.board[x][y].get_cant_bacterias
				total_antibioticos = self.board[x][y].get_cant_antibiotic
				total_bacteriofagos = self.board[x][y].get_cant_virus
				self.actualizar_celda(x,y)
				self.cantBacterias= self.cantBacterias-total_bacterias+self.board[x][y].get_cant_bacterias(self)
				self.cantAntibioticos= self.cantAntibioticos-total_antibioticos+self.board[x][y].get_cant_antibiotic(self)
				self.cantBacteriofagos= self.cantBacteriofagos-total_bacteriofagos+self.board[x][y].get_cant_virus(self)
				#metodo que pasa todo lo que queda en una celda, a las celdas vecinas en un tablero nuevo
				self.mover_a_vecinos(x,y, new_board)

		self.board = new_board
	

	def actualizar_celda(self, x, y):
		#si existen bacterias y antibioticos en la misma celda, aplico las reglas de cruzamiento 
		self.board[x][y].actualizar_celda()

	#para que este metodo quede bien implementado hace falta una funcion
	#que devuelva una posicion vecina random
	def get_random_move (self, i, j):
		possible_moves = self.get_possible_moves(i,j)
		if possible_moves:
			random_move = random.choise(possible_moves)
			return random_move
		else:
			return None

	def get_possible_moves(self, i,j):
		moves = []
		for x in range(i-1,i+2):
			for y in range(j-1,j+2):
				if (x,y) != (i, j):
					if 0 <= x < self.rows and 0 <= y < self.columns:
						moves.append((x, y))
		return moves
	def update_board(self):
		new_board = Board(self)
		for x in range(0,self.rows):
			for y in range(0, self.columns):
				new_board = mover_a_vecinos(self, x, y, new_board)

		self.board = new_board

	def mover_a_vecinos(self, x, y, new_board):
		new_x = 0
		new_y = 0
		for bacteria in self.board[x][y].get_bacterias:
			new_x, new_y = self.get_random_move(self, x,y)
			new_board[new_x][new_y].set_bacterias(bacteria)
			new_board.cant_bacterias += 1

		for i in range(self.board[x][y].get_cant_antibiotic):
			new_x, new_y = self.get_random_move(self, x,y)
			new_board[new_x][new_y].cant_antibiotic += 1

		for bacteriofago in self.board[x][y].get_virus:
			new_x, new_y = self.get_random_move(self, x,y)
			new_board[new_x][new_y].virus.append(bacteriofago)
			new_board[new_x][new_y].cantBacteriofagos += 1
		

	
		return new_board

		
