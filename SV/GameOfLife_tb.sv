`timescale 1ns / 1ps
module tb ();
logic [63:0] initial_seed;
logic en, start;
logic clk, reset, resetAll;
logic [63:0] c_output;

GameOfLifeFSM GOL (initial_seed, reset, resetAll, start, en, clk, c_output);
initial
    begin
        clk = 1'b1;
        forever #10 clk = ~clk;
    end

integer handle3;
integer desc3;

always @(negedge clk)
    begin
        $fdisplay(desc3, "%b %b || %b", initial_seed, en, c_output);
    end

initial
    begin
        handle3= $fopen("GameOfLife.out");
        desc3 = handle3;
        #2500 $finish;
    end

initial
    begin
        #0 initial_seed = 64'b1001110110011101100111011001110110011101100111011001110110011101;
        #0 reset = 1'b1;
        #0 en = 1'b0;
        #0 resetAll = 1'b1;
        #0 start = 1'b0;
        #5 reset = 1'b0;
        
        #0 reset = 1'b0;
        #10 reset = 1'b1;
        #25 reset = 1'b0;
        #625 start = 1'b1;
        #25 en = 1'b1;
    end

endmodule