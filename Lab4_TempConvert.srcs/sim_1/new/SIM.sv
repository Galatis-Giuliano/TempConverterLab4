`timescale 1ns / 1ps

module SIM();

    localparam T = 10;

    logic clk;
    logic format;             //0 is C, 1 is F
    logic [7:0] tempIn;
    logic [7:0] tempOut;
    
    TempConvertion uut(.*);
    
    always
    begin
        clk = 1'b0;
        #(T/2)
        clk = 1'b1;
        #(T/2);
    end
    
    initial
    begin
        format = 1; tempIn = 8'b01100011;
        
        #10 format = 0; tempIn = 8'b01100011;
    
    end

endmodule
