module rtl_design(
input wire clk,
    input wire reset,
    input wire in_bit,
    output reg out_bit
    );
    
   reg state; // 0 = S0, 1 = S1

   always @(posedge clk or posedge reset) begin // asynchronous reset
        if (reset) begin
            state <= 1'b0;
            out_bit <= 1'b0;
        end else begin
            out_bit <= state ^ in_bit;
            state <= state | in_bit;
        end
    end      
endmodule
