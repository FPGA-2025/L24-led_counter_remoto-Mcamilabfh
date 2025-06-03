module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n, //Ativo em 0
    output reg [7:0] leds
);

localparam ONE_SECOND = CLK_FREQ;

reg [31:0] counter;

always @(posedge clk) begin
    if (!rst_n) begin
        leds <= 8'b0;
        counter <= 32'h0;
    end else begin
        if(counter == ONE_SECOND -1) begin
            counter <= 32'h0;
            leds <= leds +1;
        end else begin
            counter <= counter +1;
        end
    end
end

endmodule
