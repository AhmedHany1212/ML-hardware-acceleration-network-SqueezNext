module bias_rom #(parameter N_bias=32,N_out_add=2,Addr_width=3)(
 output reg	 [(2**N_out_add)*18-1:0]		bias_out,   //default [8*18-1:0] bias_out
 input	wire [Addr_width-1:0]				bias_add,   //default [1:0] bias_add
 input	wire								clk
 );
 
 //(* rom_style =  "distributed" *) wire [16-1:0] bias_mem[0:N_bias-1];
 reg [18-1:0] bias_mem [0:N_bias-1];
 
 initial 
  begin   
   $readmemb("bias.txt", bias_mem);
  end 
  
 always@(posedge clk)
  begin
   case (bias_add)
    0 :     bias_out <= {bias_mem[3],bias_mem[2],bias_mem[1],bias_mem[0]};
	 1 :     bias_out <= {bias_mem[7],bias_mem[6],bias_mem[5],bias_mem[4]};
    2 :     bias_out <= {bias_mem[11],bias_mem[10],bias_mem[9],bias_mem[8]};		 
    3 :     bias_out <= {bias_mem[15],bias_mem[14],bias_mem[13],bias_mem[12]};
    4 :     bias_out <= {bias_mem[19],bias_mem[18],bias_mem[17],bias_mem[16]};	 
    5 :     bias_out <= {bias_mem[23],bias_mem[22],bias_mem[21],bias_mem[20]};
    6 :     bias_out <= {bias_mem[27],bias_mem[26],bias_mem[25],bias_mem[24]};		            
    7 :     bias_out <= {bias_mem[31],bias_mem[30],bias_mem[29],bias_mem[28]};
   endcase
  end
  
endmodule