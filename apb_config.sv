class apb_config extends uvm_object;
	`uvm_object_utils(apb_config)

	virtual apb_slave_if vif;
	uvm_active_passive_enum is_active;
	int apb_mon_rcvd_cnt;
	int apb_drv_sent_cnt;

	extern function new(string name = "apb_config");
endclass

function apb_config::new(string name = "apb_config");
	super.new(name);
endfunction
