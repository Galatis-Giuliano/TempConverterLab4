`timescale 1ns / 1ps

module TempConvertion(
    input logic clk,
    input logic format,             //0 is C, 1 is F
    input logic [7:0] tempIn,
    output logic [7:0] tempOut
    );
    logic [8:0] addr;
    //logic minimumReached,maxReachedC,maxReachedF;
    

    
    romTempFile tempConvertingModule(.data(tempOut),.*);
    
    /*Comparator #(.N(8)) GreaterThan212(.x(tempIn),.y(8'b11010100),.z(maxReachedF));
    Comparator #(.N(8)) GreaterThan100(.x(tempIn),.y(8'b01100100),.z(maxReachedC));
    Comparator #(.N(8)) LessThan32(.x(8'b00100000),.y(tempIn),.z(minimumReached));
    
    always_comb
    begin
        case({format,minimumReached,maxReachedC,maxReachedF})
            4'b0010:
                addr = 8'b01100100;
            4'b1100:
                addr = 8'b01100101;
            4'b1011:
                addr = 9'b100011001;
            4'b1000:
                addr = tempIn + 7'b1000101;
            default:
                addr = tempIn;
        endcase
    end*/
    
    assign addr = (format) ? tempIn + 7'b1000101 : tempIn;      //If F then add 68 to temp for address (69 = 100 - 32 + 1)
    
    
endmodule
