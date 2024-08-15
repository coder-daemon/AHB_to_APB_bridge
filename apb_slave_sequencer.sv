class apb_slave_sequencer extends uvm_sequencer #(apb_xtn);
	`uvm_component_utils(apb_slave_sequencer)

	extern function new(string name = "apb_slave_sequencer",uvm_component parent);
endclass

function apb_slave_sequencer::new(string name = "apb_slave_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
