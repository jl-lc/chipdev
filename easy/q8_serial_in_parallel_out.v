module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);
  always @(posedge clk) begin
    if (~resetn)
      dout <= 'h0;
    else
      dout <= (dout << 1) + din;
  end
endmodule