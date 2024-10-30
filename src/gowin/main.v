module main(clk, rst, port_out);

input clk, rst;
output [3:0] port_out;
wire [3:0] cpu_port_out;

// LEDs are active LOW
assign port_out = ~cpu_port_out;

gowin_clkdiv8 div1(clk8, clk, rst);
gowin_clkdiv8 div2(clk64, clk8, rst);
gowin_clkdiv8 div3(clk512, clk64, rst);
gowin_clkdiv8 div4(clk4096, clk512, rst);
gowin_clkdiv8 div5(clk32786, clk4096, rst);
gowin_clkdiv8 div6(clk262144, clk32786, rst);

cpu my_computer(clk262144, rst, cpu_port_out);

endmodule