module cpu_mem(bus, clk, rst, lm, em);
input clk, rst, lm, em;
inout [7:0] bus;


wire [3:0] address;

cpu_mem_mar mar(bus, address, clk, rst, lm);
cpu_mem_rom rom(bus, address, em);

endmodule