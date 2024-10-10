module sequence_detector_tb();
  
  reg clk,rst,sequence_in;
  wire detected_out;
  
  sequence_detector moore(.detected_out(detected_out), .sequence_in(sequence_in),  .clk(clk), .rst(rst));
  
  initial 
    begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    sequence_in = 0              ;                   rst = 1           ;
    #30 rst = 0;
    #40 sequence_in = 0;
    #10 sequence_in = 1;
    #10 sequence_in = 0;
    #10 sequence_in = 1;
    #10 sequence_in = 0;
    #10 sequence_in = 1;
    #10 sequence_in = 0;
    #100 $finish;
  end
  
 initial
   begin
   $dumpfile("dump.vcd"); 
   $dumpvars; 
 end
endmodule