class env_config extends uvm_object;
	`uvm_object_utils(env_config)

	bit has_ahb_master_agt_top;
	bit has_apb_slave_agt_top;
	bit has_scoreboard;
	bit has_virtual_sequencer;
	int no_of_ahb_agnts;
	int no_of_apb_agnts;
	apb_config apb_cfg[];
	ahb_config ahb_cfg[];

	extern function new(string name = "env_config");
endclass

function env_config::new(string name = "env_config");
	super.new(name);
endfunction
