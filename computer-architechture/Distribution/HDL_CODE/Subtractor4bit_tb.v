`timescale 1ns/1ps

module Subtractor4bit_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg Bin;
    wire [3:0] D;
    wire Dout;

    Subtractor4bit uut(A, B, Bin, D, Bout);
    initial begin
        $dumpfile("test_sub4bit.vcd");
        $dumpvars(0, Subtractor4bit_tb);

        Bin = 1'b0;
        A = 4'b0000;
        B = 4'b0000;

        #20;
        Bin = 1'b0;
        A = 4'b0001;
        B = 4'b0010;

        #20;
        Bin = 1'b0;
        A = 4'b1100;
        B = 4'b1110;


        #20;
        Bin = 1'b1;
        A = 4'b0000;
        B = 4'b0000;

        #20;
        Bin = 1'b1;
        A = 4'b0000;
        B = 4'b0011;

        #20;
        Bin = 1'b0;
        A = 4'b0110;
        B = 4'b0011;
       
        #20;
        Bin = 1'b0;
        A = 4'b1111;
        B = 4'b0011;


        $finish;
    end

    initial begin
        $monitor("A = %b, B=%b, Bin=%b, D =%b, Bout =%b\n", A, B, Bin, D, Bout);
    end
endmodule