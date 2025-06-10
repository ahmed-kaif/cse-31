module Adder1Bit(
    input A,
    input B,
    input Cin,
    output S,
    output C_out
);

assign S = A ^ B ^ Cin;
assign C_out = (A & B) + ((A ^ B) & Cin);
endmodule
