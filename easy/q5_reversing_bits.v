module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
  always @(*)
    for (int i = 0; i < DATA_WIDTH; i++)
      dout[i] = din[DATA_WIDTH-1 - i];
endmodule