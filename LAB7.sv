


module LAB7(
input logic [3:0]A,
input logic [3:0]B,
input logic [1:0]ALUcontrol,
input logic CLKb, CLK50M,
output logic [6:0] A0, A1, B0, B1, C0, C1,
output logic V, C, Neg, Z
);

logic [7:0] product;




seven_seg seg1(.D(product[3:0]), .S(P1));
seven_seg seg2(.D(product[7:4]), .S(P2));


endmodule