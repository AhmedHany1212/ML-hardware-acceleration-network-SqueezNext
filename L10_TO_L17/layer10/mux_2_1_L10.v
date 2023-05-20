module mux_2_1_L10 #(parameter N_adder_tree=16)(BIAS_1,BIAS_2,BIAS,z);

input  wire	[2:0]				  z;
output reg [N_adder_tree*18-1:0] BIAS;


input wire [N_adder_tree*18-1:0] BIAS_1;
input wire [N_adder_tree*18-1:0] BIAS_2;



always@(*)
begin 
	case(z)
	  3'b000:BIAS=BIAS_1;
	  3'b001:BIAS=BIAS_2;
	  3'b010:BIAS=0;
	  3'b011:BIAS=0;
	  3'b100:BIAS=0;
	  3'b101:BIAS=0;
	  3'b110:BIAS=0;
	  3'b111:BIAS=0;
	endcase 
end

endmodule