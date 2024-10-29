module cpu_control(bus, clk, rst, control_lines, flag_lines);
input clk, rst;
inout [7:0] bus;
output [23:0] control_lines;
input [1:0] flag_lines;
endmodule
