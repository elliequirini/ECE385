#* ** * * * ********* * * * ********* * * * ******** * * * * ******** * * * *********
# Create Clock (where 'Clk' is the user-defined system clock name)
#**************************************************************
create_clock -name { Clk} -period 2Ons -waveform { 0.000 5.000} [get_ports Clk1]
# Constrain the input I/0 path
set_input_delay -clock {C1k} -max 3 [all_inputs]
set_input_delay -clock {C1k} -min 2 [all_inputs]
# Constrain the output I/0 path
set_output_delay -clock {Clk} 2 [all_outputs]