module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
  // i couldnt do it
  reg [OUT_WIDTH:0] quotient; // extra bit at the top to indicate overflow
  assign quotient = din[IN_WIDTH-1:DIV_LOG2] + din[DIV_LOG2-1]; // din >> DIV_LOG2, add rounding if remainder >= 5
  assign dout = quotient[OUT_WIDTH] ? din[IN_WIDTH-1:DIV_LOG2] : quotient; // if overflow, don't add rounding
endmodule