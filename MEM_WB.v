// MEM_WB.v

module MEM_WB(
	input wire clock,
	input wire [31:0] D2_in,
	input wire [4:0]  RD_in,
	input wire reg_write_in,
	input wire mem_dst_in,
	input wire [31:0] ALU_in,
	
	output reg [31:0] D2_out,
	output reg [31:0] ALU_out,
	output reg mem_dst_out,
	output reg reg_write_out,
	output reg [4:0]  RD_out);

	always @(posedge clock) begin
		reg_write_out <= reg_write_in;
		ALU_out <= ALU_in;
		mem_dst_out <= mem_dst_in;
		D2_out <= D2_in;
		RD_out <= RD_in;
	end
	
endmodule
