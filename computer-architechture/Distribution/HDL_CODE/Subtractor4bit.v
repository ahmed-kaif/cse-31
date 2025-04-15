module Subtractor4bit (
    input [3:0] A,
    input [3:0] B,
    input Bin,
    output [3:0] D,
    output Bout
);

wire Bin1, Bin2, Bin3;
Subtractor1bit cir1(A[0], B[0], Bin,  D[0], Bin1);
Subtractor1bit cir2(A[1], B[1], Bin1, D[1], Bin2);
Subtractor1bit cir3(A[2], B[2], Bin2, D[2], Bin3);
Subtractor1bit cir4(A[3], B[3], Bin3, D[3], Bout);

endmodule