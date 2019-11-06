//Controller

module Controller(
	input wire [31:0] instr,
	output reg reg_write,
	output reg reg_dest,
	output reg mem_reg_dst,
	output reg jump);
	
	always @* begin
		if (instr[31:26] == 6'b000000) begin
			reg_write = 1;
			mem_reg_dst = 0;
			reg_dest = 0;
			jump = 0;
			
			if (instr[5:0] == 6'b001000) begin
				jump = 1;
				reg_write = 0;
			end	
		end 
		
		else begin
			reg_write = 0;
		end
	end
endmodule