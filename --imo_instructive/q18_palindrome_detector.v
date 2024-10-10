module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);
  reg prev;
  always @(*) begin
    prev = 1;
    for (int i = 0; i < DATA_WIDTH/2; i++)
      prev = din[i] == din[DATA_WIDTH-1-i] & prev;
  end
  assign dout = prev;
endmodule