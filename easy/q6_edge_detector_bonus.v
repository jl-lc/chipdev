// same cycle
module model (
  input clk,
  input resetn,
  input din,
  output dout
);
  reg opp;
  always @(posedge clk)
    opp <= ~resetn ? 'h1 : din;
  assign dout = din & ~opp;
endmodule