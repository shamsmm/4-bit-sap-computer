module test;

reg clk;
wire rst = 1'b1;
wire [3:0] out;

initial begin
    clk = 1'b0;

    $dumpfile("test.fst");
    $dumpvars(0, clk);
    $dumpvars(1, out);
    $dumpvars(2, dut.bus);

    #50
    $finish;
end

cpu dut(clk, rst, out);

always #5 clk = !clk;

endmodule


module rom16(data, address);
input [3:0] address;
output [7:0] data;

reg [7:0] rom [15:0];
assign data = rom_out;

reg [7:0] rom_out;

initial begin
   $readmemb("test/rom.txt", rom);
end

always @(address)
    rom_out = rom[address];

endmodule