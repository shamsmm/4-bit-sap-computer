module cpu_alu (bus_out, a, b);
input [3:0] a;
input [3:0] b; 
output [3:0] bus_out;

assign bus_out = alu_out;
wire [4:0] sum = a + b;
wire [3:0]alu_out = sum[3:0];

endmodule