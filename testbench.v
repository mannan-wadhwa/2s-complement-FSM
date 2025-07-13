module testbench;
    reg clk = 0;
    reg reset = 1;
    reg in_bit = 0;
    wire out_bit;

    rtl_design uut (.clk(clk), .reset(reset), .in_bit(in_bit), .out_bit(out_bit));

    always #50 clk = ~clk; // Clock generation

    // Input pattern
    reg [5:0] ip_bits = 6'b100111;
    reg [5:0] expected_op = 6'b011001;
    integer i;
    
    task send_bit(input reg b, input integer index);
    begin
        @(negedge clk);       // apply input BEFORE next posedge
        in_bit = b;
        @(posedge clk);       // FSM reacts here
        #10; // small delay to allow output to update
        if (out_bit !== expected_op[index]) begin
            $display("Mismatch at bit %0d: Expected = %b, Got = %b", index, expected_op[index], out_bit);
        end else begin
            $display("Match at bit %0d: Output = %b", index, out_bit);
        end
    end
    endtask

    // Main test logic
    initial begin
        $display("Starting FSM Test...");
        reset = 1;
        in_bit = 0;
        #30; // keep reset high before clock starts
        clk = 0; #20;
        reset = 0;
        @(posedge clk); // wait for 1st rising edge
        for (i = 0; i < 6; i = i + 1)
            send_bit(ip_bits[i], i);

        $display("Test Completed.");
        #150 $finish;
    end
endmodule
