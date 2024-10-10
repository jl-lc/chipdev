module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);
  logic en;
  always @(posedge clk) begin
    if (reset) begin
      en <= 0;
      count <= 0;
    end
    else if (stop) begin
      en <= 0;
      count <= count;
    end
    else if (start | en) begin
      en <= 1;
      count <= count == MAX ? 0 : count + 1;
    end
  end
endmodule