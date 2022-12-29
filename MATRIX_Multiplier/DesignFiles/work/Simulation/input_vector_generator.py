## Import Necessary packages and libraries

from pathlib import Path
import os
import numpy as np
from random import seed
from random import random
from random import randint

## RANDOM MATRIX GENERATION
seed(random())
num = []

############## USE THIS BLOCK TO GENERATE RANDOM INPUT MATRIX #######
#generate some integers
for i in range(65):
    values = randint(0,255)
    num.append(values)
print((num))

#
#file_object = open(prod_file_name,'a')
#for i in range(len(list)):
#    prod =list[i]
#    file_object.write(str(prod))
#    file_object.write('\n')
#file_object.close()


##################################################
#### changing directory
##### change the path to local directory where you would want to save the testvector.txt
file_path = "C:/Users/vnay0/Desktop/IC_project/EMM_ICP2/EMM_ICP2.srcs/sources_1/imports/EMM_ICP2"
#file_path = "E:/ICP2/DesignFiles"
os.chdir(file_path)

## Create a stimulus file
f = open("testvectors.txt","w+")
f.close()

## Writing to stimulus file
f = open("testvectors.txt", "w")
for k in range(1):
    for i in range(len(num)-1):
        a = num[i] + k
        f.write(str(a))
        f.write('\n')
f.close()
