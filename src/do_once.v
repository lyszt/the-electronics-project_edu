// This is a thingy that checks if the action has been done already
module do_once (
    input clk,
    input data_in,
    input reset,
    output reg ocurred,
    output reg data_out
);
    always @(posedge clk) begin 
        if(reset) 
            ocurred <= 0;
        else if(ocurred == 1 && data_in)
            data_out <= 0;
        else begin
            data_out <= data_in;
            ocurred  <= 1;
        end
    end

endmodule 