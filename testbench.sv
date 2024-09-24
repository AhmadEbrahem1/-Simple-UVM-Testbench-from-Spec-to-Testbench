 `timescale 1ns/1ns

 import uvm_pkg::*;

`include "uvm_macros.svh"
//------------------
//includes
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

  
//---------------
  
module top();






logic clock;
always #2 clock=! clock ;
  alu_if  ALU_IF(.clock(clock));


alu dut (
.clock(ALU_IF.clock),
.reset(ALU_IF.reset),
.A(ALU_IF.A),
.B(ALU_IF.B),
.ALU_SEL(ALU_IF.ALU_SEL),
.ALU_OUT(ALU_IF.ALU_OUT),
.Carry_out(ALU_IF.Carry_out)


);

//
//interface_setting
/////////////////
initial
begin
	uvm_config_db #(virtual alu_if ) :: set (null,"*","vif",ALU_IF);
end



initial 
begin
	clock=0;
	$dumpfile("dut.vcd");
	$dumpvars();
	
	#5000;
	$display("END OF CLOCK !!!! ");
	$finish();
	
end

initial 
begin
  run_test("alu_TEST");
	
end

endmodule : top