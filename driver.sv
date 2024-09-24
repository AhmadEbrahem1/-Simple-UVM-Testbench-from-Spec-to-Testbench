
class alu_driver extends uvm_driver #(alu_sequence_item);
//parametrized
  `uvm_component_utils(alu_driver)
	virtual alu_if vif;	// handler to put configs in it
  alu_sequence_item  item; // driver now has a handle to sequence_item
  

   function new(string name ="alu_driver", uvm_component parent);
   
		super.new(name,parent);
		`uvm_info("alu_driver","inside constructor !",UVM_HIGH)
   endfunction:new


//--------------build_phase-----------------//
   function void build_phase(uvm_phase phase);
		super.build_phase(phase);
     `uvm_info("alu_driver","build_phase !",UVM_HIGH)
		
     if(! (uvm_config_db #(virtual alu_if ) :: get (this,"*","vif",vif) ))
		begin
			`uvm_error("alu_driver","failed to get vif drom DB!!") // takes 2 arguments
		end
		
		
	endfunction:build_phase
	
	//--------------connect_phase-------------//
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("alu_driver","connect_phase !",UVM_HIGH)

	endfunction:connect_phase
	
  
  //------------run_phase----------------
	task  run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("alu_driver","run_phase !",UVM_HIGH)
		//logic
      forever
        begin
           item=alu_sequence_item::type_id::create ("item");
          seq_item_port.get_next_item(item);
          
          // this better than directly drivng it is more modular
          drive(item);
          
          seq_item_port.item_done();
          
        end
      
      
      
	endtask:run_phase
	
  
  
  task  drive(alu_sequence_item item); // pass by reference since it is an object
    @(posedge vif.clock );
    vif.reset<=item.reset;
    vif.A<=item.A;
    vif.B<=item.B;
    vif.ALU_SEL<=item.ALU_SEL;
    
    
    
  endtask:drive

endclass : alu_driver
