module cpu_mem(bus_in, bus_out, clk, rst, lm);
input clk, rst, lm;
input [7:0] bus_in;
output [7:0] bus_out;


wire [3:0] address;

cpu_mem_mar mar(bus_in[3:0], address, clk, rst, lm);
cpu_mem_rom rom(bus_out, address);

endmodule