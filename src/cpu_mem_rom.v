module cpu_mem_rom(bus_out, address);
input [3:0] address;
output [7:0] bus_out;

assign bus_out = rom_out;

wire [7:0] rom_out;

gowin_rom16 rom(rom_out, address);

endmodule