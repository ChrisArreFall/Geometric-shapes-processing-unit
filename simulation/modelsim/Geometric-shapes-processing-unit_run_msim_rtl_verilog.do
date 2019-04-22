transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/tb {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/tb/tb_PROCESSOR.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/top.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/pipelineARM.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Hazard\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Hazard Unit/hazardUnit.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/adderARM.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/extend.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/MUX_2.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/MUX_3.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/muxARM.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/pipelineDatapath.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/pipelinePCReg.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/conditions.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineConditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineDecoder.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineRegDtoE.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineRegEtoM.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineRegFtoD.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/pipelineRegMtoWB.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control\ Unit {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Control Unit/REG_EN.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/ALU_N_bits.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/and_A.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/flags.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/left_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/left_shift_logic.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/mux_ALU.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/mux_Sumador.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/not_A.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/or_A.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/right_shift_arithmetic.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/right_shift_logic.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/xor_A.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/ALU/sumador.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/ab2.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/alt.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/cad.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/cam.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/cap.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/cd2.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/cd3.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/div.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/dr8.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/dyx.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/mul.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/pot.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/shapes/SPU.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Memories {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Memories/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Memories {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Memories/instruction_memory.sv}
vlog -sv -work work +incdir+C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data\ path {C:/Users/Chris/Documents/GitHub/Geometric-shapes-processing-unit/base/Pipelined_ARM/Data path/register_file.sv}

