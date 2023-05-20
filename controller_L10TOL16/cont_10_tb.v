`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:42:06 03/17/2022
// Design Name:   cont_layer10
// Module Name:   C:/Users/ahmed/Downloads/layer10_mod/layer10_mod/cont_10_tb.v
// Project Name:  layer10_mod
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cont_layer10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cont_10_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [9:0] BRAM2_addr1;
	wire [9:0] BRAM2_addr2;
	wire [9:0] BRAM1_addr1;
	wire [9:0] BRAM1_addr2;
	wire [2:0] u;
	wire load;
	wire [4:0] weight_addr_conv25;
	wire [2:0] weight_addr_conv26;
	wire [4:0] weight_addr_conv27;
	wire [5:0] weight_addr_conv28;
	wire [4:0] weight_addr_conv29;
	wire temp_zero_new;
	wire padding;
	wire [2:0] z;

	// Instantiate the Unit Under Test (UUT)
	cont_layer10 uut (
		.BRAM2_addr1(BRAM2_addr1), 
		.BRAM2_addr2(BRAM2_addr2), 
		.BRAM1_addr1(BRAM1_addr1), 
		.BRAM1_addr2(BRAM1_addr2), 
		.clk(clk), 
		.rst(rst), 
		.u(u), 
		.load(load), 
		.weight_addr_conv25(weight_addr_conv25), 
		.weight_addr_conv26(weight_addr_conv26), 
		.weight_addr_conv27(weight_addr_conv27), 
		.weight_addr_conv28(weight_addr_conv28), 
		.weight_addr_conv29(weight_addr_conv29), 
		.temp_zero_new(temp_zero_new), 
		.padding(padding), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=1;
        
		// Add stimulus here

	end
      always #50 clk=~clk;
      
endmodule

