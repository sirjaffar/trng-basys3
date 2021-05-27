`timescale 1ns / 1ps

//module trng(
//input clk,
//output wire bit,
//input [2:0]a
//);

//reg one = 1;
//reg zero = 0;

//wire m1;
//wire m2;
//wire m3;
//wire m4;
//wire m5;
//wire m6;
//wire m7;


//assign m1 = a[0] ? one : zero;
//assign m2 = a[0] ? one : zero;
//assign m3 = a[0] ? one : zero;
//assign m4 = a[0] ? one : zero;

//assign m5 = a[1] ? m1 : m2;
//assign m6 = a[1] ? m3 : m4;

//assign m7 = a[2] ? m5 : m6;
//assign bit = m7;

//always @ (posedge clk)
//begin
//    if (a0) begin m1 <= 1; m2 <= 1; m3 <= 1; m4 <= 1; end
//    else begin m1 <= 0; m2 <= 0; m3 <= 0; m4 <= 0; end
    
//    if (a1) begin m5 <= m1; m6 <= m3; end
//    else begin m5 <= m2; m6 <= m4; end
    
//    if (a2) begin m7 <= m5; end
//    else begin m7 <= m6; end
//end


//always @ (posedge clk)
//begin
//    bit <= m7;
//end





module trng (input [2:0]sel, input in1, input in2, output wire bit);

wire o1, o2, o3, o4, o5, o6;
wire out1, out2, out3, out4, out5, out6;

assign o1 = out1;
assign o2 = out2;
assign o3 = out3;
assign o4 = out4;
assign o5 = out5;
assign o6 = out6;


mux21 m1 (.in1(in1), .in2(in2), .sel(sel[0]), .out(out1));
mux21 m2 (.in1(in1), .in2(in2), .sel(sel[0]), .out(out2));
mux21 m3 (.in1(in1), .in2(in2), .sel(sel[0]), .out(out3));
mux21 m4 (.in1(in1), .in2(in2), .sel(sel[0]), .out(out4));

mux21 m5 (.in1(o1), .in2(o2), .sel(sel[1]), .out(out5));
mux21 m6 (.in1(o3), .in2(04), .sel(sel[1]), .out(out6));

mux21 m7 (.in1(o5), .in2(o6), .sel(sel[2]), .out(bit));











endmodule