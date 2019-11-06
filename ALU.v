// ALU.v

module ALU(
	input wire clock,
	input wire [31:0] RS_in,
	input wire [31:0] RT_in,
	input wire [31:0] inst,
	
	output reg [31:0] data_out);

	reg [31:0] RS_out;
	reg [31:0] RT_out;
	integer i;
	integer sa;
	
	always @(negedge clock) begin
		sa = inst[10:6];
			
		if(inst[31:26] == 6'b000000) begin
			// add
			if(inst[5:0] == 6'b100000) begin
				data_out <= RS_in + RT_in;
			end
						
			// addu
			if(inst[5:0] == 6'b100001) begin
				data_out <= RS_in + RT_in;
				/*if(RS_in[31] == 1) begin
					RS_out = ~RS_in + 1;
				end
				if(RT_in[31] == 1) begin
					RT_out = ~RT_in + 1;
				end
				data_out <= RS_out + RT_out; */
			end		
			
			// sub
			if(inst[5:0] == 6'b100010) begin
				 data_out <= RS_in - RT_in;
			end		
		
			// subu
			if(inst[5:0] == 6'b100011) begin
				data_out <= RS_in - RT_in;
				/*if(RS_in[31] == 1) begin
					RS_out = ~RS_in[31:0] + 1;
				end
				if(RT_in[31] == 1) begin
					RT_out = ~RT_in[31:0] + 1;
				end
				data_out <= RS_out - RT_out; */
			end		
		
			// and
			if(inst[5:0] == 6'b100100) begin
				data_out <= RS_in & RT_in;
			end		
		
			// or
			if(inst[5:0] == 6'b100101) begin
				data_out <= RS_in | RT_in;
			end		
		
			// nor
			if(inst[5:0] == 6'b100111) begin
				data_out <= ~(RS_in | RT_in);
			end

			// slt
			if(inst[5:0] == 6'b101010) begin
					if(RS_in < RT_in) begin
						data_out <= 0;
					end else begin
						data_out <= 1;
					end
			end	

			// sll
			if(inst[5:0] == 6'b000000) begin
				data_out <= RT_in << sa;
			end
			
			// srl
			if(inst[5:0] == 6'b000010) begin
				data_out <= RT_in >> sa;
			end
		
			// sra
			if(inst[5:0] == 6'b000011) begin
				if(RT_in[31] == 0) begin
					data_out <= RT_in >> sa;
				end else begin
					data_out <= RT_in >> sa;
					for(i = 0; i < sa; i = i + 1) begin
						data_out[31-i] <= 1;
					end
				end
			end		
		
			// jr
			if(inst[5:0] == 6'b001000) begin
				data_out <= 32'h0000;
			end		
		
			// nop
			if((sa == 0) && (inst[5:0] == 6'b000000)) begin
				data_out <= 32'h0000;
			end
		end
	end
endmodule
	