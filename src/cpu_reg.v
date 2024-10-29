module cpu_reg(bus, clk, rst, l, e);
input clk, rst;
inout [3:0] bus;
input l, e;
reg [3:0] data;

assign bus = e ? data : 'bZ;

always @(posedge clk, negedge rst) begin
    if (!rst)
        data = 0;
    else 
        if (l) data = bus;
end

endmodule