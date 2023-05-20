module BRAM_layer7 #(parameter N_BRAM1=8)(BRAM1_out1,BRAM1_out2,BRAM1_in1,BRAM1_in2,BRAM1_addr1,BRAM1_addr2,wr,clk);
output wire  [N_BRAM1*16-1:0] BRAM1_out1,BRAM1_out2;
input wire  [N_BRAM1*16-1:0] BRAM1_in1,BRAM1_in2;
input  [10-1:0] BRAM1_addr1,BRAM1_addr2;
input clk,wr;

MEM_L7  U0 (BRAM1_out1[16*(0+1)-1:16*0],BRAM1_out2[16*(0+1)-1:16*0],BRAM1_in1[16*(0+1)-1:16*0],BRAM1_in2[16*(0+1)-1:16*0],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U1 (BRAM1_out1[16*(1+1)-1:16*1],BRAM1_out2[16*(1+1)-1:16*1],BRAM1_in1[16*(1+1)-1:16*1],BRAM1_in2[16*(1+1)-1:16*1],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U2 (BRAM1_out1[16*(2+1)-1:16*2],BRAM1_out2[16*(2+1)-1:16*2],BRAM1_in1[16*(2+1)-1:16*2],BRAM1_in2[16*(2+1)-1:16*2],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U3 (BRAM1_out1[16*(3+1)-1:16*3],BRAM1_out2[16*(3+1)-1:16*3],BRAM1_in1[16*(3+1)-1:16*3],BRAM1_in2[16*(3+1)-1:16*3],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U4 (BRAM1_out1[16*(4+1)-1:16*4],BRAM1_out2[16*(4+1)-1:16*4],BRAM1_in1[16*(4+1)-1:16*4],BRAM1_in2[16*(4+1)-1:16*4],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U5 (BRAM1_out1[16*(5+1)-1:16*5],BRAM1_out2[16*(5+1)-1:16*5],BRAM1_in1[16*(5+1)-1:16*5],BRAM1_in2[16*(5+1)-1:16*5],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U6 (BRAM1_out1[16*(6+1)-1:16*6],BRAM1_out2[16*(6+1)-1:16*6],BRAM1_in1[16*(6+1)-1:16*6],BRAM1_in2[16*(6+1)-1:16*6],BRAM1_addr1,BRAM1_addr2,wr,clk);
MEM_L7  U7 (BRAM1_out1[16*(7+1)-1:16*7],BRAM1_out2[16*(7+1)-1:16*7],BRAM1_in1[16*(7+1)-1:16*7],BRAM1_in2[16*(7+1)-1:16*7],BRAM1_addr1,BRAM1_addr2,wr,clk);

endmodule
