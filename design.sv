// Code your design here
module alu (
input  clock,reset,
  input  [7:0] A,B,
  input [3:0] ALU_SEL,
  output reg [7:0] ALU_OUT,
  output bit Carry_out


);
  
  reg [7:0] ALU_Result;
  wire [8:0] tmp;

  assign tmp = {1'b0,A} + {1'b0,B};

  
  always @(posedge clock or posedge reset) begin
    if(reset) begin
      ALU_OUT  <= 8'd0;
      Carry_out <= 1'd0;
    end
    else begin
      ALU_OUT <= ALU_Result;
      Carry_out <= tmp[8];
    end
  end


  always @(*) //introduce a bug here, A B sensitivity only, change ALU_Sel during
    begin
      case(ALU_SEL)
        4'b0000: // Addition
          ALU_Result = A + B ; 
        4'b0001: // Subtraction
          ALU_Result = A - B ;
        4'b0010: // Multiplication
          ALU_Result = A * B;
        4'b0011: // Division
          ALU_Result = A/B;
        default: ALU_Result = 8'h0 ; // Give out random BAD value
      endcase
    end

  
  
  
  
endmodule


 
