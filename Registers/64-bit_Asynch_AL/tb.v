module Register_tb();
  wire [63:0] data_out;
  reg [63:0] data_in;
  bit clk = 0;                   //continuously driven
  reg reset;
  
  Register register(.data_out(data_out), .data_in(data_in), .clk(clk), .rst(reset));
  
  initial 
    begin
      forever          
        #5 clk = ~clk;            //10 ns complete clock cycle
    end
  
 initial
   begin
     #2 reset =1;
     #10 data_in = 35;
     #20 reset = 0      ;       data_in = 55   ;
   end
  
  initial 
    begin
      $dumpfile("Assignment5_waves.vcd");
      $dumpvars;
      #50 $finish;
    end 
endmodule