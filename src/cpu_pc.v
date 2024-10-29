module cpu_pc(bus, clk, rst, lp, ep, c);
input clk, rst, lp, ep, c;
inout [3:0] bus;
reg [3:0] counter;

assign bus = ep ? counter : 4'bZ;

always @(posedge clk, negedge rst) begin
    if (!rst) begin
        counter = 0;
    end else begin
        if (lp) counter = bus;
        else 
            if (c) counter = counter + 1;
            else counter = counter;
    end
end

endmodule