module GameOfLifeFSM(seed, reset, resetAll, start, en, clock, cur_state);
input logic reset, clock, en, resetAll, start;
output logic [63:0] cur_state;
input logic [63:0] seed;
logic [63:0] cur_seed;
logic gameStart, seedStart;

typedef enum logic [2:0] {S0, S1, S2} statetype;
    statetype state, nextstate;

always_ff @(posedge clock, posedge resetAll)
    if(resetAll) state <= S0;
    else state <= nextstate;

always_comb
    case(state)
        S0: begin
            gameStart = 1'b0;
            seedStart = 1'b0;
            nextstate <= S1;
        end
        S1: begin
            gameStart = 1'b0;
            seedStart = 1'b1;
            if(start) nextstate <= S2;
            else nextstate <= S1;
        end
        S2: begin
            gameStart = 1'b1;
            seedStart = 1'b0;
            if(reset) nextstate <= S1;
            else nextstate <= S2;
        end
    endcase

lfsr64 inst1(seed, clock, seedStart, cur_seed);
GameOfLife inst2(cur_seed, reset, gameStart, en, clock, cur_state);

endmodule
