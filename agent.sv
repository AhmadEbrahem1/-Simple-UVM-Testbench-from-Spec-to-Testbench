
class alu_agent extends uvm_agent;

  `uvm_component_utils(alu_agent)
alu_driver m_driver;
  alu_monitor m_monitor;
  alu_sequencer m_seqr;


   function new(string name ="alu_agent", uvm_component parent);
   
		super.new(name,parent);
		`uvm_info("alu_agent","inside constructor !",UVM_HIGH)
   endfunction:new



   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("alu_agent","build_phase !",UVM_HIGH)
     m_driver= 	alu_driver ::type_id::create ("m_driver",this);
     m_monitor= 	alu_monitor ::type_id::create ("m_monitor",this);
     m_seqr= 	alu_sequencer ::type_id::create ("m_seqr",this);

    endfunction:build_phase
  
	//connect_phase
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("alu_agent","connect_phase !",UVM_HIGH)
      m_driver.seq_item_port.connect(m_seqr.seq_item_export);
	endfunction:connect_phase
	
	task  run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("alu_agent","run_phase !",UVM_HIGH)
		//logic
	endtask:run_phase
	

endclass : alu_agent
