module model (
  input clk,
  input resetn,
  input [4:0] init,
  input din,
  output logic seen
);
  // my attempt
  
  parameter s0=0, s1=1, s2=2, s3=3, s4=4, xx=5;
  reg  [2:0] state, next;
  wire [3:0] repeated;
  wire double;
  wire [4:0] init_l;
  reg  pulse;
  wire store;

  // state transition logic
  always @(*)
    case (state)
      xx: next = din == init_l[s4] ? s4 : xx;
      s4: next = din == init_l[s3] ? s3 : repeated[s3] ? s4 : xx;
      s3: next = din == init_l[s2] ? s2 : repeated[s2] ? s3 : xx;
      s2: next = din == init_l[s1] ? s1 : repeated[s1] ? s2 : xx;
      s1: next = din == init_l[s0] ? s0 : repeated[s0] ? s1 : xx;
      s0: next = din == init_l[s4] ? s4 : double ? s1 : xx;
      default: next = xx;
    endcase
  
  // if init_ff = 00001/11110 i.e. repeated first bit, stay in same state
  assign repeated = {init_l[s4]  == init_l[s3], 
                    repeated[s3] && init_l[s3] == init_l[s2], 
                    repeated[s2] && init_l[s2] == init_l[s1], 
                    repeated[s1] && init_l[s1] == init_l[s0]};
  // if init_ff = 10101/01010 i.e. double pattern, s0 diff behaviour
  assign double = init_l == 5'b10101 | init_l == 5'b01010;

  // state flip flops
  always @(posedge clk) begin
    pulse   <= resetn;
    state   <= ~resetn ? xx : next;
  end
  assign store = resetn & ~pulse; // idk what they want with the init spec
  assign init_l = store ? init : init_l;

  // output logic
  assign seen = state == s0;
  

  // their answer
  /*
  logic [4:0] cur, len, target;
  logic reset_seen;

  always @(posedge clk) begin
      if (!resetn) begin
          reset_seen <= 1; // reset_seen is just always 1?
          cur <= 0;
          len <= 0;
      end else begin
          cur <= {cur[3:0], din};
          len <= (len < 5) ? len + 1 : len;
      end
  end

  assign target = (resetn && reset_seen && len == 0) ? init : target;
  assign seen = reset_seen && (cur == target) && (len == 5);
  */
endmodule