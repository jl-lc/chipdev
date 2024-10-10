module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);
  // my attempt
  /*
  reg [DATA_WIDTH-1:0] conv;
  always @(*) begin
    conv = gray;
    for (int i = 0; i < DATA_WIDTH-1; i++)
      conv[i] = gray[i+1] ? ~conv[i] : conv[i];
  end
  assign bin = conv;
  */

  // answer
  int i;
  logic [DATA_WIDTH-1:0] temp;
  always @(*) begin
      for(i=0; i<DATA_WIDTH; i++) begin
          temp[i] = ^(gray >> i);
      end
  end
  assign bin = temp;

  // bin to gray
  /*
  reg [DATA_WIDTH-1:0] temp;
  always @(*) begin
    temp[DATA_WIDTH-1] = gray[DATA_WIDTH-1];
    for (int i = 0; i < DATA_WIDTH-1; i++)
      temp[i] = gray[i] ^ gray[i+1];
  end
  assign bin = temp;
  */

endmodule