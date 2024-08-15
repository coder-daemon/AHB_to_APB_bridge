class apb_slave_driver extends uvm_driver #(apb_xtn);
	`uvm_component_utils(apb_slave_driver)

	virtual apb_slave_if.drv_mp vif;
	apb_config m_cfg;

	int busy = 1;
	int ending = 0;

	extern function new(string name = "apb_slave_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task drive_to_bridge();
	extern function void report_phase(uvm_phase phase);
	//extern function void phase_ready_to_end(uvm_phase phase);
endclass

function apb_slave_driver::new(string name = "apb_slave_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void apb_slave_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(apb_config)::get(this,"","apb_config",m_cfg))
		`uvm_fatal(get_full_name(),"Failed to get apb_config from uvm_config_db. Have you set() it?");
endfunction

function void apb_slave_driver::connect_phase(uvm_phase phase);
	vif = m_cfg.vif;
endfunction

task apb_slave_driver::run_phase(uvm_phase phase);
	forever
	begin
		drive_to_bridge();
		/*if(ending)
		begin
			busy = 0;
			phase.drop_objection(this);
		end*/
	end
endtask

task apb_slave_driver::drive_to_bridge();
	while(vif.drv_cb.pselx == 0)
		@(vif.drv_cb);
	//$display("vif.drv_cb.pselx = %0d",vif.drv_cb.pselx);
	if(vif.drv_cb.pwrite == 0)
		vif.drv_cb.prdata <= $random;
	else
		vif.drv_cb.prdata <= 'bz;

	repeat(2)
		@(vif.drv_cb);
	m_cfg.apb_drv_sent_cnt++;
endtask

function void apb_slave_driver::report_phase(uvm_phase phase);
	`uvm_info(get_type_name(),$sformatf("no of transfers from apb driver to bridge is %0d",m_cfg.apb_drv_sent_cnt),UVM_LOW);
endfunction

/*function void apb_slave_driver::phase_ready_to_end(uvm_phase phase);
	if(phase.get_name == "run")
	begin
		ending = 1;
		if(busy)
			phase.raise_objection(this);
	end
endfunction*/
