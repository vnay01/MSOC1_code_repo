######## Product Matrix Calculation
from pathlib import Path
import os
import numpy as np

#### HARD CODED COEFFICIENT MATRIX
D = [3,8,18,1, 22,15,40,10,  11,2,3,4, 1,4,2,0,   8,12,16,2,    3,6,9,12, 2,2,2,2,  255,76,90,91, 109,213,111,46, 1,1,1,1, 56,78,92,43, 9,10,67,98 ]

### Reading generated "testvectors.txt" file 
## Choose file path to point to the location where you store "testvectors.txt"
file_name = "C:/Users/vnay0/Desktop/IC_project/EMM_ICP2/EMM_ICP2.srcs/sources_1/imports/EMM_ICP2/testvectors.txt"

read_object = open(file_name,'r')

readline = read_object.read().splitlines()
## Create a 16 by 4 matrix from list
shape = (16,4)
X = np.array(readline, int).reshape(shape)

A = np.array(D,int).reshape(4,12)
C=np.dot(X,A).reshape(16,12)
print(type(A))
print('\n')
print('Calculating product matrix ...')


print(type(C))
list = C.tolist()
print(type(list))
print(len(list))

### Writing product matrix to a file
## Choose file path as per your folder structure
file_path = "C:/Users/vnay0/Desktop/IC_project/EMM_ICP2/EMM_ICP2.srcs/sources_1/imports/EMM_ICP2"

os.chdir(file_path)

prod = []

prod_file_name = 'product_matrix.txt'

file_object = open(prod_file_name,'w')
file_object.close()


## Writing to product matrix to file
file_object = open(prod_file_name,'a')
for i in range(len(list)):
    prod =list[i]
    file_object.write(str(prod))
    file_object.write('\n')
file_object.close()