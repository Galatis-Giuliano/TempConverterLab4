`timescale 1ns / 1ps

module BinaryToBCD(
    input logic [7:0] binary,
    output logic [11:0] BCD
    );
    
    logic [3:0] Hundreds, Tens, Ones;
    
    always_comb
    begin
        Hundreds = 4'b0000;
        Tens = 4'b0000;
        Ones = 4'b0000;
        
        for(int i = 7; i>=0;i=i-1)
        begin
            if(Hundreds >=5)
                Hundreds = Hundreds +3;
            if (Tens >= 5)
                Tens = Tens +3;
            if (Ones >= 5)
                Ones = Ones + 3;
            
            Hundreds = Hundreds << 1;
            Hundreds[0] = Tens[3];
            
            Tens = Tens << 1;
            Tens[0] = Ones[3];
            
            Ones = Ones << 1;
            Ones[0] = binary[i];
        end
    end
    
    assign BCD = {Hundreds, Tens, Ones};
    
endmodule
