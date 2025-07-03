
module test;

  // Inputs
  reg clock;
  reg reset;
  reg mode;
  reg button1;
  reg button2;
  reg button3;
  reg button4;

  // Outputs
  wire [7:0] led;

  // Instantiate the Unit Under Test (UUT)
  votingMachine uut (
      .clock(clock),
      .reset(reset),
      .mode(mode),
      .button1(button1),
      .button2(button2),
      .button3(button3),
      .button4(button4),
      .led(led)
  );

  // Clock generation
  initial begin
      clock = 0;
      forever #5 clock = ~clock;
  end

  // Stimulus block
  initial begin
    // Initialize Inputs
    reset = 1; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    // Wait 100 ns for global reset to finish
    #100;

    reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5  button1 = 1;
    #10 button1 = 0;
    #5  button1 = 1;
    #200 button1 = 0;

    #5  button2 = 1;
    #200 button2 = 0;

    #5  button2 = 1; button3 = 1;
    #200 button2 = 0; button3 = 0;

    #5  mode = 1; button2 = 1; button3 = 1;
    #200 button2 = 0; button3 = 1;
    #5  mode = 0;

    #5  button3 = 1;
    #200 button3 = 0;

    #5  button3 = 0;
    #10;

    $finish;
  end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, test);  


  $dumpvars(0, test.uut.VL.cand1_vote_recvd);
  $dumpvars(0, test.uut.VL.cand2_vote_recvd);
  $dumpvars(0, test.uut.VL.cand3_vote_recvd);
  $dumpvars(0, test.uut.VL.cand4_vote_recvd);


  $dumpvars(0, test.uut.valid_vote_1);
  $dumpvars(0, test.uut.valid_vote_2);
  $dumpvars(0, test.uut.valid_vote_3);
  $dumpvars(0, test.uut.valid_vote_4);
end


endmodule
