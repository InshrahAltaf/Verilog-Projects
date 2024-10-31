module Booth_Mul(P, M, Q, clk, rst); 
output reg [7:0] P;  //signed product of Q & M 
input [3:0] M, Q;    //signed numbers each of 4 bits; M = Multiplicand, Q = Multiplier 
input clk, rst;
reg [8:0] X;         //performs arithmetic right shift
reg [3:0] c;         //number of times the algorithm runs i.e. equals to number of bits of multiplier
reg [3:0] A;         //variable that will store the partial product. 
reg Q_1 = 1'b0;      //initially 0. It will store the value of Q0 after every arithmetic right shift
always @ (posedge clk or posedge rst)
begin
    if(rst)
    begin                    //initially in start i.e. when on reset, we begin this cycle
        c = 3'b100;          //number of bits of multiplier
        A = 4'b0000;         //initially 0
        Q_1 = 0;             //initially 0
        X = {A, Q, Q_1};     //arithmetic right shift

    end
    else
    if (c > 0)
    begin
        case (X[1:0])           //decision making block for Q0 & Q_1 which are the last 
        bits two of X
        2'b01: A = X[8:5]+ M;   //case one, for 01 //new A=X[8:5]
        2'b10: A = X[8:5] - M;  //case two, for 10
        default A = X[8:5];     //case three, for 11 or 00
        endcase
        X = {A[3], A, X[4:1]};  //arithmetic right shift performed after every case
        c = c - 1;              //count is decremented after every case
    end
    else
    P = X[8:1];                 //final product is equal to the final arithmetic right shift
end
endmodule

 