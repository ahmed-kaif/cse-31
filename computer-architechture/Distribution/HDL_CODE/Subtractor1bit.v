module Subtractor1bit (
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);
assign D = A ^ B ^ Bin;
assign Bout = (B & Bin) | (!A & B) | (!A & Bin); 
endmodule