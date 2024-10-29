module cpu_control(bus_in, clk, rst, control_lines, flag_lines);
input clk, rst;
input [7:0] bus_in;
output [23:0] control_lines;
input [1:0] flag_lines;
endmodule
