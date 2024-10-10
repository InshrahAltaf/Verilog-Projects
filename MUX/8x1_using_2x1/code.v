/*Design a 8x1 mux in verilog by instantiating the 2x1 muxes. Also write the testbench to verify the design.*/

module MUX_8x1(out, select, input1, input2, input3, input4, input5, input6, input7, input8);
  output[63:0] out;
  input [2:0] select;             //S0, S1, S2
  input [63:0] input1, input2, input3, input4, input5, input6, input7, input8;  
  wire w1, w2, w3, w4, w5, w6;
  reg temp_out;
  MUX_2x1 m1(w1, select[0], input1, input2);
  MUX_2x1 m2(w2, select[0], input3, input4);
  MUX_2x1 m3(w3, select[0], input5, input6);
  MUX_2x1 m4(w4, select[0], input7, input8);
  MUX_2x1 m5(w5, select[1], w1, w2);
  MUX_2x1 m6(w6, select[1], w3, w4);
  MUX_2x1 m7(out, select[2], w5, w6);
endmodule

// 2x1 MUX
module MUX_2x1(outt, selectt, input1, input2);
  output [63:0] outt;
  input selectt;
  input [63:0] input1, input2;
  reg temp_out;
  always@(*) begin
    if (selectt)            //select => "select == 1"
      temp_out = input2;
    else
      temp_out = input1;    //if (select == 0)
  end
  assign outt = temp_out;
endmodule 
