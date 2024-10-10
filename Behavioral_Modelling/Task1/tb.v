module applications_tb;
  wire failed_out, passed_out, scholarship_out;
  reg  [7:0] sect1_grade_in, sect2_grade_in, sect3_grade_in, sect4_grade_in;
  applications result(.failed(failed_out), .passed(passed_out), .scholarship(scholarship_out), .sect1_grade(sect1_grade_in), .sect2_grade(sect2_grade_in), .sect3_grade(sect3_grade_in), .sect4_grade(sect4_grade_in));
  
  initial
    begin
      #5 sect1_grade_in = 0      ;      sect2_grade_in = 10; //Sum = 60
         sect3_grade_in = 30     ;      sect4_grade_in = 20;
       #1if (failed_out == 1)           $display ("Failed");
      #5 sect1_grade_in = 25     ;      sect2_grade_in = 25; //Sum = 100
         sect3_grade_in = 25     ;      sect4_grade_in = 25;
       #1if (passed_out == 1)          $display ("Passed");
      #5 sect1_grade_in = 50     ;      sect2_grade_in = 50; //Sum = 200
         sect3_grade_in = 50     ;      sect4_grade_in = 50;
       #1if (scholarship_out == 1)          $display ("Scholarship");
      #5 sect1_grade_in = 40     ;      sect2_grade_in = 16; //Sum = 99
         sect3_grade_in = 05     ;      sect4_grade_in = 38;
       #1if (failed_out == 1)           $display ("Failed");
      #5 sect1_grade_in = 73     ;      sect2_grade_in = 18; //Sum = 143
         sect3_grade_in = 20     ;      sect4_grade_in = 0;
       #1if (passed_out == 1)          $display ("Passed");
      #5 sect1_grade_in = 62     ;      sect2_grade_in = 50; //Sum = 235
         sect3_grade_in = 11     ;      sect4_grade_in = 112;
       #1if (passed_out == 1 && scholarship_out == 1)
         $display ("Passed & Scholarship");
      #5 sect1_grade_in = 15     ;      sect2_grade_in = 19; //Sum = 85
         sect3_grade_in = 30     ;      sect4_grade_in = 21;
       #1if (failed_out == 1)           $display ("Failed");
      #5 sect1_grade_in = 62     ;      sect2_grade_in = 81; //Sum = 199
         sect3_grade_in = 37     ;      sect4_grade_in = 19;
       #1if (passed_out == 1)          $display ("Passed");
      #5 sect1_grade_in = 86     ;      sect2_grade_in = 75; //Sum = 303
         sect3_grade_in = 49     ;      sect4_grade_in = 93;
       #1if (passed_out == 1 && scholarship_out == 1)
         $display ("Passed & Scholarship");
    end
  
  initial 
    begin
      $dumpfile("Assignment4_waves.vcd");
      $dumpvars;
      #60 $finish;
    end 
endmodule
