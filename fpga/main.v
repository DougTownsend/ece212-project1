module main(
    input clk,
    input [3:0] btn,
    output strobe,
    output data,
    output shift_clk
);

    reg [7:0] seven_seg;
    reg [7:0] led;

    shift_reg sreg(led, seven_seg, clk, strobe, data, shift_clk);

    always @ (*) begin
        seven_seg = 0;
        led = 0;
        if (btn[0]) begin
            led = 8'b10101111;
            seven_seg = 8'b00001111;
        end

        if (btn[1]) begin
            led = 8'b11111111;
            seven_seg = 8'b11100011;
        end

        if (btn[2]) begin
            led = 8'b00001010;
            seven_seg = 8'b11111111;
        end

        if (btn[3]) begin
            led = 8'b00001100;
            seven_seg = 8'b00000001;
        end
    end
    

endmodule