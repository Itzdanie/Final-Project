module GameOfLife(seed, reset, en, clock, cstate);
input logic reset, clock, en;
input logic [63:0] seed;
output logic [63:0] cstate;
logic [63:0] pre_gen;
logic [63:0] next_gen;

assign pre_gen = reset ? seed : cstate;
flopenr flop(clock, reset, en, next_gen, seed, cstate);
datapath data(pre_gen, next_gen);

endmodule