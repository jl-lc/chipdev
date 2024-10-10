module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
  reg [DATA_WIDTH-1:0] prev;
  always @(posedge clk) begin
    out  <= ~resetn ? 'b1 : out + prev;
    prev <= ~resetn ? 'b0 : out;
  end
endmodule