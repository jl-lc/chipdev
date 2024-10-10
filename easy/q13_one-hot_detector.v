module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
  logic [$clog2(DATA_WIDTH):1] count;
  always @(*) begin
    count = 0;
    for (int i = 0; i < DATA_WIDTH; i++)
      count += din[i];
  end
  assign onehot = count == 1;
endmodule