module tb_Booth_Mul;
reg [3:0] M, Q;
reg clk, rst;
wire [7:0] P;
Booth_Mul 4BM (.P(P), .M(M), .Q(Q), .clk(clk), .rst(rst));
initial
begin
    M = 4;              Q = 6;           
    clk = 0;            rst = 1;
#100;
    clk = 1;            rst = 0;
#100;
    clk = 0;
forever #100 clk = ~clk;
end
endmodule
