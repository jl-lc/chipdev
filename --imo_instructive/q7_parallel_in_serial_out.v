module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);
  reg [DATA_WIDTH-1:0] register;
  always @(posedge clk) begin
    if (~resetn)
      register <= {DATA_WIDTH{1'b0}};
    else begin
      if (din_en)
        register <= din;
      else
        register <= register >> 1;
    end
  end
  assign dout = register[0];
endmodule