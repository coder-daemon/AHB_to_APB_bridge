class ahb_master_monitor extends uvm_monitor;
	`uvm_component_utils(ahb_master_monitor)

	ahb_config m_cfg;
	virtual ahb_master_if.mon_mp vif;
	uvm_analysis_port #(ahb_xtn) monitor_port;

	int busy = 1;
	int ending = 0;
	bit wr_notrd;

	extern function new(string name = "ahb_master_monitor",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task collect_data();
	extern function void report_phase(uvm_phase phase);
	//extern function void phase_ready_to_end(uvm_phase phase);
endclass

function ahb_master_monitor::new(string name = "ahb_master_monitor",uvm_component parent);
	super.new(name,parent);
	monitor_port = new("monitor_port",this);
endfunction

function void ahb_master_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(ahb_config)::get(this,"","ahb_config",m_cfg))
		`uvm_fatal(get_type_name(),"Failed to get ahb_config from uvm_config_db. Have you set() it?");
endfunction

function void ahb_master_monitor::connect_phase(uvm_phase phase);
	vif = m_cfg.vif;
endfunction

task ahb_master_monitor::run_phase(uvm_phase phase);
	while(vif.mon_cb.hreadyout !== 1)
		@(vif.mon_cb);
	forever
	begin
		collect_data();
		/*if(ending)
		begin
			busy = 0;
			phase.drop_objection(this);
		end*/
	end
endtask

task ahb_master_monitor::collect_data();
	ahb_xtn ahb_mon = ahb_xtn::type_id::create("ahb_mon");
	//wait(vif.mon_cb.htrans==2 || vif.mon_cb.htrans==3);
		//@(vif.mon_cb);
	while(vif.mon_cb.htrans!==2 && vif.mon_cb.htrans!==3)
		@(vif.mon_cb);
	ahb_mon.haddr = vif.mon_cb.haddr;
	ahb_mon.hsize = vif.mon_cb.hsize;
	ahb_mon.htrans = vif.mon_cb.htrans;
	ahb_mon.hwrite = vif.mon_cb.hwrite;
	//ahb_mon.hreadyin = vif.mon_cb.hreadyin;
	//ahb_mon.hreadyout = vif.mon_cb.hreadyout;
	
	if(vif.mon_cb.hwrite)
		wr_notrd = 1'b1;
	else
		wr_notrd = 1'b0;
	@(vif.mon_cb);
	while(vif.mon_cb.hreadyout !== 1)
		@(vif.mon_cb);
	if(wr_notrd)
		ahb_mon.hwdata = vif.mon_cb.hwdata;
	else
		ahb_mon.hrdata = vif.mon_cb.hrdata;
/*	if(vif.mon_cb.hwrite)
		ahb_mon.hwdata = vif.mon_cb.hwdata;
	else
		ahb_mon.hrdata = vif.mon_cb.hrdata;
*/
	ahb_mon.hresp = vif.mon_cb.hresp;
	m_cfg.ahb_mon_rcvd_cnt++;
	monitor_port.write(ahb_mon);
	`uvm_info(get_type_name(),$sformatf("Transfer from ahb master is\n%0p",ahb_mon.sprint()),UVM_LOW);
	
endtask

function void ahb_master_monitor::report_phase(uvm_phase phase);
	`uvm_info(get_type_name(),$sformatf("no of transfers received = %0d",m_cfg.ahb_mon_rcvd_cnt),UVM_LOW);
endfunction

/*function void ahb_master_monitor::phase_ready_to_end(uvm_phase phase);
	if(phase.get_name == "run")
	begin
		ending = 1;
		if(busy)
			phase.raise_objection(this);
	end
endfunction*/
