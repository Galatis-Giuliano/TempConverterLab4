`timescale 1ns / 1ps

module romTempFile(
    input logic clk,
    input logic [8:0] addr,
    output logic [7:0] data
    );
    
    logic [7:0] rom [0:281];
    
    initial
        $readmemb("temp_data.mem",rom);
    
    always_ff @(posedge clk)
        data <= rom[addr];
    
endmodule
