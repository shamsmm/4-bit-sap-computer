module cpu_out_reg(bus, clk, rst, l, out_port);
input clk, rst;
input [3:0] bus;
output [3:0] out_port;
input l;
reg [3:0] data;

assign out_port = data;

always @(posedge clk, negedge rst) begin
    if (!rst)
        data = 0;
    else 
        if (l) data = bus;
end

endmodule