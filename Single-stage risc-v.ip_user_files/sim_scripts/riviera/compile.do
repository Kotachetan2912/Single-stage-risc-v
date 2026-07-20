transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib "../../../Single-stage risc-v.srcs/sources_1/new/Datapath.v"  -incr -v2k5 -l xil_defaultlib \
"../../../Single-stage risc-v.srcs/sources_1/new/Datapath.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/ALU.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/ALU_CONTROL.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/ALU_Decoder.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/Data_Mem.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/Extend.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/Instruction_Memory.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/MAIN_Decoder.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/MUX_ALUSrc.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/MUX_PCSrc.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/MUX_ResultSrc.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/PCTarget.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/PCplus4.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/Program_Counter.v" \
"../../../Single-stage risc-v.srcs/sources_1/new/Register_File.v" \
"../../../Single-stage risc-v.srcs/sim_1/new/Datapath_tb.v" \


vlog -work xil_defaultlib \
"glbl.v"

