`timescale 1ns / 1ps

module TempConvertion(
    input logic clk,
    input logic format,             //0 is C, 1 is F
    input logic [7:0] tempIn,
    output logic [7:0] tempOut
    );
    logic [8:0] addr;
    
    romTempFile tempConvertingModule(.*);
    
    assign addr = (format) ? tempIn + 7'b1000101 : tempIn;      //If F then add 68 to temp for address (69 = 101 - 32)
    
    
endmodule