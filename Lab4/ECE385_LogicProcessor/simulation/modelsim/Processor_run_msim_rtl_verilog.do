transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/Router.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/Reg_8.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/HexDriver.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/Control.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/compute.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/Register_unit.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/Processor.sv}

vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_LogicProcessor {C:/altera/14.0/quartus/ECE385_LogicProcessor/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
