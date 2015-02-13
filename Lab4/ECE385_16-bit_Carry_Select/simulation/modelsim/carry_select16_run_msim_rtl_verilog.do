transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select {C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select {C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select/carry_select16.sv}
vlog -sv -work work +incdir+C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select {C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select/full_adder_4.sv}
vlog -sv -work work +incdir+C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select {C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select/mux21_4.sv}
vlog -sv -work work +incdir+C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select {C:/Users/Ellie/Documents/GitHub/ECE385/Lab4/ECE385_16-bit_Carry_Select/mux21.sv}

