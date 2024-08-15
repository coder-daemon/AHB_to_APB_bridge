class apb_slave_monitor extends uvm_monitor;
	`uvm_component_utils(apb_slave_monitor)

	apb_config m_cfg;
	virtual apb_slave_if.mon_mp vif;
	uvm_analysis_port #(apb_xtn) monitor_port;

	int busy = 1;
	int ending = 0;

	extern function new(string name = "apb_slave_monitor",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task collect_data();
	extern function void report_phase(uvm_phase phase);
	//extern function void phase_ready_to_end(uvm_phase phase);
endclass

function apb_slave_monitor::new(string name = "apb_slave_monitor",uvm_component parent);
	super.new(name,parent);
	monitor_port = new("monitor_port",this);
endfunction

function void apb_slave_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(apb_config)::get(this,"","apb_config",m_cfg))
		`uvm_fatal(get_full_name(),"Failed to get apb_config from uvm_config_db. Have you set() it?");
endfunction

function void apb_slave_monitor::connect_phase(uvm_phase phase);
	vif = m_cfg.vif;
endfunction

task apb_slave_monitor::run_phase(uvm_phase phase);
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

task apb_slave_monitor::collect_data();
	apb_xtn apb_mon = apb_xtn::type_id::create("apb_mon");
   		//$display("%0p",vif);
	while(vif.mon_cb.penable !== 1)
		@(vif.mon_cb);
	//$display("%0p",vif);
	apb_mon.paddr = vif.mon_cb.paddr;
	apb_mon.pwrite = vif.mon_cb.pwrite;
	apb_mon.pselx = vif.mon_cb.pselx;
	if(vif.mon_cb.pwrite)
		apb_mon.pwdata = vif.mon_cb.pwdata;
	else
		apb_mon.prdata = vif.mon_cb.prdata;
      repeat(2)
 	@(vif.mon_cb);

	monitor_port.write(apb_mon);
	m_cfg.apb_mon_rcvd_cnt++;
	`uvm_info(get_type_name(),$sformatf("Transfer to APB Slave\n%0p",apb_mon.sprint()),UVM_LOW);
endtask

function void apb_slave_monitor::report_phase(uvm_phase phase);
	`uvm_info(get_type_name(),$sformatf("no of transfers monitored = %0d",m_cfg.apb_mon_rcvd_cnt),UVM_LOW);
endfunction

/*function void apb_slave_monitor::phase_ready_to_end(uvm_phase phase);
	if(phase.get_name == "run")
	begin
		ending = 1;
		if(busy)
			phase.raise_objection(this);
	end
endfunction*/
