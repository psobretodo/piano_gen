module PianoLowLevel(input clk, input [9:0] freq, output reg freq_out);

reg [9:0] count, compare;

always@(posedge clk)
    if(count == 0)
    begin
        compare = freq;
        count = count + 1;
    end
    else if(count == 1023)
        count = 0;
    else
    begin
        count = count + 1;
        if(count < compare)
            freq_out = 1'b1;
        else
            freq_out = 1'b0;
    end  
endmodule
