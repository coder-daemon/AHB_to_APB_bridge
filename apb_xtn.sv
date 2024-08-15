class apb_xtn extends uvm_sequence_item;
	`uvm_object_utils(apb_xtn)

	bit [31:0] prdata;
	bit [31:0] pwdata;
	bit [31:0] paddr;
	bit pwrite;
	bit penable;
	bit [3:0] pselx;

	extern function new(string name = "apb_xtn");
	extern function void do_copy(uvm_object rhs);
	extern function bit do_compare(uvm_object rhs,uvm_comparer comparer);
	extern function void do_print(uvm_printer printer);
endclass

function apb_xtn::new(string name = "apb_xtn");
	super.new(name);
endfunction

function void apb_xtn::do_copy(uvm_object rhs);
	apb_xtn rhs_;
	if(!$cast(rhs_,rhs))
		`uvm_fatal("do_copy","cast of rhs object failed for apb_xtn");
	super.do_copy(rhs);
	this.prdata = rhs_.prdata;
	this.pwdata = rhs_.pwdata;
	this.paddr = rhs_.paddr;
	this.pwrite = rhs_.pwrite;
	this.penable = rhs_.penable;
	this.pselx = rhs_.pselx;
endfunction

function bit apb_xtn::do_compare(uvm_object rhs,uvm_comparer comparer);
	apb_xtn rhs_;
	if(!$cast(rhs_,rhs))
		`uvm_fatal("do_compare","cast of rhs object failed for apb_xtn");
	return super.do_compare(rhs,comparer) && prdata==rhs_.prdata && pwdata==rhs_.pwdata && paddr==rhs_.pwdata && pwrite==rhs_.pwrite && penable==rhs_.penable && pselx==rhs_.pselx;
endfunction

function void apb_xtn::do_print(uvm_printer printer);
	super.do_print(printer);
	printer.print_field("prdata",this.prdata,32,UVM_HEX);
	printer.print_field("pwdata",this.pwdata,32,UVM_HEX);
	printer.print_field("paddr",this.paddr,32,UVM_HEX);
	printer.print_field("pwrite",this.pwrite,1,UVM_DEC);
	printer.print_field("penable",this.penable,1,UVM_DEC);
	printer.print_field("pselx",this.pselx,4,UVM_DEC);
endfunction
