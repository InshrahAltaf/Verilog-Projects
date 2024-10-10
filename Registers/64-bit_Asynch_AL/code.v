// Design a 64 bit register with asynchronous,active low reset. Also write its testbench.

module Register(data_out, data_in, clk, rst);
  output wire [63:0] data_out;
  input wire [63:0] data_in;
  input wire clk;
  input wire rst;
  
  reg [63:0] temp_out;                 // register to store value
  
  always@(posedge clk or negedge rst)  // positive edge and active low reset
    begin
      if (~rst)                        // reset = o i.e. asynchronous reset
        temp_out <= 64'b0;
      else
        temp_out <= data_in;
    end
  assign data_out = temp_out;
endmodule
      