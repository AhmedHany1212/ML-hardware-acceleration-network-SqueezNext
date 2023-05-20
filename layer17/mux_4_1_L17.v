module mux_4_1_L17 #(parameter N_adder_tree=16)(BIAS_1,BIAS_2,BIAS_3,BIAS_4,BIAS,z);

input  wire	[1:0]				  z;
output reg [N_adder_tree*18-1:0] BIAS;


input wire [N_adder_tree*18-1:0] BIAS_1;
input wire [N_adder_tree*18-1:0] BIAS_2;
input wire [N_adder_tree*18-1:0] BIAS_3;
input wire [N_adder_tree*18-1:0] BIAS_4;



always@(*)
begin 
	case(z)
	  2'b00:BIAS=BIAS_1;
	  2'b01:BIAS=BIAS_2;
	  2'b10:BIAS=BIAS_3;
	  2'b11:BIAS=BIAS_4;
	endcase 
end

endmodule
