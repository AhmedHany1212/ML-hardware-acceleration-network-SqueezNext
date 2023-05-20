module mux_16_1_L17 #(parameter N_adder_tree=16)(BIAS_1,BIAS_2,BIAS_3,BIAS_4,BIAS_5,BIAS_6,BIAS_7,BIAS_8,BIAS_9,BIAS_10,BIAS_11,BIAS_12,BIAS_13,BIAS_14,BIAS_15,BIAS_16,BIAS,z);


input  wire	[3:0]				  z;
output reg [N_adder_tree*18-1:0] BIAS;


input wire [N_adder_tree*18-1:0] BIAS_1;
input wire [N_adder_tree*18-1:0] BIAS_2;
input wire [N_adder_tree*18-1:0] BIAS_3;
input wire [N_adder_tree*18-1:0] BIAS_4;
input wire [N_adder_tree*18-1:0] BIAS_5;
input wire [N_adder_tree*18-1:0] BIAS_6;
input wire [N_adder_tree*18-1:0] BIAS_7;
input wire [N_adder_tree*18-1:0] BIAS_8;
input wire [N_adder_tree*18-1:0] BIAS_9;
input wire [N_adder_tree*18-1:0] BIAS_10;
input wire [N_adder_tree*18-1:0] BIAS_11;
input wire [N_adder_tree*18-1:0] BIAS_12;
input wire [N_adder_tree*18-1:0] BIAS_13;
input wire [N_adder_tree*18-1:0] BIAS_14;
input wire [N_adder_tree*18-1:0] BIAS_15;
input wire [N_adder_tree*18-1:0] BIAS_16;


always@(*)
begin 
	case(z)
	  4'b0000:BIAS=BIAS_1;
	  4'b0001:BIAS=BIAS_2;
	  4'b0010:BIAS=BIAS_3;
	  4'b0011:BIAS=BIAS_4;
	  4'b0100:BIAS=BIAS_5;
	  4'b0101:BIAS=BIAS_6;
	  4'b0110:BIAS=BIAS_7;
	  4'b0111:BIAS=BIAS_8;
	  4'b1000:BIAS=BIAS_9;
	  4'b1001:BIAS=BIAS_10;
	  4'b1010:BIAS=BIAS_11;
	  4'b1011:BIAS=BIAS_12;
	  4'b1100:BIAS=BIAS_13;
	  4'b1101:BIAS=BIAS_14;
	  4'b1110:BIAS=BIAS_15;
	  4'b1111:BIAS=BIAS_16;

	endcase 
end

endmodule
