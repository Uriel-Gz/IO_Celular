# class bacterium is a implementation of game's bacterium

from enum import Enum


class Type_Bacterium(Enum):
    DEBIL = 1
    NORMAL = 2
    FUERTE = 3
    INFECTADA = 4


class Bacterium:
    
    def __init__(self, state:Type_Bacterium):
        self.__state = state
        self.__moves = 0

    def __init__(self, state:Type_Bacterium, moves:int):
        self.__state = state
        self.__moves = moves

    @property
    def _state(self):
        return self.__state

    @_state.setter
    def _state(self, value:Type_Bacterium):
        self.__state = value

    @property
    def _moves(self):
        return self.__moves

    @_moves.setter
    def _moves(self, value:tuple):
        self.__moves = value

    @property
    def _infection(self):
        return self.__infection

    @_infection.setter
    def _infection(self, value):
        self.__infection = value

    def infectar(self, powerInfection:int):
        self.__moves = powerInfection
        self.__state = Type_Bacterium.INFECTADA

    def debilitar(self):
        self.__state = Type_Bacterium.DEBIL
        self.__moves = 0



    def reproducir(self):
        if self.__state == Type_Bacterium.INFECTADA or self.__state == Type_Bacterium.DEBIL:
            return ValueError
        self.__moves = 0
        return Bacterium(self.__state)
        
    def explotar(self):
        del self
    
    @staticmethod
    def from_string(bacterium_type):
        if bacterium_type == Type_Bacterium.DEBIL:
            return Type_Bacterium.DEBIL
        elif bacterium_type == Type_Bacterium.FUERTE:
            return Type_Bacterium.FUERTE
        elif bacterium_type == Type_Bacterium.NORMAL:
            return Type_Bacterium.NORMAL
        elif bacterium_type == Type_Bacterium.INFECTADA:
            return Type_Bacterium.INFECTADA
        else:
            raise ValueError(f'Invalid cell string: {bacterium_type}')

    def __str__(self):
        raise NotImplementedError
    
    

