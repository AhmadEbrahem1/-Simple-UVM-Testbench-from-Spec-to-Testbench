interface alu_if (input logic clock);



logic reset;
logic [7:0] A,B;
logic [3:0] ALU_SEL;
logic [7:0] ALU_OUT;
bit Carry_out;








endinterface :alu_if