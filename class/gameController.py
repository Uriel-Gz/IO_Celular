from enum import Enum
from board import Board

class Game_Mode(Enum):
    ANTIBIOTIC = 1
    BACTERIOPHAGE = 2

class gameController:

    def __init__(self):
        #se pueden dejar algunos valores por defecto y que el usuario los modifique si quiere
        self.__game_mode = Game_Mode.ANTIOBIOTIC
        self.__reproduction_moves = 3
        self.__recovery_moves = 6
        self.__overpopulation_cant = 4
        self.__exploit_moves = 4
        self.__board = Board


    def get_mode(self):
        return self.__game_mode