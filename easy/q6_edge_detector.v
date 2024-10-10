module model (
  input clk,
  input resetn,
  input din,
  output dout
);
  reg delay, pulse;
  always @(posedge clk) begin
    delay <= ~resetn ? 'h0 : din;
    pulse <= ~resetn ? 'h0 : din & ~delay;
  end
  assign dout = pulse;
endmodule