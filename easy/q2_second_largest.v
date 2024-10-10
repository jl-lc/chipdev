module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
  reg [DATA_WIDTH-1:0] largest, second;
  always @(posedge clk) begin
    if (~resetn) begin
      largest <= 'h0;
      second <= 'h0;
    end
    else begin
      if (din >= largest) begin
        largest <= din;
        second <= largest;
      end
      else if (din >= second) begin
        largest <= largest;
        second <= din;
      end
      else begin
        largest <= largest;
        second <= second;
      end
    end
  end
  assign dout = second;
endmodule