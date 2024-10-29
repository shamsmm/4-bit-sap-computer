module cpu_alu (bus_out, c, d, c_eq_d, s_ov);
input [3:0] c;
input [3:0] d; 
output [3:0] bus_out;
output c_eq_d, s_ov;
wire [3:0] alu_out;
assign bus_out = alu_out;
assign {s_ov, alu_out} = c + d;
assign c_eq_d = c == d;

endmodule