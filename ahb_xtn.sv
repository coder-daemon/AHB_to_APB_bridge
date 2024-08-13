class ahb_xtn extends uvm_sequence_item;
	`uvm_object_utils(ahb_xtn)

	rand bit [1:0] htrans;
	rand bit [2:0] hsize;
	rand bit [2:0] hburst;
	rand bit [31:0] hwdata;
	rand bit [31:0] haddr;
	//rand bit [4:0] burst_len;  
	rand bit [10:0] burst_len;
	bit [31:0] hrdata;
	bit [1:0] hresp;
	//bit hreadyout;
	//bit hreadyin;
	rand bit hwrite;
	
	constraint ahbsize{hsize inside {[0:2]};}
	constraint addresslanes{if(hsize == 1)
				haddr[0] == 1'b0;
			   if(hsize == 2)
				haddr[1:0] == 2'b00;}
	constraint address{haddr inside {['h8000_0000:'h8000_03ff],
					 ['h8400_0000:'h8400_03ff],
					 ['h8800_0000:'h8800_03ff],
					 ['h8c00_0000:'h8c00_03ff]};}
	constraint burst_length{if(hburst == 0)
					burst_len == 1;
				if(hburst == 2 || hburst == 3)
					burst_len == 4; 
				if(hburst == 4 || hburst == 5)
					burst_len == 8;
				if(hburst ==6 || hburst == 7)
					burst_len ==16;}
	constraint boundary{haddr%1024+(burst_len*(1<<hsize))<=1024;}
	
	extern function new(string name = "ahb_xtn");
	extern function void do_copy(uvm_object rhs);
	extern function bit do_compare(uvm_object rhs,uvm_comparer comparer);
	extern function void do_print(uvm_printer printer);
endclass
function ahb_xtn::new(string name = "ahb_xtn");
	super.new(name);
endfunction

function void ahb_xtn::do_copy(uvm_object rhs);
	ahb_xtn rhs_;
	if(!$cast(rhs_,rhs))
		`uvm_fatal("do_copy","cast of rhs object failed for ahb_xtn");
	super.do_copy(rhs);
	this.htrans = rhs_.htrans;
	this.hsize = rhs_.hsize;
	this.hburst = rhs_.hburst;
	this.hwdata = rhs_.hwdata;
	this.haddr = rhs_.haddr;
	this.hrdata = rhs_.hrdata;
	this.hresp = rhs_.hresp;
	//this.hreadyout = rhs_.hreadyout;
	//this.hreadyin = rhs_.hreadyin;
	this.hwrite = rhs_.hwrite;
	this.burst_len = rhs_.burst_len;
endfunction

function bit ahb_xtn::do_compare(uvm_object rhs,uvm_comparer comparer);
	ahb_xtn rhs_;
	if(!$cast(rhs_,rhs))
		`uvm_fatal("do_compare","cast of rhs object failed for ahb_xtn");
	return super.do_compare(rhs,comparer) && htrans==rhs_.htrans && hsize==rhs_.hsize && hburst==rhs_.hburst && hwdata==rhs_.hwdata && haddr==rhs_.haddr && hrdata==rhs_.hrdata && hresp==rhs_.hresp && hwrite==rhs_.hwrite;
endfunction

function void ahb_xtn::do_print(uvm_printer printer);
	super.do_print(printer);
	printer.print_field("htrans",this.htrans,2,UVM_DEC);
	printer.print_field("hsize",this.hsize,3,UVM_DEC);
	printer.print_field("hburst",this.hburst,3,UVM_DEC);
	printer.print_field("hwdata",this.hwdata,32,UVM_HEX);
	printer.print_field("haddr",this.haddr,32,UVM_HEX);
	printer.print_field("hrdata",this.hrdata,32,UVM_HEX);
	printer.print_field("hresp",this.hresp,2,UVM_DEC);
	//printer.print_field("hreadyout",this.hreadyout,1,UVM_DEC);
	//printer.print_field("hreadyin",this.hreadyin,1,UVM_DEC);
	printer.print_field("hwrite",this.hwrite,1,UVM_DEC);
	printer.print_field("burst_len",this.burst_len,5,UVM_DEC);
endfunction


class ahb_err_xtn extends ahb_xtn;
	`uvm_object_utils(ahb_err_xtn)

	constraint address{haddr inside {['h8d00_0000:'h8d00_03ff]};}
	constraint addresslanes{if(hsize == 1)
				haddr[0] == 1'b1;
			   if(hsize == 2)
				haddr[1:0] == 2'b10;}

	extern function new(string name = "ahb_err_xtn");
endclass

function ahb_err_xtn::new(string name = "ahb_err_xtn");
	super.new(name);
endfunction
