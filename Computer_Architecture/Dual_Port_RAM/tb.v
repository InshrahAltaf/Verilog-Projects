module dual_RAM_tb ();
  reg  clk, cs, write_en, read_en;
  reg  [7:0] write_data;  // this is the connection to write data port
  reg  [7:0] write_addr;  // address to write to
  reg  [7:0] read_addr;   // address to read from
  wire [7:0] read_data;   // link to data returned to read
  
  // Instantiate the module to be tested
  dual_RAM synchronous(clk, write_en, write_addr, write_data, read_en, read_addr, cs, read_data);

  initial begin
    
  // set up initial conditions
    clk = 0      ;      cs = 0     ;    write_en = 1    ;   read_en = 0    ;   
    read_addr= 1 ;     write_addr= 1  ;  write_data= 100  ; 
    $display("clk cs write_en read_en read_addr write_addr read_data write_data");
    $monitor("%b  %b   %b     %b        %03d       %03d       %03d      %03d",
             clk, cs, write_en, read_en, read_addr, write_addr, read_data, write_data);
    
    // set up to write to 100 to [1] and disable read:
    cs <= 1;
    #5 $display("write 100 to [1]");
    // do a clock pulse
    #5 clk = ~clk             ;            #5 clk = ~clk              ;
    
    read_en <= 1;
    write_addr <= 2;
    write_data <= 101;
    #5 $display("write 101 to [2] and read from 1");
    // do a clock pulse
    #5 clk = ~clk              ;            #5 clk = ~clk              ;
    
  end
endmodule