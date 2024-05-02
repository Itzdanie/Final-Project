// testbench to prove maximal LFSR
`timescale 1ns / 1ps
module tb ();
  logic [15:0] seed;
  logic clk;
  logic reset;
  logic [15:0] newseed;

  integer handle4;
  integer desc4;
  integer i;
   //logic variables to route input and output to DUT
  
   //create file handles to write results to a file
   
   // instantiate device under test (small LFSR)
  lfsr lfsr16(seed, clk, reset, newseed);
   //set up a clock signal
   always     
     begin
	clk = 1; #1; clk = 0; #1;
     end

    always @(negedge clk)
      begin
        $fdisplay(desc4, "%b", newseed);
      end
   
  initial
    begin
      handle4 = $fopen("lfsr.out");
      desc4 = handle4;
    end

   initial
     begin
      for(i=0; i<66666; i=i+1)
        seed = 16'b100101011110001;
        #10 reset = 1'b1;
        #15 reset = 1'b0;
      

     end
	//set up output file
	//set up any book keeping variables you may want to use
	//set up a starting seed.  What happens with all 0s?
	//reset your DUT
	//save the initial output of your DUT to compare with current output
	//and see whenb you repeat

   //always @(posedge clk)
    // begin
		//output your results to a file
    // end

   // check results on falling edge of clk
   //always @(negedge clk) begin
		//if(~reset) begin
		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that
		//end
	//end
   
endmodule // tb

