Please ensure that the files mentioned below are available before starting Synthesis Flow:

Dependencies for Synthesis :

packages :

1) array_pkg.vhd

Design Files:
	1) MM_top.vhd			 : Top File
	a) MM_controller.vhd
	b) load_module.vhd
	c) LOADER.vhd
	d) MACC_module.vhd
	e) SRAM_SP_WRAPPER.vhd
	f) SPHD110420_FUNCT.vhd
	g) SPHD110420_COMPONENTS.vhd

NOTE: LOADER module has an internal ROM ( IP from Xilinx ), which may not be synthesized.