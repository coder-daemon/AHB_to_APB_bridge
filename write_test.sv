class bridge_test extends uvm_test;
	`uvm_component_utils(bridge_test)

	bit has_ahb_master_agt_top = 1;
	bit has_apb_slave_agt_top = 1;
	bit has_scoreboard = 1;
	bit has_virtual_sequencer = 1;
	int no_of_ahb_agnts = 1;
	int no_of_apb_agnts = 1;
	apb_config apb_cfg[];
	ahb_config ahb_cfg[];
	env_config m_cfg;
	bridge_env envh;

	extern function new(string name = "bridge_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
endclass

function bridge_test::new(string name = "bridge_test",uvm_component parent);
	super.new(name,parent);
endfunction


function void bridge_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
	m_cfg = env_config::type_id::create("m_cfg");
	ahb_cfg = new[no_of_ahb_agnts];
	apb_cfg = new[no_of_apb_agnts];
	m_cfg.ahb_cfg = new[no_of_ahb_agnts];
	m_cfg.apb_cfg = new[no_of_apb_agnts];
	if(has_ahb_master_agt_top)
	begin
		foreach(ahb_cfg[i])
		begin
			ahb_cfg[i] = ahb_config::type_id::create($sformatf("ahb_cfg[%0d]",i),this);
			ahb_cfg[i].is_active = UVM_ACTIVE;
			if(!uvm_config_db #(virtual ahb_master_if)::get(this,"","ahb_master_if",ahb_cfg[i].vif))
				`uvm_fatal(get_type_name(),"Failed to get ahb_master_if from uvm_config_db. Have you set() it?");
			m_cfg.ahb_cfg[i] = ahb_cfg[i];
		end
	end
	if(has_apb_slave_agt_top)
	begin
		foreach(apb_cfg[i])
		begin
			apb_cfg[i] = apb_config::type_id::create($sformatf("apb_cfg[%0d]",i),this);
			apb_cfg[i].is_active = UVM_ACTIVE;
			if(!uvm_config_db #(virtual apb_slave_if)::get(this,"","apb_slave_if",apb_cfg[i].vif))
				`uvm_fatal(get_type_name(),"Failed to get apb_slave_if from uvm_config_db. Have you set() it?");
			m_cfg.apb_cfg[i] = apb_cfg[i];
		end
	end	
	m_cfg.has_ahb_master_agt_top = has_ahb_master_agt_top;
	m_cfg.has_apb_slave_agt_top = has_apb_slave_agt_top;
	m_cfg.has_scoreboard = has_scoreboard;
	m_cfg.has_virtual_sequencer = has_virtual_sequencer;
	m_cfg.no_of_ahb_agnts = no_of_ahb_agnts;
	m_cfg.no_of_apb_agnts = no_of_apb_agnts;
	uvm_config_db #(env_config)::set(this,"*","env_config",m_cfg);
	envh = bridge_env::type_id::create("envh",this); 
endfunction

function void bridge_test::end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology;
endfunction






class single_wtest extends bridge_test;
	`uvm_component_utils(single_wtest)
	single_vsequence vseqh;
	idle_vsequence ivseqh;

	extern function new(string name = "single_wtest",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

function single_wtest::new(string name = "single_wtest",uvm_component parent);
	super.new(name,parent);
endfunction

function void single_wtest::build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_config_db #(bit)::set(this,"*","bit",1);
endfunction

task single_wtest::run_phase(uvm_phase phase);
	phase.raise_objection(this);
	vseqh = single_vsequence::type_id::create("vseqh");
	ivseqh = idle_vsequence::type_id::create("ivseqh");
	vseqh.start(envh.vseqrh);
	ivseqh.start(envh.vseqrh);
	#150;
	phase.drop_objection(this);
endtask
