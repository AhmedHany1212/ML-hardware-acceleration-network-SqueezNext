module mux_4_1_L9 #(parameter N_adder_tree=16)(BIAS_1,BIAS_2,BIAS_3,BIAS_4,BIAS,z);

input  wire	[2:0]				  z;
output reg [N_adder_tree*18-1:0] BIAS;


input wire [N_adder_tree*18-1:0] BIAS_1;
input wire [N_adder_tree*18-1:0] BIAS_2;
input wire [N_adder_tree*18-1:0] BIAS_3;
input wire [N_adder_tree*18-1:0] BIAS_4;



always@(*)
begin 
	case(z)
	  3'b000:BIAS=BIAS_1;
	  3'b001:BIAS=BIAS_2;
	  3'b010:BIAS=BIAS_3;
	  3'b011:BIAS=BIAS_4;
	  3'b100:BIAS=0;
	  3'b101:BIAS=0;
	  3'b110:BIAS=0;
	  3'b111:BIAS=0;
	endcase 
end

endmodule