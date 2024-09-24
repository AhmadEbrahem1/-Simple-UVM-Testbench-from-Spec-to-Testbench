
class alu_TEST extends uvm_test;

  `uvm_component_utils(alu_TEST)

alu_env env;
 alu_sequence reset_seq;
alu_test_sequence test_seq;
  
  
  
  
  
  
  
   function new(string name ="alu_TEST", uvm_component parent);
   
		super.new(name,parent);
		`uvm_info("TEST_CLASS","inside constructor !",UVM_HIGH)
   endfunction:new



   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TEST_CLASS","build_phase !",UVM_HIGH)

     env=alu_env::type_id::create ("env",this);// now test contains  env
	endfunction:build_phase
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("TEST_CLASS","connect_phase !",UVM_HIGH)
//connect monitor with scoreborad
	endfunction:connect_phase
	
  //-----------run_phase------------
	task  run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("TEST_CLASS","run_phase !",UVM_HIGH)
      
      phase.raise_objection(this);
      
      //start sequences
      reset_seq =alu_sequence:: type_id:: create("reset_seq");
      reset_seq.start(env.agent.m_seqr); //run sequence on that sequencer
       #10;
      //reset sequences
      repeat(100) begin
     test_seq= alu_test_sequence:: type_id:: create("test_seq");
      test_seq.start(env.agent.m_seqr); //run sequence on that sequencer
      #10;

      end
        phase.drop_objection(this);
    
    endtask:run_phase
	

endclass : alu_TEST
