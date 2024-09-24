
class alu_env extends uvm_env;

  `uvm_component_utils(alu_env)
alu_agent agent;
alu_scoreboard scb;
  

   function new(string name ="alu_env", uvm_component parent);
   
		super.new(name,parent);
		`uvm_info("alu_env","inside constructor !",UVM_HIGH)
   endfunction:new



   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("alu_env","build_phase !",UVM_HIGH)
     agent= 	alu_agent ::type_id::create ("agent",this);
     scb = alu_scoreboard::type_id::create ("scb",this);
     
     
     
	endfunction:build_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
      
      agent.m_monitor.monitor_analysis_port.connect(scb.scb_analysis_imp);
		`uvm_info("alu_env","connect_phase !",UVM_HIGH)

	endfunction:connect_phase
	
	task  run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("alu_env","run_phase !",UVM_HIGH)
		//logic
	endtask:run_phase
	

endclass : alu_env
