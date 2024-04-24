module lfsr(seed, clk, reset, shift_seed);
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits

//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

input logic [15:0] seed;
input logic clk;
input logic reset;
logic _xnor_;
output logic [15:0] shift_seed;

@(posedge clk)
    begin
        assign _xnor_ =~seed[14]^
        ~seed[12]^~seed[3];
        assign shift_seed ={seed[14:0], _xnor_};
    end
endmodule

module lfsr64 (seed, clk, reset, shift_seed);
//inputs and outputs for the full seed size (64 bits)

//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

input logic [63:0] seed;
input logic clk;
input logic reset;
logic _xnor_;
output logic [63:0] shift_seed;

@(posedge clk)
    begin
        assign _xnor_ =~seed[62]^
        ~seed[60]^~seed[59];
        assign shift_seed ={seed[62:0], _xnor_};
    end
endmodule