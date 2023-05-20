`timescale 1ns / 1ps



module L1_TO_L17_TB;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [127:0] out1_layer17;
	wire [127:0] out2_layer17;

	// Instantiate the Unit Under Test (UUT)
	L1_TO_L17 uut (
		.clk(clk), 
		.rst(rst), 
		.out1_layer17(out1_layer17), 
		.out2_layer17(out2_layer17)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;rst=1;
        
		// Add stimulus here

	end
      always #50 clk=~clk;
endmodule

