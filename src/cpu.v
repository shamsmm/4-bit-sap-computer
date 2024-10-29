module cpu(clk, rst, out_port);
input clk, rst;
output [3:0] out_port;

// data and address lines (shared bus)
tri0 [7:0] bus = 8'bZ;

// control lines
wire lp, ep, c, // program counter
     la, ea,    // register A
     lb, eb,    // register B
     lc,        // register C (wr only)
     ld,        // register D (wr only)
         es,    // ALU output
     lm, em,    // memory 
     li, ei,    // instruction register
     lo;        // output register

// flags
wire c_eq_d,    // C equals D
     s_ov;      // Sum overflowed

// general purpose registers
cpu_reg reg_a(bus, clk, rst, la, ea);
cpu_reg reg_b(bus, clk, rst, lb, eb);

// write only registers, for ALU
cpu_reg reg_c(bus, clk, rst, lc, 1'b1);
cpu_reg reg_d(bus, clk, rst, ld, 1'b1);
    
cpu_out_reg reg_out(bus, clk, rst, lo, out_port);

// program counter
cpu_pc  pc(bus, clk, rst, lp, ep, c);

cpu_mem mem(bus, clk, rst, lm, em);

cpu_control cu(bus, clk, rst, {lp, ep}, {c_eq_d, s_ov});

endmodule