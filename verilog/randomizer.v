module randomizer (
    input clk,
    output wire feedback,
    output wire [12:0] rnd,
    output wire r
    );

reg [12:0]random = 13'hF;
reg [12:0] random_next = 0;
reg [12:0] random_done = 0;
reg [3:0] count = 0;
reg [3:0] count_next = 0;

reg trig = 0;
reg rn = 0;
reg hold= 0;

assign feedback = random[12] ^ random[3] ^ random[2] ^ random[0]; 
assign rnd = random;
assign r = rn;
always @ (posedge clk)
begin
hold = $random(random[12]);
rn <= $random;
if (trig)
 begin
  random <= 13'hF;
  count <= 0;
 end
 
else begin
  random <= random_next;
  count <= count_next;
 end
end

always @ (*)
begin
 random_next = random;
 count_next = count;
  
  random_next = {random[11:0], feedback};
  count_next = count + 1;

 if (count == 13)
 begin
  count = 0;
  random_done = random;
 end
 
end


endmodule



