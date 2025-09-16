module ALU#(
	parameter N = 8
)
(
	input  logic [N-1:0] A, B,
	input  logic [1:0] ALUControl,
	output logic [N:0] Result,
	output logic V, C, Neg, Z
);

	
	always_comb
	begin
		case(ALUControl)
			2'b00 : Result = A + B; //add
			2'b01 : Result = A - B; // sub
			2'b10 : Result = A & B; // and
			2'b11 : Result = A | B; //or
		
		endcase
		
	end
	

	
	logic xn_out, x_out;
	
	always_comb
	begin
		if(ALUControl[1] == 0)
		begin
			xn_out = ~(ALUControl[0] ^ A[N-1] ^ B[N-1]);
			x_out = A[N-1] ^ Result[N-1];
			V = xn_out & x_out;
		end
		else
		begin
			V = 1'b0;
			xn_out = 1'b0;
			x_out = 1'b0;
		end
		C = Result[N] & ~ALUControl[1];
	end
	
	
	
	always_comb
	begin
		if(Result[N] == 1)
		Neg = 1'b1;
		else
		Neg = 1'b0;
	end
	
	always_comb
	begin
		if(Result == 0)
		Z = 1'b1;
		else
		Z = 1'b0;
	end
	
endmodule 