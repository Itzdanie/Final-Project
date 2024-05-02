module GameOfLife(seed, reset, en, clock, cur_state);
input logic reset, clock, en;
input logic [63:0] seed;
output logic [63:0] cur_state;
logic [63:0] next_gen;

flopenr flop(clock, reset, en, next_gen, seed, cur_state);
datapath data(cur_state, next_gen);

endmodule