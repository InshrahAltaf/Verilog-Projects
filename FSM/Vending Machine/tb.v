module Vendin_Machine_tb;
reg [1:0] coin;
reg clk, rst;
wire product;
Vendin_Machine VM (.product(product), .coin(coin), .clk(clk), .rst(rst));
initial 
begin
    clk = 0             ;            rst = 1;
#6 
    rst=0               ;           
    coin = 1;
#19 
    coin=2              ; 
    #10;
end
always # 5 clk=~clk;
endmodule