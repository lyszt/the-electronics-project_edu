module program_counter (
    input clk,
    input stop,
    input [7:0] data_in,
    input reset,
    output reg [7:0] data_out

);
    initial begin 
        data_out = 8'b00000000;
    end 
    always @(posedge clk) begin 
        if(reset) begin 
            data_out <= 8'b00000000;
        end
        else if(stop) begin 
          data_out <= data_in;
        end 
        else begin 
            data_out <= data_in + 1;
        end
    end 

endmodule 
