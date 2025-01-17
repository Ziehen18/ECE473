// pc_counter.v

module pc_counter(
	input wire clock,
	input wire jump,
	input wire [31:0] location,
	
	output reg [31:0] pc);
		
	initial begin
		pc = -1;
	end
	
	always @(posedge clock) begin
		pc = pc + 1;
		
		if (jump == 1) begin
			pc <= location[31:0];
		end
		
		
	end
endmodule
	