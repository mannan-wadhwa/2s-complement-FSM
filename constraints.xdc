## CLOCK CONSTRAINT
# clk signal is a 100 MHz clock (10 ns period)
create_clock -name clk -period 100.000 [get_ports clk]


## INPUT DELAYS
# assume 2 ns delay for in_bit and reset
set_input_delay 2.0 -clock clk [get_ports in_bit]
set_input_delay 2.0 -clock clk [get_ports reset]


## OUTPUT DELAY
# Assume output must be valid within 2 ns after the clock edge
set_output_delay 2.0 -clock clk [get_ports out_bit]
