module ppcell(
input logic [3:0]input1,
input logic B,
input logic [3:0]PPin,
output logic [4:0]PP
);

logic [3:0]A;
logic Cin;
assign Cin = 1'b0; 
  
assign  A[0] = input1[0] & B;
assign  A[1] = input1[1] & B;
assign  A[2] = input1[2] & B;
assign  A[3] = input1[3] & B;




adder4 am_cell(.A(A), .B(PPin), .C0(Cin), .S(PP[3:0]), .C4(PP[4]));


endmodule