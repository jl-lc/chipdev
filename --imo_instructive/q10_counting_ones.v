module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  always @(*) begin
    dout = 0; // needed this to converge
    for (int i = 0; i < DATA_WIDTH; i++)
      dout += din[i];
  end
endmodule