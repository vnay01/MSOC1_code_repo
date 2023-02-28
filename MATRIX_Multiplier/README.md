## You may need to regenerate Xilinx memory IPs before starting Synthesis Flow :

Files present in  ***" /MATRIX_Multiplier/DesignFiles/work "*** are the most updated and works.

A brief overview of flow:
  1) Run Python Scripts to generate a behavioral model and golden data.( You might need to change the path where generated files get stored )
  
  2) Import Design Files in a Vivado Project.
  
  3) (Re)Generate IPs for BLOCK RAMs. [3 no.s]
  
  4) Run Synthesis, Implementation and BitStream Generation.
  
  5) You may also run a functional simulation using the testbench in ***Simulation*** folder
  


### Tested on Xilinx FPGA dev. board

PS : To make life a bit easier, invest some time in making a TCL script of the commands to run!

