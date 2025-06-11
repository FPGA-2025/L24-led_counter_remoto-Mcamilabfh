module Counter #(
    parameter CLK_FREQ = 25_000_000
) (
    input  wire clk,
    input  wire rst_n,
    output reg [7:0] leds
);

reg [31:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        leds    <= 0;
    end else begin
        if (counter == (CLK_FREQ / 2) - 1) begin
            counter <= 0;
            leds    <= leds + 1;
        end else begin
            counter <= counter + 1;
        end
    end
end

endmodule
