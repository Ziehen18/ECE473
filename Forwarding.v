//Forwarding

module Forwarding(
	input wire [4:0] rs_in,
	input wire [4:0] rt_in,
	input wire [4:0] ex_mem_dest,
	input wire [4:0] mem_wb_dest,
	input wire ex_mem_write,
	input wire mem_wb_write,
	
	output reg [1:0] mux1_fwd,
	output reg [1:0] mux2_fwd);
	
	always @* begin
		mux1_fwd = 2'b00;
		mux2_fwd = 2'b00;
		if (ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rs_in)) begin
			mux1_fwd = 2'b01;
		end
		if (mem_wb_write && (mem_wb_dest != 0) && !(ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rs_in)) && (mem_wb_dest == rs_in)) begin
			mux1_fwd = 2'b10;
		end
		
		
		if (ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rt_in)) begin
			mux2_fwd = 2'b01;
		end
		if (mem_wb_write && (mem_wb_dest != 0) && !(ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rt_in)) && (mem_wb_dest == rt_in)) begin
			mux2_fwd = 2'b10;
		end
	end
endmodule
	