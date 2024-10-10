module A2(out, A, S, B);
  input A, S, B;
  output out;
  wire w1, w2, w3;
//Gate Level/Structural Modelling
  not NOT1(w2, S);
  and AND1(w1, A, w2);
  and AND2(w3, S, B);
  or  OR1(out, w1, w3);
endmodule
