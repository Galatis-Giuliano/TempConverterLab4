`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2020 08:46:28 PM
// Design Name: 
// Module Name: MinMax
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MinMax
    #(parameter N = 8)
    (
    input logic [N-1:0] minimum,
    input logic [N-1:0] maximum,
    input logic [N-1:0] inValue,
    output logic [N-1:0] outValue
    );
    
    always_comb
    begin
        if(inValue < minimum)
            outValue = minimum;
        else if(inValue > maximum)
            outValue = maximum;
        else
            outValue = inValue;
    end
    
endmodule
