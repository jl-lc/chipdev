module model #(parameter
    FIZZ=3,
    BUZZ=5,
    MAX_CYCLES=100
) (
    input clk,
    input resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);
    // mine
    /*
    reg [$clog2(MAX_CYCLES)-1:0] counter;
    always @(posedge clk)
        counter <= ~resetn | counter == MAX_CYCLES-1 ? 'b0 : counter + 1;
    assign fizz = counter % FIZZ == 0;
    assign buzz = counter % BUZZ == 0;
    assign fizzbuzz = fizz & buzz;
    */

    // better
    logic [$clog2(MAX_CYCLES)-1:0] counter;
    logic [$clog2(FIZZ)-1:0] fizz_cnt;
    logic [$clog2(BUZZ)-1:0] buzz_cnt;

    always @(posedge clk) begin
        if (!resetn || counter >= MAX_CYCLES-1) begin
            counter <= 0;
            fizz_cnt <= 0;
            buzz_cnt <= 0;
        end else begin
            counter <= counter + 1;
            fizz_cnt <= (fizz_cnt == FIZZ-1) ? 0 : fizz_cnt + 1;
            buzz_cnt <= (buzz_cnt == BUZZ-1) ? 0 : buzz_cnt + 1;
        end
    end

    assign fizz = (fizz_cnt == 0);
    assign buzz = (buzz_cnt == 0);
    assign fizzbuzz = (fizz_cnt == 0) && (buzz_cnt == 0);

endmodule