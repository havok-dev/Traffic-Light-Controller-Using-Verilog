`timescale 1ns/1ps
module traffic_control_tb;

wire [2:0] M1,M2,MT,S,state;
reg clk,rst_a;

traffic_control DUT (M1,M2,MT,S,state,clk,rst_a);

initial
 begin
  clk=1'b1;
  forever #5 clk=~clk;
 end
 
initial
 begin
  rst_a=1'b1;
  #15;
  rst_a=1'b0;
  #1000;
  $stop;
 end
endmodule