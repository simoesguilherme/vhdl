# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/FIR3taps.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/display.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/hex2bcd.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/imports/new/mux.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/mux2x4.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/registrador.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/imports/new/top_level.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/imports/new/uni_arit.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/imports/new/uni_logic.vhd}
  {C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/sources_1/new/top_level.vhd}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/constrs_1/imports/Pratica de Eletronica Digital/constraints_basys3.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Guilherme/Documents/UnB/Pratica de Eletronica Digital 2/2019_1/Filtro_FIR_1/Filtro_FIR.srcs/constrs_1/imports/Pratica de Eletronica Digital/constraints_basys3.xdc}}]


synth_design -top top_level -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb"
