module cpu_out_reg(bus_in, clk, rst, l, port_out);
input clk, rst;
input [3:0] bus_in;
output [3:0] port_out;
input l;
reg [3:0] data;

assign port_out = data;

always @(posedge clk, negedge rst) begin
    if (!rst)
        data <= 0;
    else 
        if (l) data <= bus_in;
end

endmodule