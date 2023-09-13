from bacterium import Type_Bacterium, Bacterium

class Celda:

	def __init__(self):
		self.bacterias = []
		self.cant_antibiotic = 0
		self.virus = []

	def get_bacterias(self):
		return self.bacterias
    
	def get_cant_bacterias(self):
		return self.bacterias.__len__

	#def set_bacterias(self, state:Type_Bacterium):
	#	self.bacterias.append([Bacterium(state)])

	def set_Bacteria(self, bacteria:Bacterium):
		self.bacterias.append(bacteria)
	
	def set_bacterias(self, state:Type_Bacterium, moves:int):
		self.bacterias.append([Bacterium(state, moves)])

	def get_cant_antibiotic(self):
		return self.cant_antibiotic
	
	def set_antibiotic(self):
		self.cant_antibiotic += 1

	def set_cant_antibiotic(self, value):
		self.cant_antibiotic = value

	def get_virus(self):
		return self.virus

	def get_cant_virus(self):
		return self.virus.__len__

	def set_virus(self, poder:int):
		self.virus.append([Bacteriofago(poder)])
	
	def actualizar_celda(self):
	#aplico regla de sobrepoblación
		if self.bacterias.__len__ >= 4:
			self.overpopulation(x,y)

	#si existen bacterias y antibioticos en la misma celda, aplico las reglas de cruzamiento 
		if self.cant_antibiotic > 0 and self.bacterias.__len__ > 0:
			if self.cant_antibiotic > self.bacterias.__len__:
				self.high_dose_antibiotic(x,y)
			else:
				self.low_dose_antibiotic(x,y)
			

		#una vez aplicadas todas las reglas de cruzamiento, le resto un movimiento a todo lo que quedo
		self.count_move(x,y)
	
	def high_dose_antibiotic(self, x, y):
		#esa celda se queda sin bacterias y sin antibioticos
		self.bacterias = []
		self.cant_antibiotic = 0

	def low_dose_antibiotic(self, x, y):
		total_antibioticos = self.cant_antibiotic
		new_bacterias = []

		for bacteria in self.bacterias:
			if bacteria._state == Type_Bacterium.FUERTE:
				new_bacterias.append(bacteria.debilitar())
			else:
				#las bacterias que no son fuertes, terminan desapareciendo
				self.cantBacterias -= 1
		
		self.bacterias = new_bacterias
		self.cant_antibiotic = 0

		self.cantAntibioticos -= total_antibioticos


	def overpopulation(self,x,y):
		strongest = None
		total_en_celda = self.bacterias

		#ciclo para quedarme con la bacteria más fuerte de la celda
		for bacteria in self.bacterias:
			if bacteria._state == Type_Bacterium.FUERTE:
				strongest = bacteria
				break
			else:
				if bacteria._state == Type_Bacterium.NORMAL:
					strongest = bacteria

		#si no encontre ninguno fuerte ni normal, es porque tengo todos debiles
		#asigno cualquiera, en este caso el primero
		if strongest == None:
			strongest = self.bacterias[0]
 
		self.bacterias = [strongest]

	def count_move(self):
		
		for bacteria in self.bacterias:
			#chequeo las bacterias que están en condiciones de reproducirse
			if bacteria.isReproducible(self):
				self.bacterias.append(bacteria.reproducir())

			#chequeo las bacterias que están en condiciones de recuperarse
			if bacteria.isRecoverable(self):
				bacteria.recuperar(self)
			
		
		#agrego a la lista original, las bacterias que provienen de la reproduccion
		#self.bacterias.extend(new_bacterias)
		#self.cantBacterias += new_bacterias.__len__

		#le sumo 1 a todas las bacterias, sería como contar el proximo paso
		for bacteria in self.bacterias:
			bacteria.add_move()