`timescale 1ns/1ps

module Subtractor1bit_tb();
    reg A;
    reg B;
    reg Bin;
    wire D;
    wire Bout;

    Subtractor1bit uut(A, B, Bin, D, Bout);
    initial begin
        $dumpfile("test_sub1bit.vcd");
        $dumpvars(0, Subtractor1bit_tb);

        Bin = 1'b0;
        A = 1'b0;
        B = 1'b0;

        #20;
        Bin = 1'b0;
        A = 1'b0;
        B = 1'b1;

        #20;
        Bin = 1'b0;
        A = 1'b1;
        B = 1'b0;

        #20;
        Bin = 1'b0;
        A = 1'b1;
        B = 1'b1;

        #20;
        Bin = 1'b1;
        A = 1'b0;
        B = 1'b0;

        #20;
        Bin = 1'b1;
        A = 1'b0;
        B = 1'b1;

        #20;
        Bin = 1'b1;
        A = 1'b1;
        B = 1'b0;

        #20;
        Bin = 1'b1;
        A = 1'b1;
        B = 1'b1;

        $finish;
    end

    initial begin
        $monitor("A = %b, B=%b, Bin = %b, D =%b, Bout =%b\n",A, B, Bin, D, Bout);
    end
endmodule