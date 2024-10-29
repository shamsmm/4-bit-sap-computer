module cpu_mem_mar(bus, address, clk, rst, lm);
input clk, rst;
input [3:0] bus;
output reg [3:0] address;
input lm;

always @(posedge clk, negedge rst)
    if (!rst)
        address = 0;
    else
        if (lm)
            address = bus;

endmodule