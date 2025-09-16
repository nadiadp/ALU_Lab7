module mult4(
input logic [3:0]A,
input logic [3:0]B,
output logic [7:0]PP
);

logic [4:0] layer1, layer2, layer3, layer4;


ppcell row0(.input1(A), .B(B[0]), .PPin(), .PP(layer1));
assign PP[0] = layer1[0];

ppcell row1(.input1(A), .B(B[1]), .PPin(layer1[4:1]), .PP(layer2));
assign PP[1] = layer2[0];

ppcell row2(.input1(A), .B(B[2]), .PPin(layer2[4:1]), .PP(layer3));
assign PP[2] = layer3[0];

ppcell row3(.input1(A), .B(B[3]), .PPin(layer3[4:1]), .PP(layer4));

assign PP[3] = layer4[0];
assign PP[4] = layer4[1];
assign PP[5] = layer4[2];
assign PP[6] = layer4[3];
assign PP[7] = layer4[4];

endmodule