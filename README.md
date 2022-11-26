# MSOC1 CODE REPO

## Code for assignments - EITF 35
    This repo consists of RTL files from one of the courses I took during my Master's program at LTH. 
    The idea was to use VHDL to progressively build larger systems. Concepts such as Finite State Machine ( FSM ), Algorithm State Machine Diagram( ASMD ) has been used to implement the systems in the projects.

## 1 : Sequence Detector
       A very simple project to get the ball rolling. 
       Idea is to design an FSM which can detect a specific sequence of binary numbers ( for eg. 10011011 ).
     

## 2 : KeyBoard Controller
       Interface a PS/2 keyboard to an FPGA dev. board( for eg. BASYS3 or Nexys4 ). 
       Finding an FPGA dev. board with PS/2 interface can be an issue. However, most wired keyboards use the old PS/2 
       communication protocol implemented over USB. We do not need to concern ourselves with the details of this now.

## 3 : 8-bit ALU [Add, sub, mod3]
       Design and implement a 3 function ALU on FPGA
       Take two 8-bit numbers from switches on FPGA dev. board and perform ALU operations on them.
       contact me on vnay01@gmail.com if you want help in understanding the design.

## 4 : Calculator with VGA display
       Integrate Keyboard Controller,ALU and VGA controller to build a basic calculator.
       The display of this calculator is a VGA monitor.

## 5 : Convolutional Neural Net Accelarator
       Design an accelarator for convolution operation in a CNN model.
       Work in progress.


[Working Comments]: 
@26-Nov-2022 : Currently working on CNN
