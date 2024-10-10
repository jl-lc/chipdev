module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  logic check;
  always @(*) begin
    dout = 0;
    check = 1;
    for (int i = 0; i < DATA_WIDTH && check; i++) begin
      check = din[i] == 1'b0;
      dout += check ? 1 : 0;
    end
  end
endmodule