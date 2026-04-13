module register_8bit (
    input clk,
    input reset, 
    input write,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    always @(posedge clk) begin // clock logic

        if(reset) begin 
            data_out <= 8'b00000000;
        end
        else if(write) begin 
            data_out <= data_in;
        end 
    end 

endmodule