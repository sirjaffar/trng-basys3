`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 11:43:08 AM
// Design Name: 
// Module Name: baudCLK
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


module baudCLK(
    input clk,
    output wire clkB
    );

reg [13:0] counter = 14'b0000000000000;
reg flag = 0;

always @ (posedge clk)
begin
    if (counter >= 10415)
    begin
        counter <= 0;
        flag = ~flag;
    end
    
    else
    counter <= counter + 1;
end

assign clkB = flag;

endmodule
