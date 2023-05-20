module REG_TRANS_ADDR(clk,rst,TRANS_ADDR1,TRANS_ADDR2,WRITE,REG_TRANS_ADDR1,REG_TRANS_ADDR2,REG_WRITE);
input clk,rst,WRITE;
input [9:0] TRANS_ADDR1,TRANS_ADDR2;
output reg REG_WRITE;
output reg [9:0] REG_TRANS_ADDR1,REG_TRANS_ADDR2;

always @ (posedge clk or negedge rst)
	begin
		if (!rst )
			begin 
				REG_TRANS_ADDR1<=0; REG_TRANS_ADDR2<=0; REG_WRITE<=0;
			end
		else  
			begin
				REG_TRANS_ADDR1<=TRANS_ADDR1; REG_TRANS_ADDR2<=TRANS_ADDR2; REG_WRITE<=WRITE;
			end
	end

endmodule

