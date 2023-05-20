module CLK_GATE_L1 (CLK_EN,CLK_Dis,clk,rst,GATED_CLK);
input      CLK_EN,CLK_Dis;
input      clk,rst;
output     GATED_CLK;
//internal connections
reg   flag;

//latch (Level Sensitive Device)
always @(posedge clk or negedge rst)
 begin
	if (!rst)
		flag<=1'b1;
	else if (CLK_EN)
		flag<=1'b1;
	else if (CLK_Dis)
		flag<=1'b0;		
 end 
// ANDING
assign  GATED_CLK = clk && flag ;

endmodule