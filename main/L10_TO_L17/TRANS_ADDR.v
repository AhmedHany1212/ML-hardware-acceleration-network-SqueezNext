module TRANS_ADDR (start,clk,rst,addr1,addr2,WRITE,counter);
input      start;
input      clk,rst;
output [9:0]    addr1,addr2;
//internal connections
output reg [8:0] counter;
output reg WRITE;
//latch (Level Sensitive Device)
always @(posedge clk or negedge rst)
 begin
	if (!rst)
	begin	WRITE<=1'b0; counter<=0; end
	else 
		begin
			if (start)
				WRITE<=1'b1;
			else if (counter==511)
				WRITE<=1'b0;		
			if (WRITE)
				counter<=counter+9'b1;
		end
 end 
assign addr1={1'b0,counter};
assign addr2=counter+10'b1000000000;
endmodule
