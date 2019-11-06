// ID_EX.v

module ID_EX(
	input wire clock,
	input wire [31:0] RS_in,
	input wire [31:0] RT_in,
	input wire [4:0]	RD_in,
	input wire jump_in,
	input wire reg_write_in,
	input wire reg_dst_in,
	input wire mem_dst_in,
	input wire [31:0] instr_in,
	
	output reg [31:0] RS_out,
	output reg [31:0] RT_out,
	output reg [4:0]  RD_out,
	output reg jump_out,
	output reg reg_write_out,
	output reg reg_dst_out,
	output reg mem_dst_out,
	output reg [31:0] instr_out
	);
	
	always @(posedge clock) begin
		RS_out <= RS_in;
		RT_out <= RT_in;
		RD_out <= RD_in;
		jump_out <= jump_in;
		reg_write_out <= reg_write_in;
		reg_dst_out <= reg_dst_in;
		mem_dst_out <= mem_dst_in;
		instr_out <= instr_in;
	end
endmodule
