`define EB 15'b100000000000000
`define C  15'b010000000000000
`define LC 15'b001000000000000
`define LD 15'b000100000000000
`define EP 15'b000010000000000
`define LP 15'b000001000000000
`define EA 15'b000000100000000
`define LA 15'b000000010000000
`define LB 15'b000000001000000
`define ES 15'b000000000100000
`define LM 15'b000000000010000
`define EM 15'b000000000001000
`define LI 15'b000000000000100
`define EI 15'b000000000000010
`define LO 15'b000000000000001

`define NOP     4'b0000
`define LD_A    4'b0001
`define LD_B    4'b0010
`define LD_C    4'b0011
`define LD_D    4'b0100
`define MOV_A_B 4'b0101
`define MOV_A_C 4'b0110
`define MOV_A_D 4'b0111
`define MOV_B_A 4'b1000
`define MOV_B_C 4'b1001
`define MOV_B_D 4'b1010
`define ADD_A   4'b1011
`define OUT_A   4'b1100
`define JMP     4'b1101
`define JMP_CN  4'b1110
`define JMP_NCN 4'b1111
