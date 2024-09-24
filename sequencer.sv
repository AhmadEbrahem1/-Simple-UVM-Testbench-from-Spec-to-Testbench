
class alu_sequencer extends uvm_sequencer  #(alu_sequence_item) ;

  `uvm_component_utils(alu_sequencer)



  function new(string name ="alu_sequencer", uvm_component parent) ;
   
		super.new(name,parent);
		`uvm_info("alu_sequencer","inside constructor !",UVM_HIGH)
   endfunction:new



   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("alu_sequencer","build_phase !",UVM_HIGH)

	endfunction:build_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("alu_sequencer","connect_phase !",UVM_HIGH)

	endfunction:connect_phase
	/* no run phase in here or any phases actually ^^
	task void run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("alu_sequencer","run_phase !",UVM_HIGH)
		//logic
	endtask:run_phase
	*/

endclass : alu_sequencer
