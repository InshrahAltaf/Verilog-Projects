module MUX_8x1_tb;
  wire [63:0] out_1;
  reg [2:0] select_in;
  reg [63:0] input1_in, input2_in, input3_in, input4_in, input5_in, input6_in, input7_in, input8_in;
  MUX_8x1 eight(.out(out_1), .select(select_in), .input1(input1_in), .input2(input2_in), .input3(input3_in), .input4(input4_in), .input5(input5_in), .input6(input6_in), .input7(input7_in), .input8(input8_in));
  
  initial
    begin
     input1_in = 0  ;  input2_in = 1  ;  input3_in = 1  ;  input4_in = 0 ;      input5_in = 1  ;  input6_in = 1  ;  input7_in = 0   ; input8_in = 1 ;
      
     #5 select_in[2] = 0    ;   select_in[1] = 0    ;    select_in[0] = 0;  
      #1if (out_1 == input1_in)           $display ("TRUE");
     #5 select_in[2] = 0    ;   select_in[1] = 0    ;    select_in[0] = 1; 
      #1if (out_1 == input2_in)           $display ("TRUE");
     #5 select_in[2] = 0    ;   select_in[1] = 1    ;    select_in[0] = 0; 
      #1if (out_1 == input3_in)           $display ("TRUE");
     #5 select_in[2] = 0    ;   select_in[1] = 1    ;    select_in[0] = 1; 
      #1if (out_1 == input4_in)           $display ("TRUE");
     #5 select_in[2] = 1    ;   select_in[1] = 0    ;    select_in[0] = 0; 
      #1if (out_1 == input5_in)           $display ("TRUE");
     #5 select_in[2] = 1    ;   select_in[1] = 0    ;    select_in[0] = 1; 
      #1if (out_1 == input6_in)           $display ("TRUE");
     #5 select_in[2] = 1    ;   select_in[1] = 1    ;    select_in[0] = 0; 
      #1if (out_1 == input7_in)           $display ("TRUE");
     #5 select_in[2] = 1    ;   select_in[1] = 1    ;    select_in[0] = 1; 
      #1if (out_1 == input8_in)           $display ("TRUE");
    end
  
  initial 
    begin
      $dumpfile("Assignment6_waves.vcd");
      $dumpvars;
      #60 $finish;
    end 
endmodule
