module controller(
	input logic CLKb,
	output logic enA, enC, enALU
);

	/*
	* create a sequential controller
	* 	need a counter to keep track of current step (sequential logic!) - always_ff
	*	need a combinational logic circuit to assign outputs based on current step - always_comb
	*/
	
typedef enum logic [1:0] {
	STEP0 = 2'b00,
	STEP1 = 2'b01
} step;

step current_step, next_step;
	
always_ff @(posedge CLKb)
begin
	current_step <= next_step;
end

always_comb
begin
	enA = 0;
	enC = 0;
	enALU = 0;
	
	case (current_step)
		STEP0:
		begin
			enA = 1;
			enALU = 1;
			next_step = STEP1;
		end
		STEP1:
		begin
			enC = 1;
			next_step = STEP0;
		end
		default:
		begin
			next_step = current_step;
		end
	endcase
end

endmodule 