// EX_MEM.v

module EX_MEM(
	input wire clock,
	input wire [31:0] RT_in,
	input wire [31:0] D2_in,
	input wire [4:0]  RD_in,
	
	output reg [31:0] RT_out,
	output reg [31:0] D2_out,
	output reg [4:0]  RD_out);

	always @(posedge clock) begin
		RT_out <= RT_in;
		D2_out <= D2_in;
		RD_out <= RD_in;
	end
endmodule
