module dadda_16_tb;
reg [15:0] A, B;
wire [31:0] Y;
dadda_16 16DM (.A(A), .B(B), .Y(Y));
initial 
begin
   A = 255           ;           B = 100 ;
#100;
end
endmodule

/*Dada Multiplier (8 bit x 8 bit)
module dadda_8TB;
reg [7:0] A, B;
wire [15:0] y;
dadda_8 8DM (.A(A), .B(B), .y(y));
initial
 begin
    A = 12           ;           B = 12;
#100;
end*/