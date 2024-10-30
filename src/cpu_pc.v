module cpu_pc(bus_in, bus_out, clk, rst, lp, c);
input clk, rst, lp, c;
input [3:0] bus_in;
reg [3:0] counter;

output [3:0] bus_out;
assign bus_out = counter;

always @(posedge clk, negedge rst) begin
    if (!rst) begin
        counter <= 0;
    end else begin
        if (lp) counter <= bus_in;
        else 
            if (c) counter <= {counter + 1}[3:0];
            else counter <= counter;
    end
end

endmodule