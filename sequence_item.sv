//object class

class alu_sequence_item extends uvm_sequence_item ;

`uvm_object_utils(alu_sequence_item)


//instantition

rand logic reset;
rand logic [7:0] A,B;
rand logic [3:0] ALU_SEL;
logic [7:0] ALU_OUT; //output
bit Carry_out; //output

///////default constraits:
  constraint inputs_C{
  A inside {[10:20]};
  B inside {[1:10]};
 }
  constraint opcode_c {
    ALU_SEL inside {[0:3]} ; 
  }

  function new (string name="alu_sequence_item");

	super.new(name);
endfunction:new

endclass:alu_sequence_item