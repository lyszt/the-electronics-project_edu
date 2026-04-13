module memory_256x8 (
  input clk,
  input write,
  input [7:0] address,
  input [7:0] data_in,
  output reg [7:0] data_out  
);

    reg [7:0] memory_array [0:255];

    always @(posedge clk) begin 
        if(write) begin 
            memory_array[address] <= data_in;
        end 
        
        data_out <= memory_array[address];

    end 
endmodule 