#### Template Script for RTL->Gate-Level Flow (generated from RC 16.12-s027_1) 

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################

set ROOT "/h/d3/t/so5638ya-s/ICP_1"

set SYNT_SCRIPT    "${ROOT}/scripts"
set SYNT_OUT       "${ROOT}/OUTPUTS"
set SYNT_REPORT    "${ROOT}/REPORTS"

# Set the top_entity_name you want to do synthesis on
set DESIGN CL_adder

set RTL "/h/d3/t/so5638ya-s/ICP_1/vhdl"

set_attribute script_search_path $SYNT_SCRIPT /

set_attribute init_hdl_search_path $RTL /

set_attribute init_lib_search_path { \
/usr/local-eit/cad2/cmpstm/stm065v536/CORE65LPLVT_5.1/libs \
/usr/local-eit/cad2/cmpstm/stm065v536/CLOCK65LPLVT_3.1/libs \
/usr/local-eit/cad2/cmpstm/mem2011/SPHD110420-48158@1.0/libs \
/usr/local-eit/cad2/cmpstm/dicp18/LU_PADS_65nm \
} /

set_attribute library { \
CLOCK65LPLVT_wc_1.00V_125C.lib \
CORE65LPLVT_wc_1.00V_125C.lib \
SPHD110420_nom_1.20V_25C.lib \
Pads_Oct2012.lib} /

# put all your design files here
set Design_Files "${RTL}/ADD.vhd"
##${RTL}/CL_adder.vhd ${RTL}/MM_controller.vhd ${RTL}/Matrix_Multiplier_top.vhd  ${RTL}/components_pkg.vhd
##ff.vhd medianfilter_P.vhd clockgenerator.vhd medianfilter.vhd medianfilter_behavioral.vhd medianfilter_tb.vhd median_logic.vhd mux2.vhd sub.vhd"
#controller_pkg.vhd demo_ram_store.vhd load_module.vhd Matrix_Multiplier_top.vhd MM_controller.vhd multiplier.vhd Multiplier_Unit.vhd PE_module.vhd ram_controller_pkg.vhd ram_store.vhd ROM_load.vhd
set SYN_EFF medium 
set MAP_EFF medium 
set OPT_EFF medium 

set_attribute syn_generic_effort ${SYN_EFF}
set_attribute syn_map_effort ${MAP_EFF}
set_attribute syn_opt_effort ${OPT_EFF}
set_attribute information_level 5


###############################################################
## Library setup
###############################################################


####################################################################
## Load Design
####################################################################


read_hdl -vhdl ${Design_Files}

elaborate
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration



check_design -unresolved
report timing -lint
####################################################################
## Constraints Setup
####################################################################

# ALL values are in picosecond

set PERIOD 10000
set ClkName clk
set ClkLatency 500
set ClkRise_uncertainty 500
set ClkFall_uncertainty 500
set ClkSlew 500
set InputDelay 500
set OutputDelay 500

# Remember to change the -port ClkxC* to the actual name of clock port/pin in your design

define_clock -name $ClkName -period $PERIOD [find / -port clk]

set_attribute clock_network_late_latency $ClkLatency $ClkName
set_attribute clock_source_late_latency  $ClkLatency $ClkName 

set_attribute clock_setup_uncertainty $ClkLatency $ClkName
set_attribute clock_hold_uncertainty $ClkLatency $ClkName 

set_attribute slew_rise $ClkRise_uncertainty $ClkName 
set_attribute slew_fall $ClkFall_uncertainty $ClkName
 
external_delay -input $InputDelay  -clock [find / -clock $ClkName] -name in_con  [find /des* -port ports_in/*]
external_delay -output $OutputDelay -clock [find / -clock $ClkName] -name out_con [find /des* -port ports_out/*]




#read_sdc <file_name>
#puts "The number of exceptions is [llength [find /designs/$DESIGN -exception *]]"


#set_attribute force_wireload <wireload name> "/designs/$DESIGN"





###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

## Uncomment to remove already existing costgroups before creating new ones.
## rm [find /designs/* -cost_group *]

#if {[llength [all::all_seqs]] > 0} { 
 # define_cost_group -name I2C -design $DESIGN
 # define_cost_group -name C2O -design $DESIGN
 # define_cost_group -name C2C -design $DESIGN
 # path_group -from [all::all_seqs] -to [all::all_seqs] -group C2C -name C2C
 # path_group -from [all::all_seqs] -to [all::all_outs] -group C2O -name C2O
 # path_group -from [all::all_inps]  -to [all::all_seqs] -group I2C -name I2C
#}

#define_cost_group -name I2O -design $DESIGN
#path_group -from [all::all_inps]  -to [all::all_outs] -group I2O -name I2O
#foreach cg [find / -cost_group *] {
 # report timing -cost_group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
#}


#### To turn off sequential merging on the design 
#### uncomment & use the following attributes.
##set_attribute optimize_merge_flops false /
##set_attribute optimize_merge_latches false /
#### For a particular instance use attribute 'optimize_merge_seqs' to turn off sequential merging. 



####################################################################################################
## Synthesizing to generic 
####################################################################################################

#set_attribute syn_generic_effort $GEN_EFF /
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
#write_snapshot -outdir $_REPORTS_PATH -tag generic
#report datapath > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
#report_summary -outdir $_REPORTS_PATH





####################################################################################################
## Synthesizing to gates
####################################################################################################

#set_attribute syn_map_effort $MAP_OPT_EFF /
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
#write_snapshot -outdir $_REPORTS_PATH -tag map
#report_summary -outdir $_REPORTS_PATH
#report datapath > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt


#foreach cg [find / -cost_group *] {
#  report timing -cost_group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_map.rpt
#}



##Intermediate netlist for LEC verification..
#write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v
#write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v -logfile ${_LOG_PATH}/rtl2intermediate.lec.log > ${_OUTPUTS_PATH}/rtl2intermediate.lec.do

## ungroup -threshold <value>

#######################################################################################################
## Optimize Netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true /
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique> /
#set_attribute syn_opt_effort $MAP_OPT_EFF /
syn_opt
#write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
#report_summary -outdir $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

#foreach cg [find / -cost_group *] {
#  report timing -cost_group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_opt.rpt
#}



######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################



#report datapath > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
#report messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
#write_snapshot -outdir $_REPORTS_PATH -tag final
#report_summary -outdir $_REPORTS_PATH
write_hdl  > ${SYNT_OUT}/netlist.v
write_script > ${SYNT_OUT}/scripts1.script
write_sdc > ${SYNT_OUT}/${/FF.sdc

puts "\n\n\n REPORTING \n\n\n"
report qor      > $SYNT_REPORT/qor.rpt
report area     > $SYNT_REPORT/area.rpt
report datapath > $SYNT_REPORT/datapath.rpt
report messages > $SYNT_REPORT/messages.rpt
report gates    > $SYNT_REPORT/gates.rpt
report timing   > $SYNT_REPORT/timing.rpt


#################################
### write_do_lec
#################################


#write_do_lec -golden_design ${_OUTPUTS_PATH}/${DESIGN}_intermediate.v -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do
##Uncomment if the RTL is to be compared with the final netlist..
##write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile ${_LOG_PATH}/rtl2final.lec.log > ${_OUTPUTS_PATH}/rtl2final.lec.do

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

#file copy [get_attribute stdout_log /] ${_LOG_PATH}/.

##quit
