class bridge_env extends uvm_env;
	`uvm_component_utils(bridge_env)

	ahb_master_agent_top ahb_agnt_top;
	apb_slave_agent_top apb_agnt_top;
	scoreboard sb;
	env_config m_cfg;
	virtual_sequencer vseqrh;

	extern function new(string name = "bridge_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
endclass

function bridge_env::new(string name = "bridge_env",uvm_component parent);
	super.new(name,parent);
endfunction

function void bridge_env::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal(get_type_name(),"Failed to get env_config from uvm_config_db. Have you set it?");
	if(m_cfg.has_ahb_master_agt_top)
		ahb_agnt_top = ahb_master_agent_top::type_id::create("ahb_agnt_top",this);
	if(m_cfg.has_apb_slave_agt_top)
		apb_agnt_top = apb_slave_agent_top::type_id::create("apb_agnt_top",this);
	if(m_cfg.has_scoreboard)
		sb = scoreboard::type_id::create("sb",this);
	if(m_cfg.has_virtual_sequencer)
		vseqrh = virtual_sequencer::type_id::create("vseqrh",this);
endfunction

function void bridge_env::connect_phase(uvm_phase phase);
	if(m_cfg.has_virtual_sequencer)
	begin
		for(int i=0;i<m_cfg.no_of_ahb_agnts;i++)
			vseqrh.ahb_seqrh[i] = ahb_agnt_top.agnth[i].seqrh;
	end
	if(m_cfg.has_scoreboard)
	begin
		for(int i=0;i<m_cfg.no_of_ahb_agnts;i++)
			ahb_agnt_top.agnth[i].monh.monitor_port.connect(sb.ahb_fifo[i].analysis_export);
		for(int i=0;i<m_cfg.no_of_apb_agnts;i++)
			apb_agnt_top.agnth[i].monh.monitor_port.connect(sb.apb_fifo[i].analysis_export);
	end
endfunction
