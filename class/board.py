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