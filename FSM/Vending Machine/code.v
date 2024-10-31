module Vending_Machine(product,coin,clk,rst);
 output reg product;        //product is dispensed
 input [1:0] coin;          //amount of cents inserted 
 input clk, rst;            //amount of cents inserted clock and reset
 parameter S0, S5, S10;     //0, 5, 10  coins received;
 reg [1:0] present_state, next_state; 
 always @(posedge clk)
 begin
    if (rst == 1)                   //when reset, all outputs become 0
    begin
        present_state = 0; 
        next_state = 0;
    end
    else
    begin
        present_state = next_state; //if no reset, then advance to next stae
        case (present_state)        //case is applied on present state to move to next state
        S0:                         //if 0 coins are received; state 0
        if (coin == 2'b00)          //if 0 coins are inserted 
        begin
            next_state = S0;        //0 + 0 = 0 cents
            product = 0;
        end
        else
        if (coin == 2'b01)          //if 5 coins are inserted 
        begin
            next_state = S5;        // 0 + 5 = 5 cents
            product = 0;
        end
        else
        if (coin == 2'b10)          //if 10 coins are inserted
        begin
            next_state = S10;       // 0 + 10 = 10 cents
            product = 0;
        end
        S5:                         //5 coins received; state 1
        if (coin == 2'b00)          //if 0 coins are inserted 
        begin
            next_state = S5;        //0 + 5 = 5 cents
            product = 0;
        end
        else
        if (coin == 2'b01)          //if 5 coins are inserted 
        begin
            next_state = S10;       // 5 + 5 = 10 cents
            product = 0;
        end
        else
        if (coin == 2'b10)          //if 10 coins are inserted
        begin
            next_state = S0;        // 5 + 10 = 15 cents; FSM back to state 0
            product = 1;            // product is dispensed 
        end
        S10:                        //10 coins received; state 2
        if (coin == 0)              //if 0 coins are inserted
        begin
            next_state = S10;        //10 + 0 = 10 cents
            product = 0;
        end
        else
        if (coin == 2'b01)           //if 5 coins are inserted 
        begin
            next_state = S0;         // 10 + 5 = 15 cents; FSM back to state 0
            product = 1;             // product is dispensed 
        end
        else
        if (coin == 2'b10)           //if 10 coins are inserted
        begin
            next_state = S0;         // 10 + 10 = 20 cents; FSM back to state 0
            product = 1;             // product is dispensed 
        end
        endcase
    end
 end
endmodule
