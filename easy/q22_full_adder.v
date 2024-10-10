module model (
    input a,
    input b,
    input cin,
    output logic sum,
    output logic cout
);
    assign {cout, sum} = a + b + cin;
    // answer
    /*
    assign sum = a^b^cin;
    assign cout = a&b || a&cin || b&cin;
    */
endmodule