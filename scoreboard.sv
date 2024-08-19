class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)

	uvm_tlm_analysis_fifo #(ahb_xtn) ahb_fifo[];
	uvm_tlm_analysis_fifo #(apb_xtn) apb_fifo[];
	env_config m_cfg;
	ahb_xtn ahb_mon;
	apb_xtn apb_mon;

	covergroup ahb_cb;
		HSIZE : coverpoint ahb_mon.hsize {
					bins h_size = {[0:2]};}
		HTRANS: coverpoint ahb_mon.htrans {
					bins h_trans = {0,2,3};}
		HWRITE: coverpoint ahb_mon.hwrite;
		HADDR : coverpoint ahb_mon.haddr {
					bins h_addr_1 = {['h8000_0000:'h8000_03ff]};
					bins h_addr_2 = {['h8400_0000:'h8400_03ff]};
					bins h_addr_3 = {['h8800_0000:'h8800_03ff]};
					bins h_addr_4 = {['h8c00_0000:'h8c00_03ff]};}
		HBURST: coverpoint ahb_mon.hburst;
		HSIZE_X_HTRANS_X_HWRITE_HADDR: cross HSIZE,HTRANS,HWRITE,HADDR;
	endgroup

	covergroup apb_cb;
		PWRITE: coverpoint apb_mon.pwrite;
		PSELX : coverpoint apb_mon.pselx;
	endgroup

	extern function new(string name = "scoreboard",uvm_component parent);
	extern task run_phase(uvm_phase phase);
	extern task check_data(ahb_xtn ahb_mon,apb_xtn apb_mon);
endclass

function scoreboard::new(string name = "scoreboard",uvm_component parent);
	super.new(name,parent);
	if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal(get_full_name(),"Failed to get env_config from uvm_config_db. Have you set() it?");
	ahb_fifo = new[m_cfg.no_of_ahb_agnts];
	apb_fifo = new[m_cfg.no_of_apb_agnts];
	foreach(ahb_fifo[i])
		ahb_fifo[i] = new($sformatf("ahb_fifo[%0d]",i),this);
	foreach(apb_fifo[i])
		apb_fifo[i] = new($sformatf("apb_fifo[%0d]",i),this);
	ahb_cb = new();
	apb_cb = new();
endfunction

task scoreboard::run_phase(uvm_phase phase);
	forever
	begin
		fork
			ahb_fifo[0].get(ahb_mon);
			apb_fifo[0].get(apb_mon);
		join
		check_data(ahb_mon,apb_mon);
		ahb_cb.sample();
		apb_cb.sample();
	end
endtask

task scoreboard::check_data(ahb_xtn ahb_mon,apb_xtn apb_mon);
	if(ahb_mon.haddr == apb_mon.paddr)
	begin
		if(ahb_mon.hwrite)
		begin
			if(ahb_mon.hsize == 0)
			begin
				if(ahb_mon.haddr[1:0] == 2'b00)
				begin
					if(ahb_mon.hwdata[7:0] == apb_mon.pwdata[7:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b01)
				begin
					if(ahb_mon.hwdata[15:8] == apb_mon.pwdata[7:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b10)
				begin
					if(ahb_mon.hwdata[23:16] == apb_mon.pwdata[7:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b11)
				begin
					if(ahb_mon.hwdata[31:24] == apb_mon.pwdata[7:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
			end
			if(ahb_mon.hsize == 1)
			begin
				if(ahb_mon.haddr[1:0] == 2'b00)
				begin
					if(ahb_mon.hwdata[15:0] == apb_mon.pwdata[15:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b10)
				begin
					if(ahb_mon.hwdata[31:16] == apb_mon.pwdata[15:0])
						`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
				end
			end
			if(ahb_mon.hsize == 2)
			begin
				if(ahb_mon.hwdata == apb_mon.pwdata)
					`uvm_info(get_type_name(),"Write data transfer compared successfully",UVM_LOW)
				else
					`uvm_info(get_type_name(),"Write data transfer comparision failed",UVM_LOW)
			end
		end
		else
		begin
			if(ahb_mon.hsize == 0)
			begin
				if(ahb_mon.haddr[1:0] == 2'b00)
				begin
					if(ahb_mon.hrdata[7:0] == apb_mon.prdata[7:0])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b01)
				begin
					if(ahb_mon.hrdata[7:0] == apb_mon.prdata[15:8])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b10)
				begin
					if(ahb_mon.hrdata[7:0] == apb_mon.prdata[23:16])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b11)
				begin
					if(ahb_mon.hrdata[7:0] == apb_mon.prdata[31:24])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
			end
			if(ahb_mon.hsize == 1)
			begin
				if(ahb_mon.haddr[1:0] == 2'b00)
				begin
					if(ahb_mon.hrdata[15:0] == apb_mon.prdata[15:0])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
				if(ahb_mon.haddr[1:0] == 2'b10)
				begin
					if(ahb_mon.hrdata[15:0] == apb_mon.prdata[31:16])
						`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
					else
						`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
				end
			end
			if(ahb_mon.hsize == 2)
			begin
				if(ahb_mon.hrdata == apb_mon.prdata)
					`uvm_info(get_type_name(),"Read data transfer compared successfully",UVM_LOW)
				else
					`uvm_info(get_type_name(),"Read data transfer comparision failed",UVM_LOW)
			end
		end
	end
	else
		`uvm_info(get_type_name(),"address comparision failed",UVM_LOW)
endtask
