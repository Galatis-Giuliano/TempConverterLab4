`timescale 1ns / 1ps

module TopModuleDisplay(
    input logic clk,
    input logic format,             //0 is C, 1 is F
    input logic [7:0] tempIn,
    //output logic [7:0] tempOut,
    output logic [6:0] sseg,
    output logic [7:0] an
    );
    
    logic [7:0] tempOut;
    logic [7:0] tempInAdjustedC,tempInAdjustedF,tempInToDisplay;
    logic [11:0] tempInputBCD, tempOutputBCD;
    logic [3:0] inputUnits, outputUnits;
    
    TempConvertion TempConvertModule(.tempIn(tempInToDisplay),.*);
    
    MinMax minmaxF(.minimum(8'b00100000),.maximum(8'b11010100),.inValue(tempIn),.outValue(tempInAdjustedF));
    MinMax minmaxC(.minimum(8'b00000000),.maximum(8'b01100100),.inValue(tempIn),.outValue(tempInAdjustedC));
    
    assign tempInToDisplay = (format) ? tempInAdjustedF : tempInAdjustedC;
    
    BinaryToBCD ConvertInputTemp(.binary(tempInToDisplay),.BCD(tempInputBCD));
    BinaryToBCD ConvertOutputTemp(.binary(tempOut),.BCD(tempOutputBCD));
    
    assign inputUnits = (format)? 4'b1111 : 4'b1100;
    assign outputUnits = (~format)? 4'b1111 : 4'b1100;
    
    time_mux_disp sevenSegmentDisplay(
        .in0({1'b1 ,outputUnits, 1'b1}),
        .in1({1'b1 ,tempOutputBCD[3:0], 1'b1}),
        .in2({1'b1 ,tempOutputBCD[7:4], 1'b1}),
        .in3({1'b1 ,tempOutputBCD[11:8], 1'b1}),
        .in4({1'b1 ,inputUnits, 1'b1}),
        .in5({1'b1 ,tempInputBCD[3:0], 1'b1}),
        .in6({1'b1 ,tempInputBCD[7:4], 1'b1}),
        .in7({1'b1 ,tempInputBCD[11:8], 1'b1}),
        .clk(clk),
        .sseg(sseg),.dp(),.an(an)
        );
    
endmodule
