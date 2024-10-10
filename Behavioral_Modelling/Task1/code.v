/*Behaviour of the circuit to be designed is as follows: 
You are going to design a circuit using verilog behavioural modelling that tells if an applicant passed,
 failed or qualified for a scholarship in a college entrance test. There are 4 sections in the test.
The student fails if they score less than 100 marks after adding score from all 4 sections.
The student passes if they score greater than or equal to 100 marks after adding score from all 4 sections.
The student gets scholarship if they score greater than or equal to 200 marks after adding score from all 4 sections.
So, the design should take 4 inputs of 8 bits each and have 3 outputs as shown.*/

module applications(failed, passed, scholarship, sect1_grade, sect2_grade, sect3_grade, sect4_grade);
  output wire failed, passed, scholarship;
  input wire [7:0] sect1_grade, sect2_grade, sect3_grade, sect4_grade;
  
  reg temp_failed;
  reg temp_passed;
  reg temp_scholarship;
  
  always@(*)
    begin
      if (sect1_grade + sect2_grade + sect3_grade + sect4_grade >= 100 && sect1_grade + sect2_grade + sect3_grade + sect4_grade < 200) 
        begin
          temp_failed = 0;
          temp_passed = 1;
          temp_scholarship = 0;
        end
      else 
        if (sect1_grade + sect2_grade + sect3_grade + sect4_grade >= 200)
          begin
          temp_failed = 0;
          temp_passed = 1;
          temp_scholarship = 1;
          end
      else
        begin
          temp_failed = 1;
          temp_passed = 0;
          temp_scholarship = 0;
        end
    end
      assign failed = temp_failed;
      assign passed = temp_passed;
      assign scholarship = temp_scholarship;
endmodule
