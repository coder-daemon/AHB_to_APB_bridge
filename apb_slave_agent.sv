class apb_slave_agent extends uvm_agent;
	`uvm_component_utils(apb_slave_agent)

	apb_slave_monitor monh;
	apb_slave_driver drvh;
	apb_config m_cfg;
	//apb_slave_sequencer seqrh;
	//env_config cfg;
	//ahb_master_agent agnt;

	extern function new(string name = "apb_slave_agent",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
endclass

function apb_slave_agent::new(string name = "apb_slave_agent",uvm_component parent);
	super.new(name,parent);
endfunction

function void apb_slave_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_config_db #(apb_config)::get(this,"","apb_config",m_cfg);
	monh = apb_slave_monitor::type_id::create("monh",this);
	if(m_cfg.is_active == UVM_ACTIVE)
	begin
		drvh = apb_slave_driver::type_id::create("drvh",this);
		//seqrh = apb_slave_sequencer::type_id::create("seqrh",this);
	end
endfunction

function void apb_slave_agent::connect_phase(uvm_phase phase);
	/*uvm_config_db #(env_config)::get(this,"","env_config",cfg);
	if(m_cfg.is_active == UVM_ACTIVE)
	begin
		for(int i=0;i<cfg.no_of_ahb_agnts;i++)
			drvh.seq_item_port.connect(uvm_test_top.envh.ahb_agnt_top.agnth[i].seqrh.seq_item_export);
	end*/
	//if(m_cfg.is_active == UVM_ACTIVE)
		//drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction
