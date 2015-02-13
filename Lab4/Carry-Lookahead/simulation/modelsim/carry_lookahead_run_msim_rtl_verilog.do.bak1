transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/HexDriver.sv}
vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/full_adder.sv}
vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/control.sv}
vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/reg_17.sv}
vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/lookahead4.sv}
vlog -sv -work work +incdir+U:/Carry-Lookahead {U:/Carry-Lookahead/carry_lookahead.sv}

