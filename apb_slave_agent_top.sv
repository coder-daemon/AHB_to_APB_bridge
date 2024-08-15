class apb_slave_agent_top extends uvm_env;
	`uvm_component_utils(apb_slave_agent_top)

	apb_slave_agent agnth[];
	env_config m_cfg;

	extern function new(string name = "apb_slave_agent_top",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
endclass

function apb_slave_agent_top::new(string name = "apb_slave_agent_top",uvm_component parent);
	super.new(name,parent);
endfunction

function void apb_slave_agent_top::build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_config_db #(env_config)::get(this,"","env_config",m_cfg);
	agnth = new[m_cfg.no_of_apb_agnts];
	foreach(m_cfg.apb_cfg[i])
	begin
		agnth[i] = apb_slave_agent::type_id::create($sformatf("agnth[%0d]",i),this);
		uvm_config_db #(apb_config)::set(this,$sformatf("agnth[%0d]*",i),"apb_config",m_cfg.apb_cfg[i]);
	end
endfunction
