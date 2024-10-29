module cpu_reg(bus_in, bus_out, clk, rst, l);
input clk, rst;
input [3:0] bus_in;
output [3:0] bus_out;
assign bus_out = data;
input l;
reg [3:0] data;

always @(posedge clk, negedge rst) begin
    if (!rst)
        data = 0;
    else 
        if (l) data = bus_in;
end

endmodule