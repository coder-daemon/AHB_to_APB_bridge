//single transfer


class single_sequence extends ahb_master_sequence;
	`uvm_object_utils(single_sequence)
	bit we;
	extern function new(string name = "single_sequence");
	extern task body();
endclass

function single_sequence::new(string name = "single_sequence");
	super.new(name);
endfunction

task single_sequence::body();
	super.body;
	if(!uvm_config_db #(bit)::get(null,get_full_name(),"bit",we))
		`uvm_fatal(get_type_name(),"Failed to get hwrite")
	req = ahb_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {htrans==2;hburst==0;hwrite==we;})
	finish_item(req);
endtask
