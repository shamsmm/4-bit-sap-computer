`include "defines.v"

module cpu_control(bus_in, clk, rst, reg_ir, control_lines, flag_lines);
input clk, rst;
input [7:0] bus_in;
output reg [14:0] control_lines;
input [1:0] flag_lines;

// instruction in execution
input [3:0] reg_ir;

reg [1:0] counter = 0;

always @(posedge clk, negedge rst)
        if (!rst) counter <= 0;
        else counter <= {counter + 1}[1:0];

always @(*) begin
    control_lines <= 0;

    case(counter)
        2'b00: control_lines <= `EP|`LM;
        2'b01: control_lines <= `C|`LI|`EM;
        2'b10: begin
            case(reg_ir)
                `LD_A: control_lines <= `LA|`EI;
                `LD_B: control_lines <= `LB|`EI;
                `LD_C: control_lines <= `LC|`EI;
                `LD_D: control_lines <= `LD|`EI;
                `MOV_A_B: control_lines <= `LB|`EA;
                `MOV_A_C: control_lines <= `LC|`EA;
                `MOV_A_D: control_lines <= `LD|`EA;
                `MOV_B_A: control_lines <= `LA|`EB;
                `MOV_B_C: control_lines <= `LC|`EB;
                `MOV_B_D: control_lines <= `LD|`EB;
                `ADD_A: control_lines <= `LA|`ES;
                `OUT_A: control_lines <= `EA|`LO;
                `JMP: control_lines <= `EI|`LP;
                `JMP_CN: if (flag_lines[0]) control_lines <= `EI|`LP;
                `JMP_NCN: if (!flag_lines[0]) control_lines <= `EI|`LP;
            endcase
        end
        2'b11: begin
        end
    endcase
end

endmodule
