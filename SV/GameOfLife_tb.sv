`timescale 1ns / 1ps;
module tb ();
logic [63:0] a;
logic en;
logic clk;
logic reset;
logic [63:0] c_output;

GameOfLife GOL (a, reset, en, clk, c_output);
initial
begin
    clk = 1'b1;
    forever #10 clk = ~clk;
end

integer handle3;
integer desc3;

initial
    begin
    handle3= $fopen("GameOfLife.out");
    desc3 = handle3;
    #1250 $finish;
    end

initial
    begin
        a = 64'b1001110110011101100111011001110110011101100111011001110110011101;
        en = 1'b1;
        reset = 1'b1;
        begin
            @(posedge clk)
            begin
                reset = 1'b0;
            end
            @(negedge clk)
            begin
                $fdisplay(desc3, "%b || %b", a[63:56] c_output[63:56]);
                $fdisplay(desc3, "%b || %b", a[55:48] c_output[55:48]);
                $fdisplay(desc3, "%b || %b", a[47:40] c_output[47:40]);
                $fdisplay(desc3, "%b || %b", a[39:32] c_output[39:32]);
                $fdisplay(desc3, "%b || %b", a[31:24] c_output[31:24]);
                $fdisplay(desc3, "%b || %b", a[23:16] c_output[23:16]);
                $fdisplay(desc3, "%b || %b", a[15:8] c_output[15:8]);
                $fdisplay(desc3, "%b || %b", a[7:0] c_output[7:0]);
            end
        end
    end

endmodule