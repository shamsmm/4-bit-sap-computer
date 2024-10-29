module cpu(clk, rst, port_out);
input clk, rst;
output [3:0] port_out;

// data and address lines (shared bus)
reg [7:0] bus = 8'bZ;

wire [7:0] mem_out;
wire [3:0] pc_out;
wire [3:0] reg_a_out;
wire [3:0] reg_b_out;
wire [3:0] reg_c_out;
wire [3:0] reg_d_out;
wire [3:0] alu_out;

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
cpu_reg reg_a(bus[3:0], reg_a_out, clk, rst, la);
cpu_reg reg_b(bus[3:0], reg_b_out, clk, rst, lb);

// write only registers, for ALU
cpu_reg reg_c(bus[3:0], reg_c_out, clk, rst, la);
cpu_reg reg_d(bus[3:0], reg_d_out, clk, rst, la);
    
cpu_out_reg reg_out(bus[3:0], clk, rst, lo, port_out);

// program counter
cpu_pc  pc(bus[3:0], pc_out, clk, rst, lp, c);

cpu_mem mem(bus, mem_out, clk, rst, lm);

cpu_alu alu(alu_out, reg_c_out, reg_d_out);

cpu_control cu(bus, clk, rst, {lp, ep}, {c_eq_d, s_ov});

always @(*)
    if (ep)
        bus = pc_out;
    else if (ea)
        bus = reg_a_out;
    else if (eb)
        bus = reg_b_out;
    else if (em)
        bus = mem_out;
    else if (es)
        bus = alu_out;


endmodule