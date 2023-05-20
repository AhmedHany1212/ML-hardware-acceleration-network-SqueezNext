module mux_8_1_L9 #(parameter N_adder_tree=16)(BIAS_1,BIAS_2,BIAS_3,BIAS_4,BIAS_5,BIAS_6,BIAS_7,BIAS_8,BIAS,z);


input  wire	[2:0]				  z;
output reg [N_adder_tree*18-1:0] BIAS;


input wire [N_adder_tree*18-1:0] BIAS_1;
input wire [N_adder_tree*18-1:0] BIAS_2;
input wire [N_adder_tree*18-1:0] BIAS_3;
input wire [N_adder_tree*18-1:0] BIAS_4;
input wire [N_adder_tree*18-1:0] BIAS_5;
input wire [N_adder_tree*18-1:0] BIAS_6;
input wire [N_adder_tree*18-1:0] BIAS_7;
input wire [N_adder_tree*18-1:0] BIAS_8;


always@(*)
begin 
	case(z)
	  3'b000:BIAS=BIAS_1;
	  3'b001:BIAS=BIAS_2;
	  3'b010:BIAS=BIAS_3;
	  3'b011:BIAS=BIAS_4;
	  3'b100:BIAS=BIAS_5;
	  3'b101:BIAS=BIAS_6;
	  3'b110:BIAS=BIAS_7;
	  3'b111:BIAS=BIAS_8;
	endcase 
end

endmodule