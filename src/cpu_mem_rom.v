`define R1DATA 16'b0
`define R2DATA 16'b0
`define R3DATA 16'b0
`define R4DATA 16'b0
`define R5DATA 16'b0
`define R6DATA 16'b0
`define R7DATA 16'b0
`define R8DATA 16'b0

module cpu_mem_rom(bus, address, em);
input em;
input [3:0] address;
output [7:0] bus;

wire [7:0] rom_out;

assign bus = em ? rom_out : 8'bZ;

ROM16 #(.INIT_0(`R1DATA)) r1(.AD(address), .DO(rom_out[0]));
ROM16 #(.INIT_0(`R2DATA)) r2(.AD(address), .DO(rom_out[1]));
ROM16 #(.INIT_0(`R3DATA)) r3(.AD(address), .DO(rom_out[2]));
ROM16 #(.INIT_0(`R4DATA)) r4(.AD(address), .DO(rom_out[3]));
ROM16 #(.INIT_0(`R5DATA)) r5(.AD(address), .DO(rom_out[4]));
ROM16 #(.INIT_0(`R6DATA)) r6(.AD(address), .DO(rom_out[5]));
ROM16 #(.INIT_0(`R7DATA)) r7(.AD(address), .DO(rom_out[6]));
ROM16 #(.INIT_0(`R8DATA)) r8(.AD(address), .DO(rom_out[7]));

endmodule