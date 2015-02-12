transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_16-bit_Carry_Ripple {C:/altera/14.0/quartus/ECE385_16-bit_Carry_Ripple/full_adder.sv}
vlog -sv -work work +incdir+C:/altera/14.0/quartus/ECE385_16-bit_Carry_Ripple {C:/altera/14.0/quartus/ECE385_16-bit_Carry_Ripple/carry_ripple16.sv}

