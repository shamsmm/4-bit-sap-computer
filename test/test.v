module test;

reg clk = 1;
reg rst = 1;
wire [3:0] out;

initial begin
    $dumpfile("test.fst");
    $dumpvars(0, test);

    #(1) ;
    rst = 1'b0;
    #(1) ;
    rst = 1'b1;

    #5000
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
   $readmemb("test/rom.txt", rom, 0, 15);
end

always @(address)
    rom_out = rom[address];

endmodule