// EX_MEM.v

module EX_MEM(
	input wire clock,
	input wire [31:0] ALU_in,
	input wire [4:0]	RD_in,
	input wire reg_write_in,
	input wire reg_dst_in,
	input wire mem_dst_in,
	
	output reg [31:0] ALU_out,
	output reg [4:0]  RD_out,
	output reg reg_write_out,
	output reg reg_dst_out,
	output reg mem_dst_out);
	
	always @(posedge clock) begin
		ALU_out <= ALU_in;
		RD_out <= RD_in;
		reg_write_out <= reg_write_in;
		reg_dst_out <= reg_dst_in;
		mem_dst_out <= mem_dst_in;
	end
endmodule
