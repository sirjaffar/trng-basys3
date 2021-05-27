`timescale 1ns / 1ps


module top(
input [7:0]sw,
input btn0,
input btn1,
input clk,
output TxD,
output TxD_debug,
output transmit_debug,
output button_debug, 
output clk_debug
); 

wire transmit;
assign TxD_debug = TxD;
assign transmit_debug = transmit;
assign button_debug = btn1;
assign clk_debug = clk;

wire feedback;      // LFSR random feedback bit
wire [12:0] rnd;    // 13-bits Pseudo-Random stream generated from LFSR
wire r;             // 1-bit Random signal from built-in function
wire TRNGOut;       // TRNG output from multiplexer circuit
wire [2:0]a;        // TRNG selectors switches
wire baud;          // Clock of baudrate 9600bps
reg one = 1;        // MUX value input-1
reg zero = 0;       // MUX value input-2


reg [7:0]dataR = 8'b00000000;
wire [7:0]send;
reg trigger = 1;
wire trig;

assign trig = trigger;
assign send = dataR;

baudCLK BCLK (.clk(clk), .clkB(baud));

randomizer R1 (.clk(clk), .feedback(feedback), .rnd(rnd), .r(r));
trng TRNG (.sel(a), .in1(one), .in2(zero), .bit(TRNGOut));

//trans_debounce D2 (.clk(clk), .btn1(btn1), .transmit(transmit));
trans T1 (.clk(clk), .reset(btn0),.transmit(trig),.TxD(TxD),.data(send));

reg [30:0] cntr=0;

//always @ (posedge clk)
//begin
//    if (cntr >= 100000000)
//    begin
//        cntr <= 0;
//        dataR[0] <= ~ dataR[0];
//        dataR[7] <= r;
//        dataR[6] <= feedback;
//    end
//    else cntr <= cntr + 1;
//end


//always @ (posedge baud)
//begin
//    dataR[7] <= ~dataR[7];
//    dataR[0] <= r;
//end

always @ (posedge baud)
begin
        if (cntr >= 1)begin
//        dataR[0] <= ~ dataR[0];
        dataR <= rnd[7:0];
        cntr <= 0;
        end
        else cntr <= cntr + 1;
end




endmodule