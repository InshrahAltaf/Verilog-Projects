module A2_tb;
  wire out1;
  reg A_in;
  reg S_in;
  reg B_in;
  A2 assignment(.A(A_in),.S(S_in), .B(B_in), .out(out1));
  initial
    begin
      #5 A_in = 0      ;      S_in = 0       ;       B_in = 0;
      #1if (out1 == 0)          $display ("TRUE");
      #5 A_in = 0      ;      S_in = 0       ;       B_in = 1;
      #1if (out1 == 0)          $display ("TRUE");
      #5 A_in = 0      ;      S_in = 1       ;       B_in = 0;
      #1if (out1 == 0)          $display ("TRUE");
      #5 A_in = 0      ;      S_in = 1       ;       B_in = 1;
      #1if (out1 == 1)          $display ("TRUE");
      #5 A_in = 1      ;      S_in = 0       ;       B_in = 0;
      #1if (out1 == 1)          $display ("TRUE");
      #5 A_in = 1      ;      S_in = 0       ;       B_in = 1;
      #1if (out1 == 1)          $display ("TRUE");
      #5 A_in = 1      ;      S_in = 1       ;       B_in = 0;
      #1if (out1 == 0)          $display ("TRUE");
      #5 A_in = 1      ;      S_in = 1       ;       B_in = 1;
      #1if (out1 == 1)          $display ("TRUE");
    end
  
  initial 
    begin
      $dumpfile("Assignment3_waves.vcd");
      $dumpvars;
      #55 $finish;
    end 
endmodule
