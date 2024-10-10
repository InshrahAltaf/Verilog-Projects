/*Design a finite state machine to detect a 1011 sequence in verilog. Also write its testbench to verify your design.*/

 // For the design, I’m using non-overlapping Moore method. 
 //2^2 = 4 hence 2-bit numbers can only provide us with 4 states while we are using 5 states hence, we use 2^3 = 8.

module sequence_detector(clk,rst,sequence_in,detected_out);
  input clk,rst,sequence_in;
  output reg detected_out;
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
   
  reg [2:0] curr_state, next_state;    // to store the value of each
  
  always@(posedge clk , posedge rst) begin
    if(rst == 1)
      curr_state <= S0;
    else
      curr_state <= next_state;
  end
  
  //to determine next state
  always@(curr_state , sequence_in) begin
    case(curr_state)
      S0 : begin 
        if(sequence_in == 1'b0)
          next_state <= S0;
        else
          next_state <= S1;
      end
      S1 : begin
        if(sequence_in == 1'b0)
          next_state <= S1;
        else
          next_state <= S2;
      end
      S2 : begin
        if(sequence_in == 1'b0)
          next_state <= S0;
        else
          next_state <= S3;
      end
      S3 : begin
        if(sequence_in == 1'b0)
          next_state <= S2;
        else 
          next_state <= S4;
      end
      S4 : begin
        if(sequence_in == 1'b0)
          next_state <= S2;
        else
          next_state <= S1;
      end
      default : next_state <= S0;
    endcase
  end
  
//combinational logic to detetrmine output
  always@(curr_state) begin
    case(curr_state)
      S0 : detected_out <= 0;
      S1 : detected_out <= 0;
      S2 : detected_out <= 0;
      S3 : detected_out <= 0;
      S4 : detected_out <= 1;
      default : detected_out <= 0;
    endcase
  end
endmodule