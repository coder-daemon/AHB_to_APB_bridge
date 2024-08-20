class ahb_master_driver extends uvm_driver #(ahb_xtn);
	`uvm_component_utils(ahb_master_driver)
	virtual ahb_master_if.drv_mp vif;
	ahb_config m_cfg;

	extern function new(string name = "ahb_master_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task drive_to_bridge(ahb_xtn ahb_to_bridge);
	extern function void report_phase(uvm_phase phase);
endclass

function ahb_master_driver::new(string name = "ahb_master_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void ahb_master_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(ahb_config)::get(this,"","ahb_config",m_cfg))
		`uvm_fatal(get_full_name(),"Failed to get ahb_config from uvm_config_db. Have you set() it?");
endfunction

function void ahb_master_driver::connect_phase(uvm_phase phase);
	vif = m_cfg.vif;
endfunction

task ahb_master_driver::run_phase(uvm_phase phase);
	vif.drv_cb.hrstn <= 1'b0;
	//repeat(2)
		@(vif.drv_cb);
	vif.drv_cb.hrstn <= 1'b1;
	while(vif.drv_cb.hreadyout !== 1)
		@(vif.drv_cb);
	forever
	begin	
		seq_item_port.get_next_item(req);
		drive_to_bridge(req);
		seq_item_port.item_done();
	end
endtask

task ahb_master_driver::drive_to_bridge(ahb_xtn ahb_to_bridge);
	vif.drv_cb.haddr <= ahb_to_bridge.haddr;
	vif.drv_cb.hsize <= ahb_to_bridge.hsize;
	vif.drv_cb.hreadyin <= 1'b1;
	vif.drv_cb.htrans <= ahb_to_bridge.htrans;
	vif.drv_cb.hwrite <= ahb_to_bridge.hwrite;
	@(vif.drv_cb);		        
	while(vif.drv_cb.hreadyout!==1)
		@(vif.drv_cb);
	vif.drv_cb.hwdata <= ahb_to_bridge.hwdata;
	`uvm_info(get_type_name(),$sformatf("Transfer from AHB to bridge is\n%0p",ahb_to_bridge.sprint()),UVM_LOW);
	m_cfg.ahb_drv_sent_cnt++;
endtask

function void ahb_master_driver::report_phase(uvm_phase phase);
	`uvm_info(get_type_name(),$sformatf("no of transfers from ahb driver to bridge = %0d",m_cfg.ahb_drv_sent_cnt++),UVM_LOW);
endfunction
