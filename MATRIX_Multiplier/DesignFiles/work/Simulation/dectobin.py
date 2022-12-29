from pathlib import Path
import os
import numpy as np
from random import seed
from random import random
from random import randint


def decimalToBinary(n):
#    return bin(n).replace("0b","0000")
    return format(n, "08b")


if __name__=='__main__':
    seed(random())
    file_name = "C:/Users/vnay0/Desktop/IC_project/EMM_ICP2/EMM_ICP2.srcs/sources_1/imports/EMM_ICP2/testvectors.txt"
    file_path = "C:/Users/vnay0/Desktop/IC_project/RAM_test/RAM_test.srcs/sources_1/new/"
    os.chdir(file_path)

    read_object = open(file_name, 'r')
    readline = read_object.read().splitlines()
    reversed_list = readline.copy()
    reversed_list.reverse()
    file = open("input_matrix.coe", "w+")
    file.write('memory_initialization_radix=10;')
    file.write('\n')
    file.write('memory_initialization_vector=')
    file.write('\n')
    file.close()

    for i in range(len(reversed_list)):
       # print(decimalToBinary(i))
       # num = decimalToBinary(randint(0,i))
       # num = (randint(0, 65535))
       # print(num)
        file = open("input_matrix.coe", "a")
        file.writelines(str(reversed_list[i]))
        file.write('\n')
    file.close()


