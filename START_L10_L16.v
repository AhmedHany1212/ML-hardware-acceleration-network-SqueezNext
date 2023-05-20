module START_L10_L16(clk,rst,flags,temp_zero_L9);
input wire clk,rst;
input wire temp_zero_L9;
output wire [6:0] flags;

reg [2:0] counter;
reg flag17,flag16,flag15,flag14,flag13,flag12,flag11;

always @ (posedge clk or negedge rst)
begin
	if(!rst)
		begin 
			counter<=0; flag11<=0; flag12<=0; flag13<=0; flag14<=0; flag15<=0; flag16<=0; flag17<=0;
		end
	else 
		begin
			if (temp_zero_L9)
				counter<=counter+3'b1;
			case(counter)
			1: flag11<=1'b1;
			2: flag12<=1'b1;
			3: flag13<=1'b1;
			4: flag14<=1'b1;
			5: flag15<=1'b1;
			6: flag16<=1'b1;
			7: flag17<=1'b1;
			endcase
		end
end 
assign flags={flag17,flag16,flag15,flag14,flag13,flag12,flag11};

endmodule
