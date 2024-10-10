 /* Design a parameterized dual-port RAM module with independent read and write ports, 
 each with address and data bus. Implement separate control signals for read and write operations on each port.
 The memory should support concurrent read and write operations from both ports. 
 Both read and write should have to be synchronized with the clock signal.*/

 module dual_RAM(clk, write_en, write_addr, write_data, read_en, read_addr, cs, read_data);
  
  //Parameterized
  parameter data_width = 32;  //RAM width i.e. word size of memory
  parameter addr_width = 8;   //RAM depth 
  
  input wire clk, write_en, read_en, cs;        //separate control signals for read and write 
  input wire [addr_width-1 :0] write_addr, read_addr;
  input wire [data_width-1 :0] write_data;      //independent write ports
  output reg[data_width-1:0] read_data;         //independent read ports
  
  // [no. of bits in a memory location] mem [no. of memory locations]
  reg [data_width-1 :0] mem [0:addr_width-1];   //setting up memory array
  
  always@(posedge clk)
    begin
    if (cs)
     begin
     if (write_en)
       mem[write_addr] <= write_data;
     if (read_en)
       read_data <= mem[read_addr];
   end
  end 
endmodule
